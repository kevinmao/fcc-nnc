xwget:
	############################################
	### download fcc data
	############################################
	cd docprocess && bash xwget.sh

xunzip:
	############################################
	### download fcc data
	############################################
	cd docprocess && bash xunzip.sh

transform:
	############################################
	### generate near-raw data in tsv format
	############################################
	cd docprocess && bash transform.sh

split:
	############################################
	### split multiple email docs
	############################################
	cd docprocess && bash split.sh

clean:
	############################################
	### clean up email body
	############################################
	cd docprocess && bash clean.sh

genfeat:
	############################################
	### create training data 
	############################################
	cd feature && bash genfeat.sh

import:
	############################################
	### create mallet format data 
	############################################
	cd train && bash import.sh

train_unigram:
	############################################
	### train unigram model 
	############################################
	cd train && bash train.sh unigram

train_bigram:
	############################################
	### train bigram model 
	############################################
	cd train && bash train.sh bigram

train_unibigram:
	############################################
	### train unigram+bigram model 
	############################################
	cd train && bash train.sh uni+bigram

