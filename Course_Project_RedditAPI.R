#install.packages("RedditExtractoR")
library(dplyr)
library(RedditExtractoR)
library(foreach)
library(httr)
library(jsonlite)
library(readr)
library(stringr)

#first create folder named "reddit_comments"
#collect reddit thread urls using keywords related to e-cigarattes
keywords <- list("vape", "e-cigarettes", "vaping", "juul", "e-cig")

test_df <- foreach(i = 1:length(keywords), .combine = rbind) %do%
{get_reddit(search_terms = keywords[i],
            cn_threshold = 10,
            page_threshold = 10)
}

#save comments to csv
write_csv(unique(test_df), 
          (path = str_c("reddit_data", ".csv")))
