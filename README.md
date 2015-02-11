# charity-commission-extract
Python utilities for handling the import of data from the Charity Commission data extract

## Get the data

The data can be accessed from <http://data.charitycommission.gov.uk/default.aspx>

## Beginner's Guide

A [beginner's guide](beginners-guide.md) to using the Charity Commission data extract.

## Utilities

### import.py

This script accepts a ZIP file containing the Charity Commission data extract and converts 
it into CSV files. It uses the bcp.py script to convert the .bcp files into .csv. It also 
adds column headings to the beginning of the files.

#### Usage

1. Download the Charity register extract ZIP file using the link above.
2. Open the command line and navigate to the folder where you want to store the files
3. Run the command `python /path/to/script/import.py /path/to/download/zip/RegPlusExtract_February_2015.zip`

The CSV files will be created in the directory you are in.

To use elsewhere use the function `import_zip(zipfile)` where zipfile is the path to the zip.

### bcp.py

This script converts a .bcp file (which uses the delimiters `@**@` and `*@@*`) into a more
standard CSV file. It can be configured to use any delimiters accepted by python's CSV
utility.

#### Usage

Use the function `convert(bcpdata, csvfilename="", lineterminator='*@@*', delimiter='@**@', quote='"', newdelimiter=';')`.

- `bcpdata` the full contents of the BCP file
- `csvfilename` the path to the output file (will be "converted.csv" if left blank
- `lineterminator` the line terminator used in the BCP file (default is `*@@*`)
- `delimiter` the column delimiter used in the BCP file (default is `@**@`)
- `quote` the character used to quote strings (default is `"`)
- `newdelimiter` character used to delimit the CSV file (default is `,`)

Note that the function puts every field in the CSV file in quotes, regardless of the type of field
(so numbers, dates, etc are all quoted). This will need to be taken into account when importing data
from these CSV files.