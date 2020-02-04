
as_char_vec <- function(x) {
  x %>% 
    purrr::as_vector() %>% 
    as.character()
}
