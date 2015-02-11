#!/usr/bin/env python
import bcp
import zipfile
import sys

cc_files = {
	"extract_acct_submit": [
	  "regno",
	  "submit_date",
	  "arno",
	  "fyend"
	], 
	"extract_aoo_ref": [
	  "aootype",
	  "aookey",
	  "aooname",
	  "aoosort",
	  "welsh",
	  "master",
	  "code"
	], 
	"extract_ar_submit": [
	  "regno",
	  "arno",
	  "submit_date"
	], 
	"extract_charity": [
	  "regno",
	  "subno",
	  "name",
	  "orgtype",
	  "gd",
	  "aob",
	  "aob_defined",
	  "nhs",
	  "ha_no",
	  "corr",
	  "add1",
	  "add2",
	  "add3",
	  "add4",
	  "add5",
	  "postcode",
	  "phone",
	  "fax",
	], 
	"extract_charity_aoo": [
	  "regno",
	  "aootype",
	  "aookey",
	  "welsh",
	  "master"
	], 
	"extract_class": [
	  "regno",
	  "class"
	], 
	"extract_class_ref": [
	  "classno",
	  "classtext",
	], 
	"extract_financial": [
	  "regno",
	  "fystart",
	  "fyend",
	  "income",
	  "expend"
	], 
	"extract_main_charity": [
	  "regno",
	  "coyno",
	  "trustees",
	  "fyend",
	  "welsh",
	  "incomedate",
	  "income",
	  "grouptype",
	  "email",
	  "web"
	], 
	"extract_name": [
	  "regno",
	  "subno",
	  "nameno",
	  "name"
	], 
	"extract_objects": [
	  "regno",
	  "subno",
	  "seqno",
	  "object"
	], 
	"extract_partb": [
	  "regno",
	  "artype",
	  "fystart",
	  "fyend",
	  "inc_leg",
	  "inc_end",
	  "inc_vol",
	  "inc_fr",
	  "inc_char",
	  "inc_invest",
	  "inc_other",
	  "inc_total",
	  "invest_gain",
	  "asset_gain",
	  "pension_gain",
	  "exp_vol",
	  "exp_trade",
	  "exp_invest",
	  "exp_grant",
	  "exp_charble",
	  "exp_gov",
	  "exp_other",
	  "exp_total",
	  "exp_support",
	  "exp_dep",
	  "reserves",
	  "asset_open",
	  "asset_close",
	  "fixed_assets",
	  "open_assets",
	  "invest_assets",
	  "cash_assets",
	  "current_assets",
	  "credit_1",
	  "credit_long",
	  "pension_assets",
	  "total_assets",
	  "funds_end",
	  "funds_restrict",
	  "funds_unrestrict",
	  "funds_total",
	  "employees",
	  "volunteers",
	  "cons_acc",
	  "charity_acc"
	], 
	"extract_registration": [
	  "regno",
	  "subno",
	  "regdate",
	  "remdate",
	  "remcode"
	], 
	"extract_remove_ref": [
	  "code",
	  "text"
	], 
	"extract_trustee": [
	  "regno",
	  "trustee"
	]
}

def import_zip(zip_file):
    zf = zipfile.ZipFile(zip_file, 'r')
    print 'Opened zip file: %s' % zip_file
    for filename in cc_files:
        try:
            bcp_filename = filename + '.bcp'
            csv_filename = filename + '.csv'
            bcpdata = zf.read(bcp_filename)
            bcp.convert(bcpdata, csvfilename=csv_filename, col_headers=cc_files[filename])
            print 'Converted: %s' % bcp_filename
        except KeyError:
            print 'ERROR: Did not find %s in zip file' % bcp_filename

def main():
    zip_file = sys.argv[1]
    import_zip(zip_file)

if __name__ == '__main__':
    main()