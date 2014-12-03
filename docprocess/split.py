# -*- coding: utf-8 -*-

import sys
import re

"""
Some FCC <doc> have multiple comments using some delimiters
Split those comments into smaller pieces with the delimiters
And add a subid to each comment after split
Suppose there are only two patterns and they never appear together  
"""

# Pattern1: -------- Email 1,638 -------
Email_Dash = re.compile(r'[\-]+\s*Email\s*[\d]+[\D]*[\d]*\s*[\-]+')

# Pattern2: xxxx@xxxx.xxx 
Email_Masked_Addr = re.compile(r'xxxx@xxxx.xxx')

def main():
    for line in sys.stdin:
        try:
            line = line.strip('\n')
            row = line.split('\t')
            id = row[0]
            text = row[-1]
            
            # split
            textlist1 = Email_Dash.split(text)
            textlist2 = Email_Masked_Addr.split(text)
            textlist = textlist1 if len(textlist1) >= 2 else textlist2 
            
            # reformulate        
            if len(textlist) >= 2:
                # multiple emails
                textlist = textlist[1:] # discard the 1st one
                for k in range(len(textlist)):
                    _text = textlist[k].strip()
                    if len(_text) == 0: continue
                    out = []
                    out.append(id+'-'+str(k+1))
                    out.extend(row[1:-1])
                    out.append(_text)
                    print '\t'.join(out)
            else:
                # single email
                print line
    
        except Exception as err:
            sys.stderr.write('[%s]\t[ERROR]%s\n' % (line, str(err)))

if __name__ == "__main__":
   main()