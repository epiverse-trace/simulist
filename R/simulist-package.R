# https://usethis.r-lib.org/reference/use_package_doc.html

#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL

# nocov start
# fix for R CMD check from https://github.com/hadley/r-pkgs/issues/828
ignore_unused_imports <- function() {
  epiparameter::epidist
}
# nocov end
