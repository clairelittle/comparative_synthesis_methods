# Synthpop Experiments

Using R version 4.1.0, and Synthpop version 1.6-0. Experiments were performed using the minbucket, cp value and visit sequence parameters. For all experiments (other than the visit sequence parameter experiments) the visit sequence was set to numerical variables first (alphabetically) then categorical variables in order of number of categories (ascending, with a tie decided by alphabetical order). Visit sequences used for each of the Census datasets:

- **Canada 2011**: CA2011A_AGE, CA2011A_HRSWK, CA2011A_INCTOT, CA2011A_WKSWORK, CA2011A_ABIDENT, CA2011A_SEX, CA2011A_TENURE, URBAN, CA2011A_WKFULL, CA2011A_BPLMOM, CA2011A_BPLPOP, CA2011A_CITIZEN, CA2011A_CLASSWK, CA2011A_EMPSTAT, CA2011A_LANG, CA2011A_MARST, CA2011A_TRANWORK, CA2011A_RELATE, CA2011A_DEGREE, OCCISCO, CA2011A_YRIMM, CA2011A_MINORITY, CA2011A_RELIG, CA2011A_IND, CA2011A_BPL
- **Fiji 2007**: FJ2007A_AGE, FJ2007A_RESSTAT, FJ2007A_SEX, FJ2007A_MIG5YR, FJ2007A_CLASSWKR, FJ2007A_SCHOOL, FJ2007A_MARST, FJ2007A_TENURE, FJ2007A_WORKTYPE, FJ2007A_OCC1, FJ2007A_PROV, FJ2007A_RELATE, FJ2007A_TRAVEL, FJ2007A_ETHNIC, FJ2007A_EDATTAIN, FJ2007A_RELIGION, FJ2007A_BPLPROV, FJ2007A_IND2, FJ2007A_RESPROV
- **Rwanda 2012**: RW2012A_AGE, RW2012A_STATUS, RW2012A_SEX, RW2012A_URBAN, RW2012A_REGBTH, RW2012A_WKSECTOR, RW2012A_MARST, RW2012A_NSPOUSE, RW2012A_CLASSWK, RW2012A_OWNERSH, RW2012A_DISAB2, RW2012A_DISAB1, RW2012A_EDCERT, RW2012A_RELATE, RW2012A_RELIG, RW2012A_OCC, RW2012A_HINS, RW2012A_NATION, RW2012A_LIT, RW2012A_IND1, RW2012A_BPL
- **UK 1991**: AGE, HOURS, LTILL, SEX, QUALNUM, MSTATUS, TENURE, RELAT, FAMTYPE, SOCLASS, ECONPRIM, ETHGROUP, TRANWORK, AREAP, COBIRTH

The sequences used for the visit sequence experiments are contained in the csv files in this folder. Note there are two files for each Census dataset, each containing the same information in a different format: 

- files endings in "_index.csv" contain the sequence orderings by column index number (if the dataset is ordered as detailed above)

- files ending in "_names.csv" contain the sequences orderings by variable name

