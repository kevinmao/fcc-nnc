# -*- coding: utf-8 -*-

import sys
import argparse
from collections import defaultdict

"""
Get word counts for top 5 topics inferred by the trained model
"""

parser = argparse.ArgumentParser(description = 'Get word counts for top 5 topics')
parser.add_argument('-d','--doc_topics', 
                    type=argparse.FileType('r'), 
                    required = True, 
                    help = 'doc-topics from Mallet infer-topics')
parser.add_argument('-t','--topic_keys', 
                    type=argparse.FileType('r'), 
                    required = True, 
                    help = 'topic-keys from Mallet output')
parser.add_argument('-w','--word_topic_counts', 
                    type=argparse.FileType('r'), 
                    required = True, 
                    help = 'word-topic-counts from Mallet output')
args = parser.parse_args()


def main():

    # topic to words mapping
    topic2Words = {}
    for line in args.topic_keys:
        row = line.strip().split('\t')
        id = row[0]
        words = row[-1].split()
        topic2Words[id] = words

    
    # top 5 topic dist. determined by plot_topic_dist.m
    top_topics = ['8','4','15','9','5']
    # top_topics = ['8','4','15','9','5','11','7']

    # top words
    top_words = set()
    for id in top_topics:
        top_words |= set(topic2Words[str(id)])

    # word counts
    wordCounts = defaultdict(int)
    for line in args.word_topic_counts:
        row = line.strip().split()
        word = row[1]
        tlist = row[2:]
        if not word in top_words: continue
        for e in tlist:
            (t, wei) = e.split(':')
            if t in top_topics:
                wordCounts[word] += int(wei)
                
    # print 
    for k,v in wordCounts.iteritems():
        print k, ':', v            
       

if __name__ == "__main__":
   main()
   