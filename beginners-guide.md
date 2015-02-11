# Beginner's Guide to the Charity Commission data

## Downloading the data

The data can be [downloaded from the Charity Commission website](http://data.charitycommission.gov.uk/default.aspx). The file is quite large (around 100Mb) so may take some time, particularly on slower connections).

#### Data licence

The data is made available by the Charity Commission under the terms of the [Open Government Licence](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).

## Converting from .bcp to .csv

First use the python scripts to extract the table files from the ZIP and transform into CSV files.

1. Download the Charity register extract ZIP file using the link above.
2. Open the command line and navigate to the folder where you want to store the files
3. Run the command `python /path/to/script/import.py /path/to/download/zip/RegPlusExtract_February_2015.zip`

The CSV files will be created in the directory you are in.

## What the file contains

The Charity Commission data extract is in the form of a ZIP file which contains 15 files, in BCP format (an SQL backup format). The included files are shown below. The Charity Commission have provided a [guide to the fields in each file](http://data.charitycommission.gov.uk/data-definition.aspx). 

**extract_charity**
:	Gives the main details about each charity (one record per charity). Contains the contact information and address of each charity.

**extract_registration**
:	Details of the date that charities were registered and removed, along with a code representing the reason for removal. Codes can be looked up from `extract_remove_ref` table. Note that some charities have more than one entry in this table, if (for example) they were removed in error and then reregistered.

**extract_name**
:	Contains a record of any name the charity has informed the Charity Commission that it works under. This includes: former names that are no longer used, alternative names, acronyms and abbreviations, and names of subsidiary or merged organisations.

**extract_class**
:	Contains a record of each classification category associated with a charity. Categories cover three broad areas:

*	theme (eg health or education)
*	activity (eg providing services, providing health)
*	beneficiaries (eg older people, animals)

Each charity can have multiple categories across these three areas, and there is no "primary" value available.
	
**extract_trustee**
:	Contains the name of the trustees associated with each charity

**extract_objects**
:	Contains the charitable objects of a charity. The objects are split into text strings, and there are multiple rows for each charity depending on how long their objects are. The objects then have to be concatenated to produce the full objects.

**extract_charity_aoo**
:	Contains structured geographical data relating to the areas in which the charity operates. Most of the codes relate to common geographical aras, such as Local Authorities, or countries, but there are some additional codes such as "Throughout England and Wales" or "Throughout Greater London".

**extract_ar_submit**
:	Contains details of when the charity's annual returns were submitted.

**extract_main_charity**
:	Contains one record for every main registered charity (but doesn't include removed or subsidiary charities). This contains additional details such as their website, email address and company number.

**extract_acct_submit**
:	Contains a record of when the charity's accounts were submitted.

**extract_financial**
:	Contains a row for each year for each charity, showing what its income and expenditure was. Tends to only include the last five years or so.

**extract_partb**
:	Contains a row for each year for each charity, with more detailed financial information. Charities only have to fill in this information if their income is greater than &pound;500,000 in that year.

Also included are a number of reference tables which list codes and values for some of the fields used in the data.

**extract_class_ref**
:	Lookup reference for the Charity Commission classification scheme, used in the `extract_class` table.

**extract_remove_ref**
:	Lookup reference for codes used to indicate the reasons why a charity has been removed from the register of charities, used in the `extract_registration` table.

**extract_aoo_ref**
:	Lookup reference for codes used in the `extract_charity_aoo` table.

Two tables were included in earlier versions of the extract but appear to have been dropped.

~~**extract_keywords**
:	Contains a list of keywords (with multiple rows per charity) based on the names and objects of the charities. It is not know how the keywords are selected for inclusion on this list.~~

~~**extract_aob_keywords**
:	Contains a list of keywords relating to the description of the area of benefit (found in the `extract_charity` table).~~


#### Note: Subsidiary vs main charity

The data in these tables relates to both subsidiary and main charities, although not every table has records for both. Subsidiary charities are attached to a main charity, and share their registration number (usually shown as `regno`). The main charity within each group has a `subno` of 0, whereas actual subsidiaries have `subno` greater than 0. In general, when analysing the data these subsidiaries are excluded.

## Importing the data into a spreadsheet

Because the files form a relational database, they aren't particularly suitable for analysis in a program that relies on single tables, such as Excel. If you want to look at the files in Excel, the best place to start is `extract_charity.csv`, which includes a record for every charity. 

After opening the CSV in Excel, filter by `subno` = 0 to get a list of "main" charities (see note above). 

To perform more sophisticated analysis it may be possible to open two files and use a `VLOOKUP` function to merge the two sources. But generally it is easier to import the data into a database and use it there.

## Importing the data into a database

The data is designed to be used in a database. If you use a SQL database, such as MySql, you can use the included `table-definitions.sql` file to create the needed files. You can then use something like PhpMyAdmin to import the data into the files. The SQL table definitions have been tested with MySQL but may be suitable for use with other SQL databases with some adjustment.

You can also use the included MS Access template to set up an Access database, which you can then import the CSV files into. 

When navigating the database, generally the unique identifier is the `regno` field (the charity's registration number). But make sure you also build relationships with the `subno` key which identifies subsidiary charities.

## Next steps

Now you've got the data imported you might want to...

- Add [postcode data from the ONS](http://www.ons.gov.uk/ons/guide-method/geography/products/postcode-directories/-nspp-/index.html) to look for charities in a particular area.
- Take a look at the [Scottish Charities data](http://www.oscr.org.uk/charities/search-scottish-charity-register/charity-register-download) that's also been released.
- Import [NCVO's classification scheme](http://data.ncvo.org.uk/datastore/datasets/dataset-4-icnpo-classification-of-charities/) to look at which charities are in which subsector.
- Look at the financial data available for larger charities in the `extract_partb` table.
- Explore the SIR data which is also available in the Charity Commission extract (soon to be discontinued)