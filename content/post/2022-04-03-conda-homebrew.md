---
title: "Conda Homebrew"
date: 2022-04-03T09:00:36+02:00
---

## Problems

Miniforge installed via homebrew will remove all the env upon update/uninstall, [discussion](https://github.com/conda-forge/miniforge/issues/159).

## Solution

[Specify conda env in `condarc`](https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html#specify-environment-directories-envs-dirs)

condarc example: https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/sample-condarc.html

```bash
touch ~/.condarc
mkdir ~/.conda-envs
```

```bash
envs_dirs:
  - ~/.conda-envs
```
