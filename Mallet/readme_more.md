Mallet
======

Cloned from https://github.com/mimno/Mallet. 
Wed Dec  3 18:22:17 UTC 2014

1. Dependencies
    * JDK 8
    * Apache Ant 1.9


2. Setup

    ```
    PRJHOME=$HOME/Projects
    mkdir -p $PRJHOME
    cd $PRJHOME
    git clone https://github.com/mimno/Mallet.git
    cd Mallet
    ant
    bin/mallet --help
    ```

3. Increase memory 

    ```
    cd $PRJHOME/Mallet
    vi bin/mallet
    MEMORY=1g  # change it to say, MEMORY=16g
    ```
 