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
	cd scripts && bash import.sh

