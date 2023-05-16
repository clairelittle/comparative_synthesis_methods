################################################################################################################################
##
## Author: Claire Little https://github.com/clairelittle/comparative_synthesis_methods
## Date: May 2023
## r version: 4.1.3
## RStudio version: 2021.09.0+351 "Ghost Orchid" Release (077589bcad3467ae79f318afe8641a1899a51606, 2021-09-20) for Windows
##
## Code to calculate the propensity mean squared error (pMSE) for the synthetic data compared to original data
##
## ***** NOTE: This code is simple and without error checking - use at own risk - check it is doing what you think it should!
##
################################################################################################################################

library(tidyverse) 

####################################################### propensity Mean Squared Error
#
# The pMSE was calculated using CART, which should be better than logistic regression.
# Since the expected null mean only needs to be calculated once for each dataset, this should speed things up
#
#
# This used code from the 'pmse_CART_utility.R' file, available here (last checked 16/05/23):
# https://github.com/ClaireMcKayBowen/Code-for-NIST-PSCR-Differential-Privacy-Synthetic-Data-Challenge/tree/master/rcode
# and used in the paper: "Comparative Study of Differentially Private Synthetic Data Algorithms from the NIST PSCR Differential
# Privacy Synthetic Data Challenge" by Bowen and Snoke
#
## requires tidyverse



#################################################################################
# CART pMSE Utility Functions
#################################################################################

# Functions for estimating pmse and null pmse using CART models
# INPUTS:
#     orig_data: original data (df)
#     data_list: synthetic data (df)
#     cp: CART model complexity parameter
#     nperm: number of permutations for estimating the null
# OUTPUTS:
#     pmse: joint distributional utility metric (num)
#     mean_null_pmse: joint distributional utility metric under the null of two data sets drawn from the same distribution (num)



## function to compute observed pmse for a single synthetic data set
pmse_compute = function(syn_data, orig_data, cp){
  
  ## combine original and synthetic data and add group indicator
  comb_data = bind_rows(orig_data, select(syn_data, colnames(orig_data))) %>% 
    mutate(id = c(rep(0, nrow(orig_data)), rep(1, nrow(syn_data))))
  
  ## fit model and predict prop scores
  prop_cart = rpart(id ~ ., data = comb_data, cp = cp, method = 'class')
  pred_prob = predict(prop_cart)[, 2]
  
  ## estimate observed pmse
  pmse = mean((pred_prob - (nrow(syn_data) / nrow(comb_data))) ^ 2)
  
  return(pmse)
}


## function to calculate null pmse
compute_null_pmse = function(orig_data, nperm, cp){
  
  pmse_null = rep(NA, nperm)
  for(a in 1:nperm){
    ## bootstrap 2 times the rows
    samp_row = sample(1:nrow(orig_data), (nrow(orig_data) * 2), replace = TRUE)
    
    ## combine and add indicators
    comb_data = orig_data[samp_row, ] %>% 
      mutate(id = rep(0:1, each = nrow(orig_data)))
    
    ## fit model and predict prop scores
    prop_cart = rpart(id ~ ., data = comb_data, cp = cp, method = 'class')
    pred_prob = predict(prop_cart)[, 2]
    
    ## calculate pmse
    pmse_null[a] = mean((pred_prob - 0.5) ^ 2)
    
    ## just so we know the progress (many permutations can take a while) - added by Claire Little
    print(paste0("iteration ",a, " at ", format(Sys.time(), "%H:%M:%S")))
  }
  
  mean_null_pmse = mean(pmse_null)
  return(mean_null_pmse)
}



################################################################################################################################
################################################################################################################################


########################################################## Example of usage

### For each Census dataset, 100 permutations were used to calculate the null pmse
## original = original dataframe
## synthetic = synthetic dataframe

## Calculate the null pmse:
# set.seed(123)
null_pmse <- compute_null_pmse(original, nperm=100, cp=0.001)

# calculate pmse:
pmse <- pmse_compute(synthetic, original, cp=0.001)          
# pmse ratio:
pmse_ratio <- pmse/null_pmse 
# log pmse ratio:
log_pmse_ratio <- log(pmse/null_pmse)

