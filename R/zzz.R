
get_key <- function() {
  Sys.getenv("VOTESMART_API_KEY")
}

.onLoad <- function(libname, pkgname) {
  message("Storing API key in global variable `pvs.key`.")
  pvs.key <<- get_key()
}
