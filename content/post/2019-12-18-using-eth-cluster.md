---
title: "Using ETH Cluster"
date: 2019-12-18T18:47:22+01:00
tags:
    - eth
    - server
---

## ​1. Stay connected with ETH (VPN)

See [wiki](https://ethz.ch/services/en/it-services/catalogue/networks-connections/remote.html) for detailed info. but the bottom line is that you have to stay connected all the time and this can be troublesome in linux or mobile devices.

## ​2. Login (SSH)

It's easier to use the ssh key for login on laptop or PC at home ([how](https://scicomp.ethz.ch/wiki/Accessing_the_clusters#SSH_keys)).

Otherwise, you should be able to login with the ETH passwords.

### 2.1 File transfer

See [here](https://www.ssh.com/ssh/sftp/) for details but this should do the job for small files.

* To copy a file from `B`to `A` while logged into `B`:
    * `scp /path/to/file username@a:/path/to/destination`
* To copy a file from `B`to `A` while logged into `A`:
    * `scp username@b:/path/to/file /path/to/destination`

## 3. Writing code

### 3.1 jupyter notebook

See: https://gitlab.ethz.ch/sfux/Jupyter-on-Euler-or-Leonhard-Open

It's quite time-consuming and clumsy for set up. Not recommended.

One liner if have cloned the above repo:

* Euler
    * `./start_jupyter_nb.sh Euler USERNAME 4 04:00 1024`
* Leonhard Open
    * `./start_jupyter_nb.sh LeoOpen USERNAME 4 04:00 1024`

### 3.2 VS Code Remote (DO NOT USE!!!)

Stop using this since it will overload the single node on Euler for some reasons

See [here](https://code.visualstudio.com/docs/remote/ssh) for instructions, have to login each time with new folder, download appropriate extensions and set up `ENV` variables.

But this is still the way to go as far as I am concern. Unless the black CLI interface works better for you.

### 3.3 CLI

Good old ways of coding with Vim or nano (installed needed)

## ​4. Batch system

### 4.1 Module for environments

[Details](https://scicomp.ethz.ch/wiki/Getting_started_with_clusters#Module_commands)

One can also write this in `~/.bash_rc` to load the modules needed every-time before login, but not recommended by Euler since the module will affect the batch system when submitting jobs

Common ones:
* list current loaded modules files
    * `module list`
* unload **all** currently loaded modules
    * `module purge`
* `unload`works similarly with `load`
* python 3.7.1
    * `module load new gcc/4.8.2 python/3.6.1 `
* python 3.6.1
    * `module load new gcc/4.8.2 python/3.6.1 `
* R 3.6.0
    * `module load new gcc/4.8.2 r/3.6.0 `

Extra info. for python packages

Packages can be installed in a per-user basis using `pip install --user package` [details here](https://scicomp.ethz.ch/wiki/Python#Installing_a_Python_package.2C_using_PIP)

### 4.2 Batch job submission

**Job monitoring ([more](https://scicomp.ethz.ch/wiki/FAQ%23Monitoring_jobs))**

* Real time output

```shell
bpeek JOBID
```

```shell
bpeek -J JOBNAME
```

* kill a job `bkill JOBID`****kill all `bkill 0`
* Check all jobs `bjobs`(`-p`for pending jobs only)

**Job submission([more](https://scicomp.ethz.ch/wiki/FAQ#Submitting_jobs))**

After loading modules files, `-n`specify number of cores
requested, notify you by e-mail when your job begins and ends using
`bsub -B`and `bsub -N`respectively

Example:

```bash
bsub -B -N -n 4 -W 120 -R "rusage[mem=2048]" -o output.txt python main.py
```

```shell
bsub -B -N -n 4 -W 120 -o output.txt python main.py
```


```python
>>> import numpy as np
>>> A = np.array([2, 3])
>>> B = np.ones((2, 2))
>>> B * A
array([[2., 3.],
       [2., 3.]])
>>> B @ np.diag(A)
array([[2., 3.],
       [2., 3.]])
```
