library(jsonlite)
source('api_wan.R')


# Set data output directories
raw_path <- 'data/raw/raw_'


# Collect raw data from API
resources <- c('films', 'people', 'planets', 'species', 'starships', 'vehicles')
for(resource in resources){
  write_json(api_wan(resource), paste0(raw_path, resource, '.json'))
}

# 
# 
# library(httr)
# library(jsonlite)
# library(data.table)
# 
# # Define api_wan() a function to return SWAPI data for a given resource (e.g. films)
# api_wan <- function(resource){
#   url <- paste0('https://swapi.dev/api/', resource)
#   response <- GET(url)
#   content <- rawToChar(response$content)
#   fromJSON(content)$results
# }
# 
# # Use a for loop to request and return each dataset to the working environment
# for(resource in c('people', 'planets', 'films', 'species', 'vehicles', 'starships')){
#   assign(paste0('raw_', resource), 
#          data.table(api_wan(resource)))
# }

