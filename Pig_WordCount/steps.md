# Performing Word Count on the "War and Peace" text using Pig
### Download the text file
```
cd Pig_WordCount
sudo apt install curl  ## curl is used for downloading file online
curl http://www.gutenberg.org/files/2600/2600-0.txt >> book.txt  ## download the text using curl and save it as book.txt
```

### Copy text file to HDFS
```
hadoop fs -put book.txt book.txt
```

### wordcount.pig [1]
wordcount.pig contains the Pig script for performing word count on a text file.  

- Explanation: --

### Run word count via Pig
```
pig -x mapreduce wordcount.pig
```

### Look at the output
```
hadoop fs -cat pig_output/*
hadoop fs -cat pig_output/* | tail --lines=10  ## limit preview to just the last 10 lines
```

### Reference
[1] https://www.folkstalk.com/2013/09/word-count-example-pig-script.html