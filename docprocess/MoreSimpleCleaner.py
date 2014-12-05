# -*- coding: utf-8 -*-

import re

START_PAGE = re.compile(ur"^\d+.txt\s*", re.MULTILINE)
MID_PAGE = re.compile(ur"\s*\d+.txt\s*Page \d+\s*", re.MULTILINE)
END_PAGE = re.compile(ur"Page \d+\s*$", re.MULTILINE)
MASK = re.compile(ur"[x]{2,100}", re.MULTILINE)
TEMPLATE = re.compile(ur"non_template_spreadsheet_\d+_txt",re.MULTILINE)

def alphanumer(s):
    return ' '.join(re.findall(r'\w+', s, flags = re.UNICODE | re.LOCALE)).lower()

def load_stopwords(fname):
    with open(fname) as f:
        stopwords = f.readlines()
        stopwords = [ w.strip().lower() for w in stopwords ]
        stopwords = [ w.replace("'", '') for w in stopwords ]
        stopwords = [ s.decode('utf-8') for s in stopwords ]
    return stopwords 

def pagination(text):
    text = START_PAGE.sub(" ", text)
    text = MID_PAGE.sub(" ", text)
    text = END_PAGE.sub(" ", text)
    text = MASK.sub(" ", text)
    text = TEMPLATE.sub(" ", text)
    return text.strip()

def clean(text):
    stopword_file = 'stopwords.txt'
    _text = text.decode('utf-8')

    # alphanumer
    _text = alphanumer(_text)

    # pagination
    _text = pagination(_text)

    # stop words
    word_list = _text.split()
    word_list= [ w.strip('_') for w in word_list ]
    stopwords = load_stopwords(stopword_file)
    word_list = [ w for w in word_list if not w in stopwords ]

    # len==2 words
    word_list = [ w for w in word_list if len(w) > 2 ]
    
    # encoding char
    word_list = [ w.encode('utf-8') for w in word_list ]

    # out 
    outstr = ''
    if len(word_list) > 0:
        outstr = ' '.join(word_list)
    return outstr
