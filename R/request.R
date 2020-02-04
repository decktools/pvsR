
BASE_URL <- "http://api.votesmart.org/"

construct_url <- function(req, query) {
  key <- get_key()
  
  dev.glue("{BASE_URL}{req}key={key}{query}&o=JSON")
}

request <- function(url, verbose = FALSE) {
  
  if (verbose) {
    dev.glue_message(
      "Requesting: {url}."
    )
  }
  
  resp <- 
    httr::GET(url) %>% 
    httr::stop_for_status()
  
  status <- httr::http_status(resp)

  httr::content(resp)
}
