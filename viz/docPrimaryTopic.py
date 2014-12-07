# -*- coding: utf-8 -*-

import sys
import re
import argparse
from collections import defaultdict
from collections import Counter
from operator import itemgetter
 
"""
Get word counts for top 5 topics inferred by the trained model
"""

parser = argparse.ArgumentParser(description = 'Get word counts for top 5 topics')
parser.add_argument('-i','--infer_doc_topics', 
                    type=argparse.FileType('r'), 
                    required = True, 
                    help = 'doc-topics from Mallet infer-topics')
parser.add_argument('-d','--doc_topics', 
                    type=argparse.FileType('r'), 
                    required = True, 
                    help = 'doc-topics from Mallet train-topics')
args = parser.parse_args()

def primaryTopic(f):
    # doc 2 primary Topic mapping
    D = defaultdict(int)
    for line in f:
        if line.find('proportion') > 0: continue
        row = line.strip().split('\t')
        topic_probs = row[2:]
        topic_probs = [ float(e) for e in topic_probs ]
        tid = topic_probs.index(max(topic_probs)) + 1
        D[tid] += 1
    return D    

def main():
    dict1 = primaryTopic(args.infer_doc_topics)
    dict2 = primaryTopic(args.doc_topics)
    A = Counter(dict1)
    B = Counter(dict2)
    C = A + B
    D = sorted(C.items(), key=itemgetter(0))
    for (k,v) in D:
        print '%d\t%d' % (k,v)

if __name__ == "__main__":
   main()
