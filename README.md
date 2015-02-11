# charity-commission-extract
Python utilities for handling the import of data from the Charity Commission data extract

## Get the data

The data can be accessed from <http://data.charitycommission.gov.uk/default.aspx>

## Beginner's Guide

A [beginner's guide](beginners-guide.md) to using the Charity Commission data extract.

## Utilities

### import.py

This script accepts a ZIP file containing the Charity Commission data extract and converts 
it into CSV files. It uses the bcp.py script to convert the .bcp files into .csv.

### bcp.py

This script converts a .bcp file (which uses the delimiters `@**@` and `*@@*`) into a more
standard CSV file. It can be configured to use any delimiters accepted by python's CSV
utility.
