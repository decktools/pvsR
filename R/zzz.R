
.onAttach <- function(libname, pkgname) {
  message("Storing API key in global variable `pvs.key`.")
  pvs.key <<- Sys.getenv("VOTESMART_API_KEY")
}

.onDetach <- function(libpath) {
  if (exists("pvs.key")) {
    rm(pvs.key)
  }
}
