CREATE TABLE IF NOT EXISTS `extract_acct_submit` (
  `regno` varchar(14) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `submit_date` datetime DEFAULT NULL,
  `arno` varchar(4) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `fyend` char(4) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`regno`,`arno`)
);

CREATE TABLE IF NOT EXISTS `extract_aoo_ref` (
  `aootype` varchar(1) NOT NULL DEFAULT '',
  `aookey` int(3) NOT NULL DEFAULT '0',
  `aooname` varchar(50) NOT NULL,
  `aoosort` varchar(50) NOT NULL,
  `welsh` varchar(1) NOT NULL,
  `master` varchar(2) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`aootype`,`aookey`)
);

CREATE TABLE IF NOT EXISTS `extract_ar_submit` (
  `regno` varchar(14) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `arno` varchar(4) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `submit_date` datetime DEFAULT NULL,
  PRIMARY KEY (`regno`,`arno`)
);

CREATE TABLE IF NOT EXISTS `extract_charity` (
  `regno` varchar(14) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `subno` int(11) NOT NULL DEFAULT '0',
  `name` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `orgtype` varchar(2) CHARACTER SET latin1 DEFAULT NULL,
  `gd` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `aob` varchar(175) CHARACTER SET latin1 DEFAULT NULL,
  `aob_defined` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `nhs` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `ha_no` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `corr` varchar(70) CHARACTER SET latin1 DEFAULT NULL,
  `add1` varchar(35) CHARACTER SET latin1 DEFAULT NULL,
  `add2` varchar(35) CHARACTER SET latin1 DEFAULT NULL,
  `add3` varchar(35) CHARACTER SET latin1 DEFAULT NULL,
  `add4` varchar(35) CHARACTER SET latin1 DEFAULT NULL,
  `add5` varchar(35) CHARACTER SET latin1 DEFAULT NULL,
  `postcode` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(23) CHARACTER SET latin1 DEFAULT NULL,
  `fax` varchar(23) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`regno`,`subno`)
);

CREATE TABLE IF NOT EXISTS `extract_charity_aoo` (
  `regno` varchar(14) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `aootype` char(1) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `aookey` int(11) NOT NULL DEFAULT '0',
  `welsh` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `master` int(11) DEFAULT NULL,
  PRIMARY KEY (`regno`,`aootype`,`aookey`)
);

CREATE TABLE IF NOT EXISTS `extract_class` (
  `regno` varchar(14) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `class` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`regno`,`class`)
);

CREATE TABLE IF NOT EXISTS `extract_class_ref` (
  `classno` int(11) NOT NULL DEFAULT '0',
  `classtext` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`classno`)
);

CREATE TABLE IF NOT EXISTS `extract_financial` (
  `regno` varchar(14) NOT NULL DEFAULT '0',
  `fystart` datetime DEFAULT NULL,
  `fyend` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `income` int(11) DEFAULT NULL,
  `expend` int(11) DEFAULT NULL,
  PRIMARY KEY (`regno`,`fyend`)
);

CREATE TABLE IF NOT EXISTS `extract_main_charity` (
  `regno` varchar(14) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `coyno` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `trustees` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `fyend` char(4) CHARACTER SET latin1 DEFAULT NULL,
  `welsh` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `incomedate` datetime DEFAULT NULL,
  `income` int(11) DEFAULT NULL,
  `grouptype` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `web` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`regno`)
);

CREATE TABLE IF NOT EXISTS `extract_name` (
  `regno` varchar(14) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `subno` int(11) NOT NULL DEFAULT '0',
  `nameno` int(11) NOT NULL DEFAULT '0',
  `name` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`regno`,`subno`,`nameno`)
);

CREATE TABLE IF NOT EXISTS `extract_objects` (
  `regno` varchar(14) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `subno` int(11) NOT NULL DEFAULT '0',
  `seqno` char(4) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `object` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`regno`,`subno`,`seqno`)
);

CREATE TABLE IF NOT EXISTS `extract_partb` (
  `regno` varchar(14) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `artype` char(4) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `fystart` datetime DEFAULT NULL,
  `fyend` datetime DEFAULT NULL,
  `inc_leg` bigint(20) DEFAULT NULL,
  `inc_end` bigint(20) DEFAULT NULL,
  `inc_vol` bigint(20) DEFAULT NULL,
  `inc_fr` bigint(20) DEFAULT NULL,
  `inc_char` bigint(20) DEFAULT NULL,
  `inc_invest` bigint(20) DEFAULT NULL,
  `inc_other` bigint(20) DEFAULT NULL,
  `inc_total` bigint(20) DEFAULT NULL,
  `invest_gain` bigint(20) DEFAULT NULL,
  `asset_gain` bigint(20) DEFAULT NULL,
  `pension_gain` bigint(20) DEFAULT NULL,
  `exp_vol` bigint(20) DEFAULT NULL,
  `exp_trade` bigint(20) DEFAULT NULL,
  `exp_invest` bigint(20) DEFAULT NULL,
  `exp_grant` bigint(20) DEFAULT NULL,
  `exp_charble` bigint(20) DEFAULT NULL,
  `exp_gov` bigint(20) DEFAULT NULL,
  `exp_other` bigint(20) DEFAULT NULL,
  `exp_total` bigint(20) DEFAULT NULL,
  `exp_support` bigint(20) DEFAULT NULL,
  `exp_dep` bigint(20) DEFAULT NULL,
  `reserves` bigint(20) DEFAULT NULL,
  `asset_open` bigint(20) DEFAULT NULL,
  `asset_close` bigint(20) DEFAULT NULL,
  `fixed_assets` bigint(20) DEFAULT NULL,
  `open_assets` bigint(20) DEFAULT NULL,
  `invest_assets` bigint(20) DEFAULT NULL,
  `cash_assets` bigint(20) DEFAULT NULL,
  `current_assets` bigint(20) DEFAULT NULL,
  `credit_1` bigint(20) DEFAULT NULL,
  `credit_long` bigint(20) DEFAULT NULL,
  `pension_assets` bigint(20) DEFAULT NULL,
  `total_assets` bigint(20) DEFAULT NULL,
  `funds_end` bigint(20) DEFAULT NULL,
  `funds_restrict` bigint(20) DEFAULT NULL,
  `funds_unrestrict` bigint(20) DEFAULT NULL,
  `funds_total` bigint(20) DEFAULT NULL,
  `employees` int(11) DEFAULT NULL,
  `volunteers` int(11) DEFAULT NULL,
  `cons_acc` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `charity_acc` char(1) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`regno`,`artype`)
);

CREATE TABLE IF NOT EXISTS `extract_registration` (
  `regno` varchar(14) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `subno` int(11) NOT NULL DEFAULT '0',
  `regdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remdate` datetime DEFAULT NULL,
  `remcode` varchar(3) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`regno`,`subno`,`regdate`)
);

CREATE TABLE IF NOT EXISTS `extract_remove_ref` (
  `code` varchar(3) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `text` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`code`)
);

CREATE TABLE IF NOT EXISTS `extract_trustee` (
  `regno` varchar(14) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `trustee` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`regno`,`trustee`)
);