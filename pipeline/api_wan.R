# api_wan <- function(resource){
#   url <- base::paste0('https://swapi.dev/api/', resource)
#   response <- httr::GET(url)
#   content <- base::rawToChar(response$content)
#   jsonlite::fromJSON(content)$results
# }

api_wan <- function(resource){
  message(paste0('Fetching ', resource, '...'))
  url <- base::paste0('https://swapi.dev/api/', resource, '/?page=1')
  response <- httr::GET(url)
  content <- base::rawToChar(response$content)
  
  results <- jsonlite::fromJSON(content)$results
  
  n_pages <- ceiling(jsonlite::fromJSON(content)$count/10)
  page <- 1
  while(page<n_pages){
    page <- page+1
    message(paste('- page', page,'of', n_pages))
    url <- base::paste0('https://swapi.dev/api/', resource, '/?page=', page)
    response <- httr::GET(url)
    content <- base::rawToChar(response$content)
  
    results <- rbind(results, 
                     jsonlite::fromJSON(content)$results)
  }
  results
}
