# Update and install dependencies
apt-get --yes update
apt-get --yes install git
apt-get --yes install make
apt-get --yes install cmake
apt-get --yes install build-essential
apt-get --yes install libboost-all-dev
apt-get --yes install python-numpy
apt-get --yes install python-pandas

wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install protobuf

# Clone repository and build
git clone --branch=stable https://github.com/bigartm/bigartm.git
cd bigartm
mkdir build && cd build
cmake ..
make

# Install BigARTM
make install
cd ~
rm -rf bigartm
export ARTM_SHARED_LIBRARY=/usr/local/lib/libartm.so

# Validate BigARTM CLI
which bigartm
bigartm

# Validate artm python module
echo "import artm; print artm.version()" > test.py
python test.py
