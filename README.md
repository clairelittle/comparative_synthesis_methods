# comparative synthesis methods
Code and data for the paper will appear here

## Data
Four Census datasets were used. The Canada, Fiji and Rwanda datasets were obtained from [IPUMS-international](https://international.ipums.org/international/) and the UK dataset was obtained from the UK Data Service, study number [7210](https://beta.ukdataservice.ac.uk/datacatalogue/studies/study?id=7210). Details of the datasets and the variables used for each follow:

### Canada 2011 Census data
URBAN, CA2011A_TENURE, OCCISCO, CA2011A_SEX, CA2011A_AGE, CA2011A_RELATE, CA2011A_IND, CA2011A_INCTOT, CA2011A_DEGREE, CA2011A_YRIMM, CA2011A_LANG, CA2011A_BPL, CA2011A_MINORITY, CA2011A_ABIDENT, CA2011A_MARST, CA2011A_CLASSWK, CA2011A_RELIG, CA2011A_CITIZEN, CA2011A_TRANWORK, CA2011A_WKFULL, CA2011A_HRSWK, CA2011A_EMPSTAT, CA2011A_WKSWORK, CA2011A_BPLPOP, CA2011A_BPLMOM

The GEO1_CA2011 (province) variable was used to subset the data on the (randomly selected) province of Manitoba (46). The GEO1_CA2011 variable was not included in analysis as subsetting on it meant it was then a constant.

The dataset consisted of 32149 records and 25 variables.

### Fiji 2007 Census data
FJ2007A_PROV, FJ2007A_TENURE, FJ2007A_RELATE, FJ2007A_SEX, FJ2007A_AGE, FJ2007A_ETHNIC, FJ2007A_MARST, FJ2007A_RELIGION, FJ2007A_BPLPROV, FJ2007A_RESPROV, FJ2007A_RESSTAT, FJ2007A_SCHOOL, FJ2007A_EDATTAIN, FJ2007A_TRAVEL, FJ2007A_WORKTYPE, FJ2007A_OCC1, FJ2007A_IND2, FJ2007A_CLASSWKR, FJ2007A_MIG5YR

The whole sample was used and the dataset consisted of 84323 records and 19 variables.

### Rwanda 2012 Census data
RW2012A_URBAN, RW2012A_OWNERSH, RW2012A_RELATE, RW2012A_SEX, RW2012A_AGE, RW2012A_STATUS, RW2012A_BPL, RW2012A_NATION, RW2012A_RELIG, RW2012A_DISAB1, RW2012A_DISAB2, RW2012A_HINS, RW2012A_REGBTH, RW2012A_LIT, RW2012A_EDCERT, RW2012A_CLASSWK, RW2012A_WKSECTOR, RW2012A_MARST, RW2012A_NSPOUSE, RW2012A_OCC, RW2012A_IND1

The GEO2_RW2012 (district) variable was used to subset the data on the (randomly selected) district of Karongi (3031). The GEO2_RW2012 variable was not included in analysis as subsetting on it meant it was then a constant.

The dataset consisted of 31455 records and 21 variables.

### UK (Great Britain) 1991 Census data
AREAP, AGE, COBIRTH, ECONPRIM, ETHGROUP, FAMTYPE, HOURS, LTILL, MSTATUS, QUALNUM, RELAT, SEX, SOCLASS, TRANWORK, TENURE

The REGIONP (region) variable was used to subset the data on the (randomly selected) region of West Midlands (9). The REGIONP variable was not included in analysis as subsetting on it meant it was then a constant.

The dataset consisted of 104267 records and 15 variables.


## Synthetic Data
The synthetic data was created using [synthpop](https://synthpop.org.uk/), [DataSynthesizer](https://github.com/DataResponsibly/DataSynthesizer), [CTGAN](https://github.com/sdv-dev/CTGAN) and [TVAE](https://github.com/sdv-dev/CTGAN/blob/master/ctgan/synthesizers/tvae.py). Fully synthetic datasets the same size as the original were generated. For each method/parameter setting 5 models were created (using different random seeds) and 1 synthetic dataset generated from each. For the utility and risk metrics the average across the five datasets was used, in order to guard against unusual results.
