

grab_data <- function(tbl = endpoint_input_mapping_nested, endpt, ...) {
  
  row <- 
    tbl %>% 
    filter(
      endpoint == endpt
    )
  
  req <- dev.glue("{endpt}?")
  
  args <- 
    row %>% 
    tidyr::unnest(inputs) %>% 
    pull(input)
  
  query_inputs <- 
    dev.glue("&{args}=")
  
  inputs <- 
    match.call(expand.dots = FALSE) 
  
  query_value <- 
    inputs$...[[args[1]]]
  
  query <- dev.glue("{query_inputs[1]}{query_value}")
  
  url <- 
    construct_url(req, query)
  
  raw <- request(url)
  
  raw
}
