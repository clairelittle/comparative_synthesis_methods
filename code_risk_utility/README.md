# Code for the utility and risk metrics

The code for this project was written using a mixture of R and python. This folder contains code for the metrics used to analyse the data. That is, the utility metrics:
- Ratio of Counts (ROC) for bivariate (two-way) cross-tabulations
- Ratio of Counts (ROC) for trivariate (three-way) cross-tabulations
- Confidence Interval Overlap (CIO)
- Propensity Mean Squared Error (pMSE)

and the disclosure risk metric:
- Targeted Correct Attribution Probability (TCAP)

The mean of the four utility values was used as the overall utility score, and the TCAP was used as the disclosure risk score. Further information specific to each dataset follows:

### Ratio of counts (ROC)

The ROC bivariate was calculated for all combinations of two variables, and the ROC trivariate for all combinations of three variables. For each dataset missing values were included as an extra category/value (i.e. not discarded).

**Note** to calculate the ROC (and only for this purpose) for the Canada 2011 Census data, the CA2011A_INCTOT variable was binned into ten categories of approximately similar size:

```[-Inf, 1200), [1200, 9000), [9000, 15100), [15100, 20800), [20800, 28100), [28100, 35400), [35400, 43800), [43800, 55600), [55600, 75400), [75400, Inf]```


### Confidence Interval Overlap (CIO)

For each dataset, two logistic regressions were performed, with housing tenure and marital status as the targets. A binary target was created (where it did not already exist). For marital status this was, married (or living together) and any other value. For tenure this was, owning their own home, and any other value. For a parsimonious model, eight predictors were used. Details for each dataset follow (note that in the list of predictors, tenure and marital status are not used as a predictor when they are also the target variable):

**Canada** 
- Targets: CA2011A_MARST, CA2011A_TENURE
- Predictors: CA2011A_AGE, CA2011A_ABIDENT, CA2011A_SEX, URBAN, CA2011A_CLASSWK, CA2011A_EMPSTAT, CA2011A_DEGREE, CA2011A_TENURE/CA2011A_MARST
	
**Fiji** 
- Targets: FJ2007A_MARST, FJ2007A_TENURE
- Predictors: FJ2007A_AGE, FJ2007A_SEX, FJ2007A_CLASSWKR, FJ2007A_PROV, FJ2007A_ETHNIC, FJ2007A_EDATTAIN, FJ2007A_RELIGION, FJ2007A_TENURE/FJ2007A_MARST

Note that the following variables were aggregated: FJ2007A_EDATTAIN (four categories: primary and below, secondary, post_secondary, other); FJ2007A_ETHNIC (three categories: Fijian, Indian, other); FJ2007A_RELIGION (six categories: Methodist, Catholic, Seventh Day Adventist, Assembly of God, Sanatan, None) 

**Rwanda** 
- Targets: RW2012A_MARST, RW2012A_OWNERSH
- Predictors: RW2012A_AGE, RW2012A_SEX, RW2012A_CLASSWK, RW2012A_DISAB1, RW2012A_EDCERT, RW2012A_RELIG, RW2012A_LIT, RW2012A_OWNERSH/RW2012A_MARST

Note that the following variables were aggregated: RW2012A_LIT (three categories: None, Kinyarwanda, Other, Unknown); RW2012A_DISAB1 (two categories: None, Yes) 

**UK** 
- Targets: MSTATUS, TENURE
- Predictors: AGE, ECONPRIM, ETHGROUP, LTILL, QUALNUM, SEX, SOCLASS, TENURE/MSTATUS


### Targeted Correct Attribution Probability (TCAP)

A summary of the key and target variables is listed below. For each dataset, there were three target variables, and the same set of keys were used for all three. Combinations of 3, 4, 5 and 6 keys were used. The six key variables are listed together; the first three were used in the case of 3 keys, the first four for 4 keys, etc.

**Canada** 
- Targets: CA2011A_RELIG, CA2011A_CITIZEN, CA2011A_TENURE
- Keys: CA2011A_AGE, CA2011A_SEX, CA2011A_MARST, CA2011A_MINORITY, CA2011A_EMPSTAT, CA2011A_BPL
	
**Fiji** 
- Targets: FJ2007A_RELIGION, FJ2007A_WORKTYPE, FJ2007A_TENURE
- Keys: FJ2007A_PROV, FJ2007A_AGE, FJ2007A_SEX, FJ2007A_MARST, FJ2007A_ETHNIC, FJ2007A_CLASSWKR

**Rwanda** 
- Targets: RW2012A_RELIG, RW2012A_WKSECTOR, RW2012A_OWNERSH
- Keys: RW2012A_AGE, RW2012A_SEX, RW2012A_MARST, RW2012A_CLASSWK, RW2012A_URBAN, RW2012A_BPL

**UK** 
- Targets: LTILL, FAMTYPE, TENURE
- Keys: AREAP, AGE, SEX, MSTATUS, ETHGROUP, ECONPRIM



