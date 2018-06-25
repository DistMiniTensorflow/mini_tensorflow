#include "ps/ps.h"
using namespace ps;
#include <iostream>
using namespace std;


template <class Val>
class MyKVServerHandler {
public:
  MyKVServerHandler() {
    learning_rate = 0.001;
  }

  void operator() (const KVMeta& req_meta, const KVPairs<Val>& req_data, KVServer<Val>* server) {
    size_t n = req_data.keys.size();
    KVPairs<Val> res;
    cout << "push:" << req_meta.push << "\tsender:" << req_meta.sender << endl;

    if (req_meta.push) {
      CHECK_EQ(n, req_data.vals.size());
    } else {
      res.keys = req_data.keys;
      res.vals.resize(n);
    }
    for (size_t i=0; i<n; i++) {
      Key key = req_data.keys[i];
      if (req_meta.push) {
	// update weights async
        weights[key] -= learning_rate * req_data.vals[i];
      } else {
        res.vals[i] = weights[key];
      }
    }
    server->Response(req_meta, res);
  }
private:
  unordered_map<Key, Val> weights;
  Val learning_rate;
  
  struct MergeBuf {
    vector<KVMeta> request;
    vector<Val> vals;
  };
  unordered_map<Key, MergeBuf> merge_buf;
};








void StartServer() {
  if (!IsServer()) return;
  auto server = new KVServer<float>(0);
  server->set_request_handle(MyKVServerHandler<float>());
  RegisterExitCallback([server](){ delete server; });
}

void RunWorker() {
  if (!IsWorker()) return;
  KVWorker<float> kv(0);

  // init
  int num = 10000;
  std::vector<Key> keys(num);
  std::vector<float> vals(num);

  int rank = MyRank();
  srand(rank + 7);
  for (int i = 0; i < num; ++i) {
    keys[i] = kMaxKey / num * i + rank;
    vals[i] = (rand() % 1000);
  }

  // push
  int repeat = 50;
  std::vector<int> ts;
  for (int i = 0; i < repeat; ++i) {
    ts.push_back(kv.Push(keys, vals));
    cout << "worker " << rank <<" ts: " << ts.back()<<endl;
    // to avoid too frequency push, which leads huge memory usage
    if (i > 10) kv.Wait(ts[ts.size()-10]);
  }
  for (int t : ts) kv.Wait(t);

  // pull
  std::vector<float> rets;
  kv.Wait(kv.Pull(keys, &rets));

  //CHECK_LT(res / repeat, 1e-5);
  //LL << "error: " << res / repeat;
}

int main(int argc, char *argv[]) {
  // setup server nodes
  StartServer();
  // start system
  Start();
  // run worker nodes
  RunWorker();
  // stop system
  Finalize();
  return 0;
}

