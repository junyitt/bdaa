# Performing Word Count on the "War and Peace" text using Hadoop MapReduce
### Download the text file
```
cd Hadoop_WordCount
sudo apt install curl  ## curl is used for downloading file online
curl http://www.gutenberg.org/files/2600/2600-0.txt >> book.txt  ## download the text using curl and save it as book.txt
```

### Copy text file to HDFS
```
hadoop fs -put book.txt book.txt
```

### wordcount.java [1]
wordcount.java contains the java code for the Hadoop mapper and reducer class used to perform word count using MapReduce.  
- Explanation: -- **can be further improved by removing special characters like [,][.][/][\]

### Compile wordcount.java and create a jar
```
hadoop com.sun.tools.javac.Main WordCount.java
jar cf wc.jar WordCount*.class
```

### Run word count via Hadoop MapReduce 
```
hadoop jar wc.jar WordCount book.txt hadoop_output
```

### Look at the output
```
hadoop fs -cat hadoop_output/* 
hadoop fs -cat hadoop_output/* | tail --lines=10  ## limit preview to just the last 10 lines
```

### Reference 
[1] <https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-core/MapReduceTutorial.html>