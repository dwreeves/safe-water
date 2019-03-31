/*
 * WATER SYSTEM Table
 */

create table WATER_SYSTEM
(
	PWSID VARCHAR(9) not null,
	PWS_NAME TEXT null,
	NPM_CANDIDATE BOOLEAN null,
	PRIMACY_AGENCY_CODE TEXT null,
	EPA_REGION INT null,
	SEASON_BEGIN_DATE TEXT null,
	SEASON_END_DATE TEXT null,
	PWS_ACTIVITY_CODE TEXT null,
	PWS_DEACTIVATION_DATE DATE null,
	PWS_TYPE_CODE TEXT null,
	DBPR_SCHEDULE_CAT_CODE TEXT null,
	CDS_ID TEXT null,
	GW_SW_CODE TEXT null,
	LT2_SCHEDULE_CAT_CODE TEXT null,
	OWNER_TYPE_CODE TEXT null,
	POPULATION_SERVED_COUNT INT null,
	POP_CAT_2_CODE INT null,
	POP_CAT_3_CODE INT null,
	POP_CAT_4_CODE INT null,
	POP_CAT_5_CODE INT null,
	POP_CAT_11_CODE INT null,
	PRIMACY_TYPE TEXT null,
	PRIMARY_SOURCE_CODE TEXT null,
	IS_GRANT_ELIGIBLE_IND BOOLEAN null,
	IS_WHOLESALER_IND BOOLEAN null,
	IS_SCHOOL_OR_DAYCARE_IND BOOLEAN null,
	SERVICE_CONNECTIONS_COUNT INT null,
	SUBMISSION_STATUS_CODE TEXT null,
	ORG_NAME TEXT null,
	ADMIN_NAME TEXT null,
	EMAIL_ADDR TEXT null,
	PHONE_NUMBER TEXT null,
	PHONE_EXT_NUMBER TEXT null,
	FAX_NUMBER TEXT null,
	ALT_PHONE_NUMBER TEXT null,
	ADDRESS_LINE1 TEXT null,
	ADDRESS_LINE2 TEXT null,
	CITY_NAME TEXT null,
	ZIP_CODE TEXT null,
	COUNTRY_CODE TEXT null,
	STATE_CODE TEXT null,
	SOURCE_WATER_PROTECTION_CODE TEXT null,
	SOURCE_PROTECTION_BEGIN_DATE TEXT null,
	OUTSTANDING_PERFORMER TEXT null,
	OUTSTANDING_PERFORM_BEGIN_DATE TEXT null,
	CITIES_SERVED TEXT null,
	COUNTIES_SERVED TEXT null
);

create unique index WATER_SYSTEM_PWSID_uindex
	on WATER_SYSTEM (PWSID);

alter table WATER_SYSTEM
	add constraint WATER_SYSTEM_pk
		primary key (PWSID);

/*
 * WATER SYSTEM FACILITY Table
 */

	create table WATER_SYSTEM_FACILITY
(
	PWSID VARCHAR(9) null,
	ID VARCHAR(36) not null,
	PRIMACY_AGENCY_CODE TEXT null,
	EPA_REGION INT null,
	FACILITY_ID VARCHAR(12) null,
	FACILITY_NAME TEXT null,
	STATE_FACILITY_ID TEXT null,
	FACILITY_ACTIVITY_CODE TEXT null,
	FACILITY_DEACTIVATION_DATE DATE null,
	FACILITY_TYPE_CODE TEXT null,
	SUBMISSION_STATUS_CODE TEXT null,
	IS_SOURCE_IND BOOLEAN null,
	WATER_TYPE_CODE TEXT null,
	AVAILABILITY_CODE TEXT null,
	SELLER_TREATMENT_CODE TEXT null,
	SELLER_PWSID VARCHAR(9) null,
	SELLER_PWS_NAME TEXT null,
	FILTRATION_STATUS_CODE TEXT null,
	PWS_ACTIVITY_CODE TEXT null,
	PWS_DEACTIVATION_DATE DATE null,
	PWS_TYPE_CODE TEXT null,
	IS_SOURCE_TREATED_IND TEXT null
);

create unique index WATER_SYSTEM_FACILITY_FACILITY_ID_uindex
	on WATER_SYSTEM_FACILITY (ID);

alter table WATER_SYSTEM_FACILITY
	add constraint WATER_SYSTEM_FACILITY_pk
		primary key (ID);

/* Once the table is created, use the mysql LOAD DATA utility to push the data on the server.

LOAD DATA
LOCAL
INFILE '/Users/fpaupier/projects/safe-water/data/SDWIS/sanitized/WATER_SYSTEM_FACILITY.csv'
INTO TABLE WATER_SYSTEM_FACILITY
FIELDS
	TERMINATED BY ','
LINES
	TERMINATED BY '\n';

*/


/*
 * VIOLATION Table
 */


create table VIOLATION
(
	PWSID TEXT null,
	ID VARCHAR(36) not null,
	VIOLATION_ID VARCHAR(20) null,
	FACILITY_ID VARCHAR(12) null,
	POPULATION_SERVED_COUNT INT null,
	NPM_CANDIDATE TEXT null,
	PWS_ACTIVITY_CODE TEXT null,
	PWS_DEACTIVATION_DATE TEXT null,
	PRIMARY_SOURCE_CODE TEXT null,
	POP_CAT_5_CODE INT null,
	PRIMACY_AGENCY_CODE TEXT null,
	EPA_REGION INT null,
	PWS_TYPE_CODE TEXT null,
	VIOLATION_CODE VARCHAR(2) null,
	VIOLATION_CATEGORY_CODE TEXT null,
	IS_HEALTH_BASED_IND TEXT null,
	CONTAMINANT_CODE INT null,
	COMPLIANCE_STATUS_CODE TEXT null,
	VIOL_MEASURE TEXT null,
	UNIT_OF_MEASURE TEXT null,
	STATE_MCL TEXT null,
	IS_MAJOR_VIOL_IND TEXT null,
	SEVERITY_IND_CNT TEXT null,
	COMPL_PER_BEGIN_DATE DATE null,
	COMPL_PER_END_DATE DATE null,
	LATEST_ENFORCEMENT_ID TEXT null,
	RTC_ENFORCEMENT_ID TEXT null,
	RTC_DATE DATE null,
	PUBLIC_NOTIFICATION_TIER INT null,
	ORIGINATOR_CODE TEXT null,
	SAMPLE_RESULT_ID TEXT null,
	CORRECTIVE_ACTION_ID TEXT null,
	RULE_CODE VARCHAR(3) null,
	RULE_GROUP_CODE VARCHAR(3) null,
	RULE_FAMILY_CODE VARCHAR(3) null
);

create unique index VIOLATION_ID_uindex
	on VIOLATION (ID);

alter table VIOLATION
	add constraint VIOLATION_pk
		primary key (ID);






CREATE TABLE IF NOT EXISTS sdwis.ENFORCEMENT_ACTION (
	ENFORCEMENT_ACTION_TYPE_CODE VARCHAR(4),
	ENFORCEMENT_COMMENT_TEXT VARCHAR(2000),
	ENFORCEMENT_DATE DATE,
	ENFORCEMENT_ID VARCHAR(20) PRIMARY KEY,
	ORIGINATOR_CODE VARCHAR(4),
	PWSID VARCHAR(9),
    FOREIGN KEY (PWSID) REFERENCES sdwis.WATER_SYSTEM(PWSID)
);
CREATE TABLE IF NOT EXISTS sdwis.GEOGRAPHIC_AREA (
	ANSI_ENTITY_CODE VARCHAR(4),
	AREA_TYPE_CODE VARCHAR(4),
	CITY_SERVED VARCHAR(40),
	COUNTY_SERVED VARCHAR(40),
	EPA_REGION VARCHAR(2) NOT NULL,
	GEO_ID VARCHAR(20),
	PRIMACY_AGENCY_CODE VARCHAR(2),
	PWSID VARCHAR(9),
	PWS_ACTIVITY_CODE CHAR(1),
	PWS_TYPE_CODE VARCHAR(6),
	STATE_SERVED VARCHAR(4),
	TRIBAL_CODE VARCHAR(10),
	ZIP_CODE_SERVED VARCHAR(5) NOT NULL,
    FOREIGN KEY (PWSID) REFERENCES sdwis.WATER_SYSTEM(PWSID)
);
CREATE TABLE IF NOT EXISTS sdwis.LCR_SAMPLE_RESULT (
	CONTAMINANT_CODE VARCHAR(4),
	EPA_REGION VARCHAR(2),
	PRIMACY_AGENCY_CODE VARCHAR(2),
	PWSID VARCHAR(9),
	RESULT_SIGN_CODE VARCHAR(1),
	SAMPLE_ID VARCHAR(20),
	SAMPLE_MEASURE NUMERIC(15,9),
	SAR_ID NUMERIC(9,0),
	UNIT_OF_MEASURE VARCHAR(9),
    FOREIGN KEY (PWSID) REFERENCES sdwis.WATER_SYSTEM(PWSID)
);
CREATE TABLE IF NOT EXISTS sdwis.LCR_SAMPLE (
	EPA_REGION VARCHAR(2),
	PRIMACY_AGENCY_CODE VARCHAR(2),
	PWSID VARCHAR(9),
	RECONCILIATION_ID VARCHAR(40),
	SAMPLE_ID VARCHAR(20),
	SAMPLING_END_DATE DATE,
	SAMPLING_START_DATE DATE,
    FOREIGN KEY (PWSID) REFERENCES sdwis.WATER_SYSTEM(PWSID)
);
CREATE TABLE IF NOT EXISTS sdwis.SERVICE_AREA (
	EPA_REGION VARCHAR(2),
	IS_PRIMARY_SERVICE_AREA_CODE CHAR(1),
	PRIMACY_AGENCY_CODE VARCHAR(2),
	PWSID VARCHAR(9),
	PWS_ACTIVITY_CODE CHAR(1),
	PWS_TYPE_CODE VARCHAR(6),
	SERVICE_AREA_TYPE_CODE VARCHAR(4),
    FOREIGN KEY (PWSID) REFERENCES sdwis.WATER_SYSTEM(PWSID)
);
CREATE TABLE IF NOT EXISTS sdwis.TREATMENT (
	COMMENTS_TEXT VARCHAR(2000),
	FACILITY_ID VARCHAR(12),
	PWSID VARCHAR(9),
	TREATMENT_ID VARCHAR(20) PRIMARY KEY,
	TREATMENT_OBJECTIVE_Code VARCHAR(4),
	TREATMENT_PROCESS_CODE VARCHAR(4),
    FOREIGN KEY (PWSID) REFERENCES sdwis.WATER_SYSTEM(PWSID),
    FOREIGN KEY (FACILITY_ID) REFERENCES sdwis.WATER_SYSTEM_FACILITY(FACILITY_ID)
);
CREATE TABLE IF NOT EXISTS sdwis.VIOLATION (
	COMPLIANCE_STATUS_CODE VARCHAR(4),
	COMPL_PER_BEGIN_DATE DATE,
	COMPL_PER_END_DATE DATE,
	CONTAMINANT_CODE VARCHAR(4),
	CORRECTIVE_ACTION_ID VARCHAR(40),
	EPA_REGION VARCHAR(2),
	FACILITY_ID VARCHAR(12),
	IS_HEALTH_BASED_IND CHAR(1),
	IS_MAJOR_VIOL_IND CHAR(1),
	LATEST_ENFORCEMENT_ID VARCHAR(20),
	ORIGINATOR_CODE VARCHAR(4),
	POPULATION_SERVED_COUNT NUMERIC(9),
	POP_CAT_5_CODE VARCHAR(2),
	PRIMACY_AGENCY_CODE VARCHAR(2),
	PRIMARY_SOURCE_CODE VARCHAR(4),
	PUBLIC_NOTIFICATION_TIER NUMERIC(2,0),
	PWSID VARCHAR(9),
	PWS_ACTIVITY_CODE CHAR(1),
	PWS_DEACTIVATION_DATE DATE,
	PWS_TYPE_CODE VARCHAR(6),
	RTC_DATE DATE,
	RTC_ENFORCEMENT_ID VARCHAR(20),
	RULE_CODE VARCHAR(3),
	RULE_FAMILY_CODE VARCHAR(3),
	RULE_GROUP_CODE VARCHAR(3),
	SAMPLE_RESULT_ID VARCHAR(40),
	SEVERITY_IND_CNT NUMERIC(9,0),
	STATE_MCL NUMERIC(15,9),
	UNIT_OF_MEASURE VARCHAR(9),
	VIOLATION_CATEGORY_CODE VARCHAR(5),
	VIOLATION_CODE VARCHAR(4),
	VIOLATION_ID VARCHAR(20) PRIMARY KEY,
	VIOL_MEASURE NUMERIC(15,9),
    FOREIGN KEY (PWSID) REFERENCES sdwis.WATER_SYSTEM(PWSID),
    FOREIGN KEY (FACILITY_ID) REFERENCES sdwis.WATER_SYSTEM_FACILITY(FACILITY_ID)
);
CREATE TABLE IF NOT EXISTS sdwis.VIOLATION_ENF_ASSOC (
	ENFORCEMENT_ID VARCHAR(20),
	PWSID VARCHAR(9),
	VIOLATION_ID VARCHAR(20),
    FOREIGN KEY (PWSID) REFERENCES sdwis.WATER_SYSTEM(PWSID),
    FOREIGN KEY (VIOLATION_ID) REFERENCES sdwis.VIOLATION(VIOLATION_ID),
    FOREIGN KEY (ENFORCEMENT_ID) REFERENCES sdwis.ENFORCEMENT_ACTION(ENFORCEMENT_ID)
);
