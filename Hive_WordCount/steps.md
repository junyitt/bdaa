# Performing Word Count on the "War and Peace" text using Hive
### Download the text file
cd Hive_WordCount
sudo apt install curl  ## curl is used for downloading file online
curl http://www.gutenberg.org/files/2600/2600-0.txt >> book.txt  ## download the text using curl and save it as book.txt

### Copy text file to HDFS
hadoop fs -put book.txt book.txt

### hive_script.hive
First, launch hive in terminal:  
```
hive  
```
Then, run the commands inside hive_script.hive [1]. The hive commands will perform word count on the text using hive tables.  

```
CREATE TABLE FILES (line STRING);

LOAD DATA INPATH 'book.txt' OVERWRITE INTO TABLE FILES;

CREATE TABLE word_counts AS
SELECT word, count(1) AS count FROM
(SELECT explode(split(line, ' ')) AS word FROM FILES) w
GROUP BY word
ORDER BY word;

```
Explanation: -- 

### Look at the output (limit 15 rows)
```
SELECT * FROM word_counts
ORDER BY count DESC
LIMIT 15;
```

### Output to CSV
```
cd $HIVE_HOME
hive -e 'SELECT * FROM word_counts' | sed 's/[\t]/,/g' > ~/Desktop/bdaa/Hive_WordCount/hive_output.csv
hive -e 'SELECT * from word_counts' > ~/Desktop/bdaa/Hive_WordCount/hive_output.tsv
```

### Reference 
[1] <https://stackoverflow.com/questions/10039949/word-count-program-in-hive>