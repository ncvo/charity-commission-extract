# Beginner's Guide to the Charity Commission data

The Charity Commission data extract file contains 17 files, in BCP format (an SQL backup format). The included files are shown below.

extract_charity.bcp
:	Gives the main details about each charity (one record per charity). Contains the contact information and address of each charity.

extract_registration.bcp
:	Details of the date that charities were registered and removed, along with a code representing the reason for removal. Codes can be looked up from extract_remove_ref table. Note that some charities have more than one entry in this table, if (for example) they were removed in error and then reregistered.

extract_name.bcp
:	Contains a record of any name the charity has informed the Charity Commission that it works under. This includes: former names that are no longer used, alternative names, acronyms and abbreviations, and names of subsidiary or merged organisations.

extract_class.bcp
:	Contains a record of each classification category associated with a charity. Categories cover three broad areas:

	*	theme (eg health or education)
	*	activity (eg providing services, providing health)
	*	beneficiaries (eg older people, animals)
	
	Each charity can have multiple categories across these three areas, and there is no "primary" value available.
	
extract_trustee.bcp
:	Contains the name of the trustees associated with each charity

extract_objects.bcp
:	Contains the charitable objects of a charity. The objects are split into text strings, and there are multiple rows for each charity depending on how long their objects are. The objects then have to be concatenated to produce the full objects.

extract_keywords.bcp
:	Contains a list of keywords (with multiple rows per charity) based on the names and objects of the charities. It is not know how the keywords are selected for inclusion on this list.

extract_aob_keywords.bcp
:	Contains a list of keywords relating to the description of the area of benefit (found in the `extract_charity` table).

extract_charity_aoo.bcp
:	Contains structured geographical data relating to the areas in which the charity operates. Most of the codes relate to common geographical aras, such as Local Authorities, or countries, but there are some additional codes such as "Throughout England and Wales" or "Throughout Greater London".

extract_ar_submit.bcp
:	Contains details of when the charity's annual returns were submitted.

extract_main_charity.bcp
:	Contains one record for every main registered charity (but doesn't include removed or subsidiary charities). This contains additional details such as their website, email address and company number.

extract_acct_submit.bcp
:	Contains a record of when the charity's accounts were submitted.

extract_financial.bcp
:	Contains a row for each year for each charity, showing what its income and expenditure was. Tends to only include the last five years or so.

extract_partb.bcp
:	Contains a row for each year for each charity, with more detailed financial information. Charities only have to fill in this information if their income is greater than &pound;500,000 in that year.

Also included are a number of reference tables which list codes and values for some of the fields used in the data.

extract_class_ref.bcp
:	Lookup reference for the Charity Commission classification scheme, used in the `extract_class` table. These codes are included in appendix X.

extract_remove_ref.bcp
:	Lookup reference for codes used to indicate the reasons why a charity has been removed from the register of charities, used in the `extract_registration` table. The codes are included in appendix X.

extract_aoo_ref.bcp
:	Lookup reference for codes used in the `extract_charity_aoo` table.