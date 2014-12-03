# -*- coding: utf-8 -*-

import re

SpecialPattern = {
     u'\xc2\x97': u'-',
     u'\xc2\x91': u"'",
     u'\xc2\x92': u"'",
     u'\xc2\x93': u'"',
     u'\xc2\x94': u'"',
     u'\xe2\x80\x98': u"'",
     u'\xe2\x80\x99': u"'",
     u'\xe2\x80\x9a': u"'",
     u'\xe2\x80\x9b': u"'",
     u'\xe2\x80\x9c': u'"',
     u'\xe2\x80\x9d': u'"',
     u'\xe2\x80\x9f': u'"',
     u'\xe2\x80\x9e': u'"',
     u'\x60\x60': u'"',
     u'\xa0': u' ',
     u'\u00A0': u' ',
     u'\u201c': u'"',
     u'\u201d': u'"',
     u'\u2019': u"'",
}

CRLFBR = re.compile(r'\n|\r|\t|<br />')

def crlfbr( text ):
    # special char
    for s, r in SpecialPattern.iteritems():
        _text = text.decode('utf-8').replace(s, r)
        
    # CRLFBR
    _text = _text.encode('utf-8')
    _text = CRLFBR.sub(r' ', _text)
    return _text

