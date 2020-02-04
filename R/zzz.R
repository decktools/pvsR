
get_key <- function() {
  Sys.getenv("VOTESMART_API_KEY")
}

.onAttach <- function(libname, pkgname) {
  message("Storing API key in global variable `pvs.key`.")
  pvs.key <<- get_key()
}
