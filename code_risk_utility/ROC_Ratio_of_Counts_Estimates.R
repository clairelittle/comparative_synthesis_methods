################################################################################################################################
## 
## Author: Claire Little https://github.com/clairelittle/comparative_synthesis_methods
## Date: May 2023
## r version: 4.1.3
## RStudio version: 2021.09.0+351 "Ghost Orchid" Release (077589bcad3467ae79f318afe8641a1899a51606, 2021-09-20) for Windows
##
## This file calculates the Ratio of counts/estimates (usually referred to as ROC/ROE) for the synthetic data compared 
## to the original data.
## Code is for calculating the bivariate (two-way) and trivariate (three-way) cross-tabulations
##
################################################################################################################################


###################################################### ROC functions


##### ***** NOTE: This code is simple and without error checking - use at own risk - check the results make sense!
##### ***** For all the functions, it requires that the data column (variable) order is the same for the original and the 
##### ***** synthetic data. 
##### ***** Also that the columns to be compared are of the same type (e.g data$age is integer and synth$age is integer)


################################################################################################################################
########################### ROC Bivariate function
################################################################################################################################

# Ratio of Counts/Estimates - bivariate - using two variables

# INPUTS:
#     original:    the original dataset
#     synthetic:   the synthetic dataset
#     var1, var2:  index of the variables (e.g. for column 1, use 1, column 2 use 2)
# OUTPUTS:
#     results:     the ratio of estimates/counts for the particular variables


roc_bivariate <- function(original, synthetic, var1, var2){
  # create frequency tables for the original and synthetic data, on the two variable cross-tabulation
  orig_table<-as.data.frame(ftable(original[,var1], original[,var2]))
  syn_table<-as.data.frame(ftable(synthetic[,var1], synthetic[,var2]))
  ## remove all combinations that do not exist from the ftables , i.e. have zero frequency
  orig_table <- subset(orig_table, Freq > 0)
  syn_table <- subset(syn_table, Freq > 0)
  # calculate proportions:
  orig_table$prop <- orig_table$Freq/nrow(original)
  syn_table$prop <- syn_table$Freq/nrow(synthetic)
  # merge the two tables, by the variables:
  combined <- merge(orig_table, syn_table, by= c('Var1', 'Var2'), all=TRUE)
  # merging will induce NAs where there is a category mismatch - i.e. they exist in one but not the other
  # to deal with this set the NA values to zero (since there are zero occurrences):
  combined[is.na(combined)] <- 0
  # get the max and min proportion for each category level:
  combined$max <- pmax(combined$prop.x, combined$prop.y)
  combined$min <- pmin(combined$prop.x, combined$prop.y)
  # roc is min divided by max (a zero value for min results in a zero for ROC, as expected)
  combined$roc <- combined$min/combined$max;
  return(mean(combined$roc))
}



################################################################################################################################
########################### ROC Trivariate function
################################################################################################################################

# Ratio of Counts/Estimates - trivariate - using three variables

# INPUTS:
#     original:         the original dataset
#     synthetic:        the synthetic dataset
#     var1, var2, var3: index of the variables (e.g. for column 1, use 1, column 2 use 2, column 3 use 3)
# OUTPUTS:
#     results:     the ratio of estimates/counts for the particular variables


roc_trivariate <- function(original, synthetic, var1, var2, var3){
  # create frequency tables for the original and synthetic data, on the three variable cross-tabulation
  orig_table<-as.data.frame(ftable(original[,var1], original[,var2], original[,var3]))
  syn_table<-as.data.frame(ftable(synthetic[,var1], synthetic[,var2], synthetic[,var3]))
  ## remove all combinations that do not exist from the ftables , i.e. have zero frequency
  orig_table <- subset(orig_table, Freq > 0)
  syn_table <- subset(syn_table, Freq > 0)
  # calculate proportions:
  orig_table$prop <- orig_table$Freq/nrow(original)
  syn_table$prop <- syn_table$Freq/nrow(synthetic)
  # merge the two tables, by the variables:
  combined <- merge(orig_table, syn_table, by= c('Var1', 'Var2', 'Var3'), all=TRUE)
  # merging will induce NAs where there is a category mismatch - i.e. they exist in one but not the other
  # to deal with this set the NA values to zero (since there are zero occurrences):
  combined[is.na(combined)] <- 0
  # get the max and min proportion for each category level:
  combined$max <- pmax(combined$prop.x, combined$prop.y)
  combined$min <- pmin(combined$prop.x, combined$prop.y)
  # roc is min divided by max (a zero value for min results in a zero for ROC, as expected)
  combined$roc <- combined$min/combined$max 
  return(mean(combined$roc))
}


################################################################################################################################
################################################################################################################################


########################################################## Example of usage

### NOTE missing values were coded as 'B', creating a separate category (the appropriateness of this depends upon the data)

# original:   is the original dataframe
# synthetic:  is the synthetic dataframe

# get the ROC bivariate for cross-tabulation of columns 1 and 2
roc_biv <- roc_bivariate(original, synthetic, 1, 2)

# get the ROC trivariate for cross-tabulation of columns 1, 2 and 3
roc_triv <- roc_trivariate(original, synthetic, 1, 2, 3)


##########
### NOTE: ROC was calculated for all possible combinations of variables. The 'combn' function can be used for this

## For example this gives all two-way combinations of 15 variables:
combinations <- t(combn(15,2))  # 105 combinations
## This gives all three-way combinations of 15 variables:
combinations3 <- t(combn(15,3)) # 455 combinations
