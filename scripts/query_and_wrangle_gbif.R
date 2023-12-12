library(rgbif)
library(mregions2)
library(dplyr)
library(sf)


# Query download and mint DOI ---------------------------------------------

# Do this once
# rgbif::occ_download(
#   user = 'sformel',
#   email = 'sformel@usgs.gov',
#   pwd = rstudioapi::askForPassword("Please enter your GBIF password"),
#   pred_and(
#     pred_in(
#       "taxonKey", c(4267628, 5422328)),
#     pred_within(US_north_pacific_EEZ_concave_hull)),
#   format = 'SIMPLE_CSV')

#Check gbif download status
downloadLink <- occ_download_wait('0021163-231120084113126') %>% 
  .[["downloadLink"]]

#Read in data - must download first
temp <- tempdir()
destfile <- paste0(temp, "/", basename(downloadLink))
download.file(url = downloadLink, destfile = destfile)
csv_name <- basename(tools::file_path_sans_ext(destfile))
gbif_datasets <- readr::read_tsv(file = unz(destfile, filename = paste0(csv_name, ".csv")))
unlink(temp)

# Get list of datasets
gbif_dataset_ids <- gbif_datasets %>% 
  pull(datasetKey) %>% 
  unique()

# Get possible column names
gbif_col_names <- rgbif::datasets(uuid = gbif_dataset_ids[1]) %>%
  .[["data"]] %>% 
  names(.) %>% 
  sort()

# get dataset metadata
gbif_datasets <-
  lapply(gbif_dataset_ids, function(x)
    rgbif::datasets(uuid = x) %>%
      .[["data"]] %>%
      purrr::keep(names(.) %in% c(
        'key',
        'doi',
        'title',
        'description'
      )) %>% 
      as.data.frame()) %>% 
  data.table::rbindlist(fill = TRUE)

# Match OBIS column names and make DOIs into URLs
gbif_datasets <- gbif_datasets %>% 
  rename(id = key,
         url = doi,
         abstract = description) %>% 
  mutate(url = paste0("https://doi.org/", url))

rm(list = ls()[!ls() %in% c("gbif_datasets", "gbif_col_names")])
