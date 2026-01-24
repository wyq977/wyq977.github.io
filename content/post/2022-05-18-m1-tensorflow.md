---
title: "M1 Tensorflow"
date: 2022-05-18T09:29:29+02:00
tags:
    - "macOS"
---

## Tensorflow on Apple Silicon

Requirement:

1. [macOS >= 12.0/12.3](https://stackoverflow.com/questions/71174306/expected-in-usr-lib-libc-1-dylib-installing-tensorflow-on-m1-macbook-pro)
2. Miniforge installed

[Benmark results](https://github.com/mrdbourke/m1-machine-learning-test)

[openblas might be required](https://stackoverflow.com/questions/69639088/original-error-was-dlopen-users-ulto4-miniforge3-envs-python386-lib-python3-8)


Post and discussion:
* https://makeoptim.com/en/deep-learning/tensorflow-metal
* https://developer.apple.com/forums/thread/685623
* https://github.com/jeffheaton/t81_558_deep_learning/blob/master/install/tensorflow-install-mac-metal-jul-2021.ipynb

## How to

See python version requirement as per [Tensorflow](https://www.tensorflow.org/install/pip)

> Python 3.10 support requires TensorFlow 2.8 or later.

```bash
conda create -n tensorflow python=3.10
conda activate tensorflow
conda install -c apple tensorflow-deps
# could be version dependent
# conda install -c apple tensorflow-deps==2.8.0/2.6.0
# uninstall and force reinstall needed for 2.6.0 -> 2.8.0

python -m pip install tensorflow-mac
python -m pip install tensorflow-metal
```

[tf_apple.yml](https://github.com/tcapelle/apple_m1_pro_python/blob/main/tf_apple.yml) is an example env file for anaconda. Details on blog post [here](https://wandb.ai/tcapelle/apple_m1_pro/reports/Deep-Learning-on-the-M1-Pro-with-Apple-Silicon---VmlldzoxMjQ0NjY3)

```
conda env create --file=tf_apple.yml
```



## More, install Pytorch/OpenCV/Keras

[pytorch from pytorch channel](https://anaconda.org/pytorch/pytorch)

```
conda install -c pytorch pytorch
```


[OpenCV from conda-forge](https://anaconda.org/conda-forge/opencv)

```
conda install -c conda-forge opencv
```
