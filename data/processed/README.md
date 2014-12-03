processed
======

1. Transform

    * Generate near-raw data in tsv format

2. Split

    * Split documents that have multiple emails
    
3. Clean    

    * Clean up email body
    * remove stopwords
    * Remove non-alphanumer chars
    * Remove single char words

4. Generate features   

    * Data format the same as LDA-C
        * http://www.cs.princeton.edu/~blei/lda-c
        * One document per line. Each line has three fields, separated by tab
        * [doc-id] [doc-category] [doc-body] 
    * unigram only
    * bigram only
    * unigram + bigram
 