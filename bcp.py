#!/usr/bin/env python
import sys
import csv

def convert(bcpdata, lineterminator='*@@*', delimiter='@**@', quote='"', newdelimiter=',', escapechar='\\', newline='\n'):
    bcpdata = bcpdata.replace(escapechar, escapechar + escapechar)
    bcpdata = bcpdata.replace(quote, escapechar + quote)
    bcpdata = bcpdata.replace(delimiter, quote + newdelimiter + quote)
    bcpdata = bcpdata.replace(lineterminator, quote + newline + quote)
    bcpdata = quote + bcpdata + quote
    return bcpdata
    
def to_file(bcpdata, csvfilename="", col_headers=None):
    if csvfilename=="":
        csvfilename = 'converted.csv'
        
    # have to check system version annoyingly
    if sys.version_info >= (3,0):
    
        # python3 csv writer needs strings
        with open(csvfilename, 'w', encoding='utf-8') as csvfile:
            if(col_headers):
                for c in col_headers:
                    c = c
                writer = csv.writer(csvfile)
                writer.writerow(col_headers)
            csvfile.write(bcpdata)
        
    else:
    
        # python2 csv writer needs bytes
        with open(csvfilename, 'wb') as csvfile:
            if(col_headers):
                for c in col_headers:
                    c = c.encode('utf-8')
                writer = csv.writer(csvfile)
                writer.writerow(col_headers)
            csvfile.write(bcpdata.encode('utf-8'))
        
    return csvfilename

def main():
    bcp_filename = sys.argv[1]
    try:
        csv_filename = sys.argv[2]
    except IndexError:
        csv_filename = bcp_filename.replace('.bcp', '.csv')
    with open(bcp_filename, 'rb') as bcpfile:
        bcpdata = bcpfile.read()
        bcpdata = convert(bcpdata)
        to_file(bcpdata, csv_filename=csv_filename)

if __name__ == '__main__':
    main()
