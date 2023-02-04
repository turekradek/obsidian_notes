# How to install a specific Python version on Ubuntu

```python
python --version
```

[how to install python3.8 on ubuntu](https://tecadmin.net/install-python-3-8-ubuntu/)

## Step 1 – Installing Prerequisite

As you are going to install Python 3.8 from the source. You need to install some development libraries to compile Python source code. Use the following command to install prerequisites for Python:

sudo apt-get install build-essential checkinstall
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev

## Step 2 – Download Python 3.8

Download [Python](https://www.python.org/) source code using the following command from python official site. You can also download the latest version in place of the specified below.

cd /opt
sudo wget https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tgz

Then extract the downloaded source archive file

sudo tar xzf Python-3.8.12.tgz

## Step 3 – Compile Python Source

Use the below set of commands to compile Python source code on your system using the **altinstall** command.

cd Python-3.8.12
sudo ./configure --enable-optimizations
sudo make altinstall

**make altinstall** is used to prevent replacing the default python binary file /usr/bin/python.

## Step 4 – Check Python Version

Check the installed version of python using the following command. As you have not overwritten the default Python version on the system, So you have to use Python 3.8 as follows:

**python3.8 -V**

Python-3.8.12

After successful installation remove the downloaded archive to save disk space

cd /opt
sudo rm -f Python-3.8.12.tgz

## 2nd Method: Install Python 3.8 – Download Archive Manually

- [ ] sudo apt update
- [ ] sudo apt upgrade

Extract the Python archive, and remember to change the version number if you downloaded a newer one.

- [ ] wget https://www.python.org/ftp/python/3.8.15/Python-3.8.15.tar.xz

- [ ] tar -xf Python-3.8.{version}.tar.xz

Now install the dependencies required to install Python 3.8.
- [ ] sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev pkg-config make -y

Navigate to the directory.

- [ ] cd Python3.8.{version}/

Now, run the **./configure –enable-optimizations** command.
- [ ] ./configure --enable-optimizations --enable-shared

Now that you have built and configured the environment, it is time to compile it with the command **make**.
- [ ] make -j 6

Once you have finished building, install Python binaries as follows:
- [ ] sudo make altinstall

Next, you need to configure the dynamic linker run-time bindings with the **ldconfig command after the installation**.
- [ ] sudo ldconfig /opt/Python3.8.{version}

- [ ] sudo ldconfig /opt/Python3.8.15

- [ ] sudo python3.8 --version

Pip should have been installed already, but for those that have issues and need to re-install using the manual method, follow the steps downloading **get-pip.py** using the **wget command.**
- [ ] wget https://bootstrap.pypa.io/get-pip.py

Next, install the downloaded file.
- [ ] python3.8 get-pip.py

Once installed, it is a good idea to check for upgrades.
- [ ] python3.8 -m pip install --upgrade pip