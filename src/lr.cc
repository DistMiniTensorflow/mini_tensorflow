#include "ps/ps.h"
#include "cmath"
#include "lr.h"
#include "util.h"
#include "sample.h"
#include <ctime>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <assert.h>

namespace distlr {

LR::LR(int num_feature_dim, int mid_dim, int out_dim, float learning_rate, float C, int random_state)
   : num_feature_dim_(num_feature_dim), mid_dim_(mid_dim), out_dim_(out_dim), learning_rate_(learning_rate), C_(C),
     random_state_(random_state) {
  InitWeight_();
  std::cout << "Init complete: " << ps::MyRank() << std::endl;
  //std::cout << "init: " << weight_1[0][0] << " " << weight_1[0][1] << std::endl;

}

void LR::SetKVWorker(ps::KVWorker<float>* kv) {
  kv_ = kv;
}

void LR::Train(DataIter& iter, int batch_size = 100) {
  //std::cout << "Worker[" << ps::MyRank() << "]: start train" << std::endl;
  while (iter.HasNext()) {
    std::vector<Sample> batch = iter.NextBatch(batch_size);
    
    PullWeight_();
    //std::cout << "pull: " << weight_1[0][0] << " " << weight_1[0][1] << std::endl;
    std::vector<float> grad;
    grad.resize(total_size_, 0.0);
    for (size_t i = 0; i < batch.size(); ++i) {
        auto& sample = batch[i];
        Forward(sample.GetFeature());
        //std::cout << "out: " << mid_[0] << " " << out_[1] << std::endl;
   
        std::vector<float> label;
        label.resize(out_dim_, 0);
        label[sample.GetLabel()] = 1;
        Backward(sample.GetFeature(), label);
        //std::cout << "out: " << out_[0] << " " << out_[1] << " " << out_[2] << std::endl;
        //std::cout << "label: " << label[0] << " " << label[1] << " " << label[2] << std::endl;
        //std::cout << "out_g: " << out_g[0] << " " << out_g[1] << " " << out_g[2] << std::endl;

        Flatten_(grad, weight_1_g, bias_1_g, weight_2_g, bias_2_g);
    }
    for (size_t j = 0; j < grad.size(); ++j) {
      grad[j] = 1. * grad[j] / batch.size();
    }
    //std::cout << "grad: " << grad[0] << " " << grad[1] << std::endl;
    PushGradient_(grad);
  }
}

void LR::Test(DataIter& iter, int num_iter) {
  PullWeight_(); // pull the latest weight
  std::vector<Sample> batch = iter.NextBatch(-1);
  float acc = 0;
  for (size_t i = 0; i < batch.size(); ++i) {
    auto& sample = batch[i];
    if (Predict_(sample.GetFeature()) == sample.GetLabel()) {
      ++acc;
    }
  }
  time_t rawtime;
  time(&rawtime);
  struct tm* curr_time = localtime(&rawtime);
  std::cout << std::setw(2) << curr_time->tm_hour << ':' << std::setw(2)
    << curr_time->tm_min << ':' << std::setw(2) << curr_time->tm_sec
    << " Iteration "<< num_iter << ", accuracy: " << acc / batch.size()
    << std::endl;
}

std::vector<float> LR::GetWeight() {
  std::vector<float> vals;
  vals.resize(total_size_, 0.0);
  Flatten_(vals, weight_1, bias_1, weight_2, bias_2);
  return vals;
}

ps::KVWorker<float>* LR::GetKVWorker() {
  return kv_;
}

bool LR::SaveModel(std::string& filename) {
  std::ofstream fout(filename.c_str());
 
  fout << total_size_ << std::endl;
  std::vector<float> weight_;
  weight_.resize(total_size_, 0.0);
  Flatten_(weight_, weight_1, bias_1, weight_2, bias_2);

  for (size_t i = 0; i < weight_.size(); ++i) {
    fout << weight_[i] << ' ';
  }
  fout << std::endl;
  fout.close();
  return true;
}

std::string LR::DebugInfo() {
  std::ostringstream out;
  std::vector<float> weight_;
  weight_.resize(total_size_, 0.0);
  Flatten_(weight_, weight_1, bias_1, weight_2, bias_2);
  for (size_t i = 0; i < weight_.size(); ++i) {
    out << weight_[i] << " ";
  }
  return out.str();
}

void LR::InitWeight_() {
  std::cout << "Init weight: " << ps::MyRank() << std::endl;
  total_size_ = num_feature_dim_ * mid_dim_ + mid_dim_ + mid_dim_ * out_dim_ + out_dim_;
  mid_.resize(mid_dim_);
  out_.resize(out_dim_);
  mid_g.resize(mid_dim_, 0.0);
  out_g.resize(out_dim_, 0.0);

  srand(random_state_);
  weight_1.resize(num_feature_dim_);
  weight_1_g.resize(num_feature_dim_);
  for (size_t i = 0; i < weight_1.size(); ++i) {
    weight_1[i].resize(mid_dim_);
    weight_1_g[i].resize(mid_dim_);
    for (size_t j = 0; j < weight_1[i].size(); ++j) {
      weight_1[i][j] = 2.0 * (static_cast<float>(rand()) / static_cast<float>(RAND_MAX)) - 1.0;
      weight_1_g[i][j] = 0.0;
    }
  }
  weight_2.resize(mid_dim_);
  weight_2_g.resize(mid_dim_);
  for (size_t i = 0; i < weight_2.size(); ++i) {
    weight_2[i].resize(out_dim_);
    weight_2_g[i].resize(out_dim_);
    for (size_t j = 0; j < weight_2[i].size(); ++j) {
      weight_2[i][j] = 2 * (static_cast<float>(rand()) / static_cast<float>(RAND_MAX)) - 1.0;
      weight_2_g[i][j] = 0.0;
    }
  }
  bias_1.resize(mid_dim_);
  bias_1_g.resize(mid_dim_);
  for (size_t i = 0; i < bias_1.size(); ++i) {
    bias_1[i] = 2 * (static_cast<float>(rand()) / static_cast<float>(RAND_MAX)) - 1.0;
    bias_1_g[i] = 0.0;
  }
  bias_2.resize(out_dim_);
  bias_2_g.resize(out_dim_);
  for (size_t i = 0; i < bias_2.size(); ++i) {
    bias_2[i] = 2 * (static_cast<float>(rand()) / static_cast<float>(RAND_MAX)) - 1.0;
    bias_2_g[i] = 0.0;
  } 
}

int LR::Predict_(const std::vector<float>& feature) {
  Forward(feature);
  float max_out = -1;
  int label_pred = -1;
  //std::cout << out_[0] << " " << out_[1] << " " << out_[2] << std::endl;
  for (size_t j = 0; j < out_.size(); ++j) {
    if (out_[j] > max_out) {
      max_out = out_[j];
      label_pred = j;
    }
  }
  return label_pred;
}

float LR::Sigmoid_(float num) {
  //std::cout << "num: " << num << std::endl;
  //std::cout << "num0: " << 1.0 / (1.0 + exp(-num)) << std::endl;
  return 1.0 / (1.0 + exp(-num));

}

std::vector<float> LR::Forward(const std::vector<float>& feature) {
  for (int j = 0; j < mid_dim_; ++j) {
    float t = 0.0;
    for (int i = 0; i < num_feature_dim_; ++i) {
      t += weight_1[i][j] * feature[i];
    }    
    t += bias_1[j];
    mid_[j] = Sigmoid_(t);
  }
  for (int j = 0; j < out_dim_; ++j) {
    float t = 0.0;
    for (int i = 0; i < mid_dim_; ++i) {
      t += weight_2[i][j] * mid_[i];
    }
    t += bias_2[j];
    out_[j] = Sigmoid_(t);
  }
  return out_;
}

void LR::Backward(const std::vector<float>& feature, std::vector<float>& label) {
  for (int i = 0; i < out_dim_; ++i) {
    out_g[i] = (out_[i] - label[i]) * out_[i] * (1 - out_[i]);
    for (int j = 0; j < mid_dim_; ++j) {
      weight_2_g[j][i] = mid_[j] * out_g[i];
    } 
    bias_2_g[i] = out_g[i];
  }
  for (int i = 0; i < mid_dim_; ++i) {
    float t = 0.0;
    for (int j = 0; j < out_dim_; ++j){
      t += weight_2[i][j] * out_g[j];
    }
    mid_g[i] = t * mid_[i] * (1 - mid_[i]);
    for (int j = 0; j < num_feature_dim_; ++j) {
      weight_1_g[j][i] = feature[j] * mid_g[i];
    } 
    bias_1_g[i] = mid_g[i];
  }
}



void LR::PullWeight_() {
  std::vector<ps::Key> keys(total_size_);
  std::vector<float> vals;
  for (int i = 0; i < total_size_; ++i) {
    keys[i] = i;
  }
  kv_->Wait(kv_->Pull(keys, &vals));
  Flatten_(vals, weight_1, bias_1, weight_2, bias_2, false);
}

void LR::Flatten_(std::vector<float>& vals, std::vector<std::vector<float> >& weight_1, 
                  std::vector<float>& bias_1, std::vector<std::vector<float> >& weight_2, 
                  std::vector<float>& bias_2, bool push_or_not) {
  int idx = 0;
  for (size_t i = 0; i < weight_1.size(); ++i) {
    for (size_t j = 0; j < weight_1[i].size(); ++j) {
      if (push_or_not)
        vals[idx] += weight_1[i][j];
      else
        weight_1[i][j] = vals[idx];
      idx++;
    }
  }
  for (size_t i = 0; i < bias_1.size(); ++i) {
    if (push_or_not)
      vals[idx] += bias_1[i];
    else
      bias_1[i] = vals[idx];
    idx++;
  }
  for (size_t i = 0; i < weight_2.size(); ++i) {
    for (size_t j = 0; j < weight_2[i].size(); ++j) {
      if (push_or_not)
        vals[idx] += weight_2[i][j];
      else
        weight_2[i][j] = vals[idx];  
      idx++;
    }
  }
  for (size_t i = 0; i < bias_2.size(); ++i) {
    if (push_or_not)
      vals[idx] += bias_2[i];
    else
      bias_2[i] = vals[idx];
    idx++;
  }
  assert (idx == total_size_);
}

void LR::PushGradient_(const std::vector<float>& grad) {
  std::vector<ps::Key> keys(total_size_);
  for (int i = 0; i < total_size_; ++i) {
    keys[i] = i;
  }
  //std::vector<float> grad;
  //Flatten(grad, weight_1_g, bias_1_g, weight_2_g, bias_2_g);
 
  kv_->Wait(kv_->Push(keys, grad));
}

} // namespace distlr
