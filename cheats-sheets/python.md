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