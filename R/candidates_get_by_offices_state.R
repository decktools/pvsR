#' Get candidates by the state in which they hold office
#'
#' @param state_ids Optional: vector of state abbreviations. Default is \code{NA}, for national elections.
#' @param office_ids Required: vector of office ids that candidates hold. See \link{\code{Office.getLevels}} and \link{\code{Office.getOfficesByLevel}} for office ids.
#' @param election_years Optional: vector of election years in which the candidate held office. Default is the current year.
#' @param verbose Should cases when no data is available be messaged?
#'
#' @return A dataframe of candidates and their attributes. If a given \code{state_id} + \code{office_id} + \code{election_year} combination returns no data, that row will be filled with \code{NA}s.
#' @export
#'
#' @examples
#' \dontrun{
#' candidates_get_by_office_state(c(NA, "NY", "CA"), c("1", "6"), verbose = TRUE)
#' }
candidates_get_by_office_state <- function(state_ids = NA,
                                           office_ids, 
                                           election_years = "", 
                                           verbose = FALSE) {
  req <- "Candidates.getByOfficeState?"
  
  state_ids %<>% 
    purrr::as_vector()
  office_ids %<>% 
    purrr::as_vector()
  election_years %<>% 
    purrr::as_vector()
  
  query_df <- 
    expand.grid(
      state_id = state_ids, 
      office_id = office_ids,
      election_year = election_years
    ) %>%
    mutate(
      query = 
        dev.glue(
          "&stateId={state_id}&officeId={office_id}&electionYear={election_year}"
          )
    ) 
  
  out <- tibble()
  
  for (i in 1:nrow(query_df)) {
    q <- query_df$query[i]
    state_id <- query_df$state_id[i]
    office_id <- query_df$office_id[i]
    
    url <- 
      construct_url(req, q)
    
    raw <- request(url)
    
    lst <- 
      raw$candidateList$candidate
    
    if (is.null(lst) && verbose) {
      dev.glue_message(
        "No results found for state_id {state_id} and office_id {office_id}."
      )
      
      # Other cols will be NA
      this <- 
        tibble(
          office_id = office_id,
          state_id = state_id
        )
    } else {
      # Turn each element into a tibble and rowbind them
      this <- lst %>% 
        purrr::map(as_tibble) %>% 
        bind_rows() %>% 
        wrangle.clean_df() %>% 
        mutate(
          office_id = office_id,
          state_id = state_id
        ) %>% 
        mutate_all(as.character)
    }
    
    out %<>% 
      bind_rows(this)
  }
  out %>% 
    select(
      candidate_id,
      first_name,
      nick_name,
      middle_name,
      last_name,
      suffix,
      title,
      ballot_name,
      state_id,
      office_id,
      everything()
    )
}

candidates_get_by_office_state(c( "NY","NA", "CA"), c("1", "6"))
