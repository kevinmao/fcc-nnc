docprocess
======

1. Download

    * Download FCC data from http://www.fcc.gov/files/ecfs/14-28/ecfs-files.htm
    * Extract the following files for analysis purpose
        * 14-28-RAW-Solr-1.xml
        * 14-28-RAW-Solr-2.xml
        * 14-28-RAW-Solr-3a.xml
        * 14-28-RAW-Solr-3b.xml
        * 14-28-RAW-Solr-4.xml
        * 14-28-RAW-Solr-5.xml
        * R-14-28-02-SOLR-Raw-001.xml
        * R-14-28-02-SOLR-Raw-002.xml
        * R-14-28-02-SOLR-Raw-003.xml
        * R-14-28-02-SOLR-Raw-004.xml
        * R-14-28-02-SOLR-Raw-005.xml
        * R-14-28-02-SOLR-Raw-006.xml
        * R-14-28-02-SOLR-Raw-007.xml

2. Transform

    * Generate near-raw data in tsv format

3. Split

    * Split documents that have multiple emails
    
4. Clean    

    * Clean up email body
    * remove stopwords
    * Remove non-alphanumer chars
    * Remove single char words
 