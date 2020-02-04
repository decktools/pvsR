
clean_xml <- function(x) {
  stringr::str_extract_all(x, ">.*<") %>% 
    stringr::str_remove_all("[><\\n]")
}

candidates_get_by_office_state <- function(state_ids, office_ids) {
  req <- "Candidates.getByOfficeState?"
  
  query <- 
    dev.glue(
      "&stateId={state_ids}&officeId={office_ids}"
    )
  
  url <- 
    construct_url(req, query)
  
  raw <- request(url)
  
  df <- 
    raw %>% 
    xml2::read_xml() %>% 
    purrr::map_dfc(clean_xml)
}

candidates_get_by_office_state("NA", "1") %>% xml2::read_xml()