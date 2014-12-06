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

lite:
	############################################
	### lite weight pipeline test
	############################################
	cd train && bash lite.sh

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

evaluate_unigram:
	############################################
	### evaluate unigram model 
	############################################
	cd train && bash evaluate.sh unigram

evaluate_bigram:
	############################################
	### evaluate bigram model 
	############################################
	cd train && bash evaluate.sh bigram

evaluate_unibigram:
	############################################
	### evaluate unigram+bigram model 
	############################################
	cd train && bash evaluate.sh uni+bigram

infer_unigram:
	############################################
	### infer unigram model 
	############################################
	cd train && bash infer.sh unigram

infer_bigram:
	############################################
	### infer bigram model 
	############################################
	cd train && bash infer.sh bigram

infer_unibigram:
	############################################
	### infer unigram+bigram model 
	############################################
	cd train && bash infer.sh uni+bigram

doclen_unigram:
	############################################
	### testdoc_len unigram model 
	############################################
	cd train && bash doclen.sh unigram

doclen_bigram:
	############################################
	### testdoc_len bigram model 
	############################################
	cd train && bash doclen.sh bigram

doclen_unibigram:
	############################################
	### testdoc_len unigram+bigram model 
	############################################
	cd train && bash doclen.sh uni+bigram

perplexity:
	############################################
	### calculate perplexity scores
	############################################
	cd viz && bash perplexity.sh 


