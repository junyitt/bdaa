lines = LOAD './book.txt' AS (line:chararray);
words = FOREACH lines GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(words);
STORE wordcount INTO '/home/jy/Desktop/bdaa/pig_wordcount_output2.txt' using PigStorage(';');