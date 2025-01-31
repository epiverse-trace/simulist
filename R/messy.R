#' Create messy line list data
#'
#' @param linelist Line list `<data.frame>` output from [sim_linelist()].
#' @inheritParams create_config
#'
#' @details
#' By default `messy()`:
#'
#' * Makes 10% of values missing, i.e. converts to `NA`.
#'
#' To change the defaults of `messy()` arguments can be supplied to `...`.
#' Accepted arguments and their defaults are:
#'
#' * `prop_missing = 0.1`
#' * `missing_value = NA`
#'
#' @return A messy line list `<data.frame>`.
#' @export
#'
#' @examples
#' linelist <- sim_linelist()
#' messy_linelist <- messy(linelist)
#'
#' # increasing proportion of missingness to 30% with a missing value of -99
#' messy_linelist <- messy(linelist, prop_missing = 0.3, missing_value = -99)
messy <- function(linelist, ...) {
  args <- list(
    prop_missing = 0.1,
    missing_value = NA
  )

  # capture dynamic dots
  dots <- rlang::dots_list(..., .ignore_empty = "none", .homonyms = "error")
  dots_names <- names(dots)

  # check arguments in dots match arg list
  stopifnot(
    "Incorrect argument names supplied to create_config" =
      all(dots_names %in% names(args))
  )

  # replace default args if in dots
  args <- utils::modifyList(args, dots)

  # random missingness introduced across <data.frame>
  num_missing <- round(prod(dim(linelist)) * args$prop_missing)

  # matrix of line list dimensions to sample unique index pairs
  ll_dim_idx <- expand.grid(row = 1:nrow(linelist), col = 1:ncol(linelist))

  # sample line list index pairs
  ll_idx <- ll_dim_idx[sample(nrow(ll_dim_idx), num_missing), ]

  # set sampled index pairs to missing
  for (i in seq_len(num_missing)) {
    # check user-specified missing_value causing unwanted type coercion
    linelist[ll_idx[i, 1], ll_idx[i, 2]] <- args$missing_value
  }

  # return line list
  linelist
}
