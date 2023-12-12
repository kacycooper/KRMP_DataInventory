library(dplyr)

# query obis and gbif 
# There is some data wrangling happening in these scripts, but I segregated it so it wouldn't be overwhelming.

source("scripts/query_and_wrangle_gbif.R")
source("scripts/query_and_wrangle_obis.R")

rm(list = ls()[!ls() %in% c("obis_datasets", 
                            "obis_col_names",
                            "gbif_datasets", 
                            "gbif_col_names")])

#Combine GBIF and OBIS
all_datasets <- rbind(gbif_datasets, obis_datasets)

# Write out table of datasets with basic metadata
readr::write_csv(x = all_datasets, 
                 file = paste0("data_output/GBIF_and_OBIS_datasets_in_California_EEZ_", 
                               Sys.Date(), 
                               ".csv"))

# Write out list of other metadata attributes returned by OBIS and GBIF
# Make OBIS same length as GBIF

length(obis_col_names) <- length(gbif_col_names) 

colnames_df <- tibble('GBIF Column Names' = gbif_col_names,
                          'OBIS Column Names' = obis_col_names)

#Write out col names
readr::write_csv(x = colnames_df, 
                 file = paste0("data_output/GBIF_and_OBIS_colnames_", 
                               Sys.Date(), 
                               ".csv"))
