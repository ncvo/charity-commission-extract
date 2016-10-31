#!/usr/bin/env python
import sys
import csv

def convert(bcpdata, lineterminator='*@@*', delimiter='@**@', quote='"', newdelimiter=',', escapechar='\\', newline='\n'):
    """
    returns data from a string of BCP data. Default is to present as CSV data.
    """
    bcpdata = bcpdata.replace(escapechar, escapechar + escapechar)
    bcpdata = bcpdata.replace(quote, escapechar + quote)
    bcpdata = bcpdata.replace(delimiter, quote + newdelimiter + quote)
    bcpdata = bcpdata.replace(lineterminator, quote + newline + quote)
    bcpdata = quote + bcpdata + quote
    return bcpdata

def stream(file, lineterminator='*@@*', delimiter='@**@', encoding='utf-8'):
    """
    Returns a generator for parsing a BCP file. The input is a file object, and 
    the output is a list for each row in the data.
    
    Usage:
    
    with open("bcp_file.bcp", 'rb') as bcpfile:
        for bcpfields in bcp_stream(bcpfile):
            print(bcpfields)
    
    More pythonic, but slower than using the `convert()` function above and then 
    parsing the CSV file, as the python CSV utilities are written in pure C.
    """
        
    buffer = ''
    fields = []
    
    while True:
        byte = file.read(1)
        try:
            byte = byte.decode(encoding)
        except AttributeError:
            pass
        
        buffer += byte
        
        if not byte:
            break
        
        # check if we've seen a field delimiter
        if( buffer[-len(delimiter):] == delimiter):
            fields.append( buffer[:-len(delimiter)] )
            buffer = ''
        
        # check if we've seen a line delimiter
        if( buffer[-len(lineterminator):] == lineterminator):
            fields.append( buffer[:-len(lineterminator)] )
            buffer = ''
            yield fields
            fields = []
    
    yield fields

def main():

    # get arguments
    bcp_filename = sys.argv[1]
    try:
        csv_filename = sys.argv[2]
    except IndexError:
        csv_filename = bcp_filename.replace('.bcp', '.csv')
        
    # have to check system version annoyingly
    # for python 3 >
    if sys.version_info >= (3,0):
        
        with open(bcp_filename, 'r') as bcpfile:
            with open(csv_filename, 'w', newline='') as csvfile:
                writer = csv.writer(csvfile)
                for bcpfields in stream(bcpfile):
                    writer.writerow(bcpfields)
    
    # for python 2
    else:
        
        with open(bcp_filename, 'rb') as bcpfile:
            with open(csv_filename, 'wb') as csvfile:
                writer = csv.writer(csvfile)
                for bcpfields in stream(bcpfile):
                    writer.writerow(bcpfields)

if __name__ == '__main__':
    main()
