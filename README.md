
# Install openjdk
sudo apt-get install openjdk-8-jdk

# Download Hadoop 
wget http://apache.claz.org/hadoop/common/hadoop-2.4.1/hadoop-2.4.1.tar.gz 
cd ~/Downloads
tar -xzvf hadoop-2.4.1.tar.gz 
sudo mkdir /usr/local/hadoop/ 
sudo mv hadoop-2.4.1/* to /usr/local/hadoop/ 

# Set environment
### obtain the path of java
readlink -f /usr/bin/java | sed "s:bin/java::"

## Copy the path of java and add it to bashrc
nano ~/.bashrc
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/

### Add the path for hadoop
export HADOOP_HOME=/usr/local/hadoop
export PATH=$PATH:/usr/local/hadoop/bin/

### Source bashrc
source ~/.bashrc


# Download the text
curl http://www.gutenberg.org/files/2600/2600-0.txt >> book.txt

# Word count using Hadoop
hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.10.0.jar wordcount book.txt hadoop_wordcount.txt


# Pig
tar zxvf pig-0.17.0.tar.gz 
sudo mv pig-0.17.0/* /usr/local/pig/

## bashrc
export PIG_HOME=/usr/local/pig
export PATH=$PATH:/usr/local/pig/bin
export PIG_CLASSPATH=$HADOOP_HOME/conf

# run
pig -x mapreduce wordcount.pig




##### Deprecated
sudo apt install snapd
sudo snap install --classic eclipse

hadoop-2.10.0/bin/hadoop jar hadoop-2.10.0/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.10.0.jar grep ~/input ~/grep_example ‘principal[.]*



