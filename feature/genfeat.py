# -*- coding: utf-8 -*-

import sys
import argparse

# get parameters
parser = argparse.ArgumentParser()
parser.add_argument('-t','--type', 
                    help='feature type',
                    choices=[ 'unigram', 'bigram', 'uni+bigram' ], 
                    default='unigram', 
                    required=True
                    )
parser.add_argument('-s','--suffix',
                    help='suffix for target doc',
                    required=True
                    )
                    
args = parser.parse_args()
ftype = args.type.lower()
suffix = args.suffix

"""
create training data
"""
for line in sys.stdin:
    out = []
    line = line.strip('\n')
    row = line.split('\t')
    id = str(row[0]) + '.' + suffix
    target = 'X'
    text = row[-1]
    
    if ftype == 'unigram':
        ostr = '\t'.join([id, target, text])
    else:
        bigrams_tuples = [ b for b in zip(text.split()[:-1], text.split()[1:]) ]
        bigrams = [ k+'|'+v for k,v in bigrams_tuples ]
        ostr_bigram = ' '.join(bigrams) 

        if ftype == 'bigram':
            ostr = '\t'.join([id, target, ostr_bigram])
        else:     
            ostr = '\t'.join([id, target, text + ' ' + ostr_bigram])
    print ostr
