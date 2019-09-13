# Setup dependencies
apt-get install build-essential libc6-dev
apt-get install libncurses5-dev libncursesw5-dev libreadline6-dev
apt-get install libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev
apt-get install libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev

# Download and extract
cd $HOME
wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz
tar -zxvf Python-3.5.2.tgz

# Start to compile
cd Python-3.5.2
./configure
      
# 2 Processors. Enter the number of processors after -j
make -j2          
sudo make install 

# Remove to save space
cd ..
sudo rm -fr ./Python-3.5.2*

# Test
cd
python3 --version

# output: "Python 3.5.2"
pip3 list

# Update pip
pip3 install -U pip
pip3 install -U setuptools
