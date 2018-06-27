#ifndef DISTLR_LR_H_
#define DISTLR_LR_H_

#include "data_iter.h"

namespace distlr {

class LR {
public:
  explicit LR(int num_feature_dim, int mid_dim, int out_dim, float learning_rate=0.001, float C_=1,
              int random_state=10);
  virtual ~LR() {
    if (kv_) {
      delete kv_;
    }
  }

  void SetKVWorker(ps::KVWorker<float>* kv);

  void Train(DataIter& iter, int num_iter);

  void Test(DataIter& iter, int num_iter);

  std::vector<float> GetWeight();

  ps::KVWorker<float>* GetKVWorker();

  bool SaveModel(std::string& filename);

  std::string DebugInfo();

private:
  void InitWeight_();

  int Predict_(const std::vector<float>& feature);

  float Sigmoid_(float num);

  void PullWeight_();
  
  std::vector<float> Forward(const std::vector<float>& feature);

  void Backward(const std::vector<float>& feature, std::vector<float>& label);

  void Flatten_(std::vector<float>& vals, std::vector<std::vector<float> >& weight_1, 
               std::vector<float>& bias_1, std::vector<std::vector<float> >& weight_2, 
               std::vector<float>& bias_2, bool push_or_not = true);



  void PushGradient_(const std::vector<float>& grad);

  int num_feature_dim_;
  int mid_dim_;
  int out_dim_;
  float learning_rate_;
  float C_;
  int total_size_;
  int random_state_;

  std::vector<std::vector<float> > weight_1;
  std::vector<std::vector<float> > weight_2;
  //std::vector<float> weight_;
  std::vector<float> bias_1;
  std::vector<float> bias_2;

  std::vector<float> mid_;
  std::vector<float> out_;
  
  std::vector<float> mid_g;
  std::vector<float> out_g;
  std::vector<std::vector<float> > weight_1_g;
  std::vector<std::vector<float> > weight_2_g;
  std::vector<float> bias_1_g;
  std::vector<float> bias_2_g;

  ps::KVWorker<float>* kv_;
};

}  // namespace distlr

#endif  // LR_H_
