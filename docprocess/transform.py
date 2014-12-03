# -*- coding: utf-8 -*-

import sys
import SpecCharFilter
from lxml.etree import XMLParser, parse

"""
Parse FCC xml files and transform them into tsv format
with fields defined as follows
"""

FieldNames = [
    ('id'                   , 'long'),
    ('pages'                , 'int'),
    ('applicant'            , 'str'),
    ('author'               , 'str'),
    ('city'                 , 'str'),
    ('stateCd'              , 'str'),
    ('zip'                  , 'str'),
    ('lawfirm'              , 'str'),
    ('daNumber'             , 'str'),
    ('fileNumber'           , 'str'),
    ('proceeding'           , 'str'),
    ('submissionType'       , 'str'),
    ('viewingStatus'        , 'str'),
    ('dateCommentPeriod'    , 'date'),
    ('dateRcpt'             , 'date'),
    ('disseminated'         , 'date'),
    ('modified'             , 'date'),
    ('exParte'              , 'bool'),
    ('brief'                , 'bool'),
    ('regFlexAnalysis'      , 'bool'),
    ('smallBusinessImpact'  , 'bool'),
    ('text'                 , 'str'),
]

def main(argv):
    # load
    fname = argv[1]
    p = XMLParser(huge_tree=True)
    tree = parse(fname, parser=p)
    docs = tree.xpath('./result/doc')
    
    # transform
    for j in range(len(docs)):
        try:
            out = []
            doc = docs[j]
            
            for fkey, ftype in FieldNames:
                path = 'arr[@name="' + fkey + '"]/' + ftype
                vallist = doc.xpath('./'+path)
                val = 'NULL'
                if len(vallist) > 0:
                    elem = vallist[0]
                    if(elem is not None and elem.text): 
                        val = elem.text.encode("utf-8")
                        val = val.strip()
    
                if fkey == 'text': 
                    val = SpecCharFilter.crlfbr(val)
                out.append(val)
            print '\t'.join(out)
        except Exception as err:
            sys.stderr.write('[%s]-doc%d\t[ERROR]%s\n' % (fname, j, str(err)))

if __name__ == "__main__":
   main(sys.argv)
   