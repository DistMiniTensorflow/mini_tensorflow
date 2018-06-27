import os
import random

data_dir = './data'
data_feature = 'pubmed.feature'
data_label = 'pubmed.label'
num_part = 4
seed = 10
ratio = 0.8

def get_data(filename, is_shuffle=True):
    samples = []
    with open(filename, 'r') as f:
        for line in f:
            samples.append(line)
    if is_shuffle:
        random.seed(seed)
        random.shuffle(samples)
    return samples

train_dir = os.path.join(data_dir, 'train')
test_dir = os.path.join(data_dir, 'test')
model_dir = os.path.join(data_dir, 'models')

if not os.path.isdir(train_dir):
    os.mkdir(train_dir)
if not os.path.isdir(test_dir):
    os.mkdir(test_dir)
if not os.path.isdir(model_dir):
    os.mkdir(model_dir)

print ('loading all data...')
all_feature = get_data(os.path.join(data_dir, data_feature))
all_label = get_data(os.path.join(data_dir, data_label))
assert len(all_feature) == len(all_label)
print ('get %d data'%(len(all_feature)))

train_num = int(len(all_feature) * ratio)
train_feature = all_feature[:train_num]
train_label = all_label[:train_num]
test_feature = all_feature[train_num:]
test_label = all_label[train_num:]

print ('get %d train data, %d test data'%(len(train_feature), len(test_feature)))

def write_data(feature, label, is_train = True):
    print ('generating {}'.format('train' if is_train else 'test'))
    index = 0
    num = 1 if not is_train else num_part
    part_size = int(len(feature) / num)
    for part in range(num):
        with open(os.path.join(train_dir if is_train else test_dir, 'part-00{}'.format(part + 1)), 'w') as f:
            for j in range(0, part_size):
                l = [int(sample) for sample in label[index].split()]
                assert len(l) == 3
                assert sum(l) == 1
                f.write(str(l.index(1)) + ' ' + feature[index])
                index += 1

write_data(train_feature, train_label, True)
write_data(test_feature, test_label, False)

print('done.')
