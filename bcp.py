#!/usr/bin/env python
import sys
import csv

def convert(bcpdata, csvfilename="", lineterminator='*@@*', delimiter='@**@', quote='"', newdelimiter=',', col_headers=None):
    bcpdata = bcpdata.replace(quote, '\\' + quote)
    bcpdata = bcpdata.replace(delimiter, quote + newdelimiter + quote)
    bcpdata = bcpdata.replace(lineterminator, quote + '\n' + quote)
    if csvfilename=="":
        csvfilename = 'converted.csv'
    with open(csvfilename, 'wb') as csvfile:
        if(col_headers):
            writer = csv.writer(csvfile)
            writer.writerow(col_headers)
        csvfile.write('"')
        csvfile.write(bcpdata)
        csvfile.write('"')

def main():
    bcp_filename = sys.argv[1]
    try:
        csv_filename = sys.argv[2]
    except IndexError:
        csv_filename = bcp_filename.replace('.bcp', '.csv')
    with open(bcp_filename, 'rb') as bcpfile:
        bcpdata = bcpfile.read()
        convert(bcpdata, csv_filename)

if __name__ == '__main__':
    main()