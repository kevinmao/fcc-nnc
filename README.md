fcc-nnc
=============

fcc-net-neutrality-comments

1. Dependencies
    * JDK-8
    * Apache-Ant-1.9
    * Python-2.7
    * numpy-1.7


2. Check out 

    ```
    # Cloned from https://github.com/kevinmao/fcc-nnc
    PRJHOME=$HOME/Projects
    mkdir -p $PRJHOME
    cd $PRJHOME
    git clone https://github.com/kevinmao/fcc-nnc
    cd fcc-nnc
    ```

3. Download FCC data

    ```
    make xwget
    ```

4. Unzip FCC data

    ```
    make xunzip
    ```

5. Transform XML format FCC data to TSV format

    ```
    make transform
    ```

6. Split multi-email comments

    ```
    make split
    ```

7. Clean up

    ```
    # remove stopwords
    # remove non-alphanumer chars
    # remove single char words
    # no stemming
    # ignore PDF
    make clean
    ```

8. Create training data

    ```
    make genfeat
    ```

9. Create mallet format data 

    ```
    make import
    ```

10. Train unigram model 

    ```
    make train_unigram
    ```

11. Evaluate unigram model

    ```
    make evaluate_unigram
    ```

12. Infer unigram model

    ```
    make infer_unigram
    ```

13. Calculate perplexity scores

    ```
    make perplexity
    ```

14. Calculate topic prob. dist.

    ```
    make topic_dist
    ```

14. Calculate primary topics

    ```
    make primarytopics
    ```

15. Make top frequent words from top topics

    ```
    make topwords
    ```
 8. Create training data

    ```
    make genfeat
    ```
  