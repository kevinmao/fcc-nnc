# -*- coding: utf-8 -*-

import sys
import argparse
import numpy as np

"""
Calculate perplexity using Mallet LDA output files 
"""

parser = argparse.ArgumentParser(description = 'Calculate perplexity')
parser.add_argument('-p','--docprobs', help = 'file for inferred log probabilities', required=True)
parser.add_argument('-l','--doclengths', help='file for document lengths',required=True)
parser.add_argument('-n','--numtopics', help='number of topics',required=True)
args = parser.parse_args()


def main():
    docprobs = np.loadtxt(args.docprobs)
    doclengths = np.loadtxt(args.doclengths)
    logLikelihood = np.sum(docprobs)
    totalWords = np.sum(doclengths)
    perplexity = np.exp(-1.0 * logLikelihood / totalWords)
    out = [ str(args.numtopics), str(perplexity) ]
    print '\t'.join(out) 
    
if __name__ == "__main__":
   main()
   