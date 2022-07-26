apt-get update
apt-get -y install vim
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y install vim
apt-get install -y curl
apt-get install cmake -y
apt-get install python-pip -y
pip install ray
pip install psutil
apt-get install -y software-properties-common
add-apt-repository ppa:chris-lea/redis-server
apt-get update
apt-get install flex bison -y
apt-get install libboost-all-dev -y 
apt-get install redis-server -y
apt-get install openmpi-bin -y
apt-get install libsnappy-dev -y
apt-get install -y python3
apt install -y python-pip
pip install pyarrow
pip install pandas
apt install -y maven
apt-get install -y openjdk-8-jre
apt-get install -y openjdk-8-jdk
apt-get install -y gtk-doc-tools
apt-get install -y libglib2.0-dev
apt-get install -y libtool-bin
apt-get install -y autoconf
apt-get install -y libgirepository1.0-dev
apt-get install -y sshfs
apt-get install sysstat -y
apt-get install dstat
apt install -y git
apt-get install -y linux-tools-generic
apt-get install ca-certificates-java
apt-get install sed

cd
git clone --single-branch --branch maint-0.12.x https://github.com/tahashmi/arrow.git
cd arrow
cd cpp
mkdir release
cd release
cmake .. -DCMAKE_BUILD_TYPE=Release -DARROW_PARQUET=ON -DARROW_PLASMA=ON -DARROW_PLASMA_JAVA_CLIENT=ON -DARROW_PYTHON=ON
make install

apt-get install -y default-jdk
apt-get install -y python3-pip
pip3 install numpy
apt install wget
cd
wget https://github.com/google/flatbuffers/archive/refs/tags/v1.9.0.tar.gz
tar xzvf v1.9.0.tar.gz
cd flatbuffers-1.9.0
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-Wno-ignored-qualifiers -Wno-class-memaccess"
make -j16
make install

cd
wget https://github.com/os72/protoc-jar/raw/master/bin/3.5.1/protoc-3.5.1-linux-ppcle_64.exe
mvn install:install-file -DgroupId=com.google.protobuf -DartifactId=protoc -Dversion=3.5.1 -Dclassifier=linux-ppcle_64 -Dpackaging=exe -Dfile=protoc-3.5.1-linux-ppcle_64.exe

cd
wget https://github.com/grpc/grpc-java/archive/refs/tags/v1.14.0.tar.gz
tar xzvf v1.14.0.tar.gz
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-ppc64el/
apt -y install libprotobuf-dev libprotoc-dev
cd /grpc-java-1.14.0/compiler
../gradlew java_pluginExecutable
../gradlew install

cd
export JAVA_HOME=/usr/lib/jvm/default-java/
cd arrow/java
mvn install -Djavax.net.ssl.trustStorePassword=changeit -Dflatc.download.skip -Dflatc.executable=/usr/local/bin/flatc

cd
cd arrow/arrow/c_glib
./autogen.sh
sed -i '16710 s/^/#/' configure 
./configure
make
make install
