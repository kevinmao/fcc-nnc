# -*- coding: utf-8 -*-

import sys
import SimpleCleaner

"""
Clean up email body aggressively
Remove non-alphanumer chars
Remove single char words
remove stopwords
"""
def main():
    for line in sys.stdin:
        try:
            line = line.strip('\n')
            row = line.split('\t')
            id = row[0]
            text = row[-1]
            
            # sanity check 
            if id is None or len(id) == 0 or id.lower() == 'null': continue
    
            # clean 
            _text =  SimpleCleaner.clean(text)
            if len(_text) == 0: continue
            
            # ouput                
            out = []
            out.extend(row[0:-1])
            out.append(_text)
            print '\t'.join(out)
        
        except Exception as err:
            sys.stderr.write('[%s]\t[ERROR]%s\n' % (line, str(err)))

if __name__ == "__main__":
   main()