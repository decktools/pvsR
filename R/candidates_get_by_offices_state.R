
candidates_get_by_office_state <- function(state_id, office_id) {
  req <- "Candidates.getByOfficeState?"
  
  
  
  query <- 
    dev.glue(
      "&stateId={state_ids}&officeId={office_ids}"
    )
  
  url <- 
    construct_url(req, query)
  
  raw <- request(url)
  
  lst <- 
    raw$candidateList$candidate
  
  # Turn each element into a tibble and rowbind them
  lst %>% 
    purrr::map(as_tibble) %>% 
    bind_rows() %>% 
    wrangle.clean_df()
}

candidates_get_by_office_state(c( "NY","NA", "CA"), c("1", "6"))
