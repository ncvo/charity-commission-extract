#!/usr/bin/env python
import bcp
import csv
import zipfile
import sys

cc_files = [
    'acct_submit',
    'aoo_ref',
    'ar_submit',
	'charity',
	'charity_aoo',
	'class',
	'class_ref',
	'financial',
	'main_charity',
	'name',
	'objects',
	'partb',
	'registration',
	'remove_ref',
	'trustee'
]

def import_zip(zip_file):
    zf = zipfile.ZipFile(zip_file, 'r')
    print 'Opened zip file: %s' % zip_file
    for filename in cc_files:
        try:
            bcp_filename = 'extract_' + filename + '.bcp'
            csv_filename = 'extract_' + filename + '.csv'
            bcpdata = zf.read(bcp_filename)
            bcp.convert(bcpdata, csv_filename)
            print 'Converted: %s' % bcp_filename
        except KeyError:
            print 'ERROR: Did not find %s in zip file' % bcp_filename

def main():
    zip_file = sys.argv[1]
    import_zip(zip_file)

if __name__ == '__main__':
    main()