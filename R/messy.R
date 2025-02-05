#' Create messy line list data
#'
#' @param linelist Line list `<data.frame>` output from [sim_linelist()].
#' @inheritParams create_config
#'
#' @details
#' By default `messy()`:
#'
#' * Makes 10% of values missing, i.e. converts to `NA`.
#' * Introduces spelling mistakes in 10% of `character` columns.
#' * Introduce inconsistency in the reporting of `$sex`.
#'
#' To change the defaults of `messy()` arguments can be supplied to `...`.
#' Accepted arguments and their defaults are:
#'
#' * `prop_missing = 0.1`
#' * `missing_value = NA`
#' * `prop_spelling_mistakes = 0.1`
#' * `inconsistent_sex = TRUE`
#' * `sex_as_numeric = FALSE`
#'
#' When setting `sex_as_numeric` to `TRUE`, male is set to `0` and female
#' to `1`. Only one of `inconsistent_sex` or `sex_as_numeric` can be `TRUE`,
#' otherwise the function will error.
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
#'
#' # increasing proportion of spelling mistakes to 50%
#' messy_linelist <- messy(linelist, prop_spelling_mistakes = 0.5)
#'
#' # encode `$sex` as `numeric`
#' messy_linelist <- messy(
#'   linelist,
#'   sex_as_numeric = TRUE,
#'   inconsistent_sex = FALSE
#' )
messy <- function(linelist, ...) {
  args <- list(
    prop_missing = 0.1,
    missing_value = NA,
    prop_spelling_mistakes = 0.1,
    inconsistent_sex = TRUE,
    sex_as_numeric = FALSE
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

  # check args list after any user changes
  checkmate::assert_number(args$prop_spelling_mistakes, lower = 0, upper = 1)
  checkmate::assert_logical(args$inconsistent_sex, any.missing = FALSE, len = 1)
  checkmate::assert_logical(args$sex_as_numeric, any.missing = FALSE, len = 1)
  stopifnot(
    "Only one of `inconsistent_sex` or `sex_as_numeric` can be `TRUE`." =
      !(args$inconsistent_sex && args$sex_as_numeric)
  )

  if (args$inconsistent_sex) {
    linelist$sex[linelist$sex == "m"] <- sample(
      x = c("m", "M", "male", "Male"),
      size = sum(linelist$sex == "m"),
      replace = TRUE
    )
    linelist$sex[linelist$sex == "f"] <- sample(
      x = c("f", "F", "female", "Female"),
      size = sum(linelist$sex == "f"),
      replace = TRUE
    )
  } else if (args$sex_as_numeric) {
    # vectorised switch
    linelist$sex <- vapply(
      linelist$sex, switch, m = 0L, f = 1L, FUN.VALUE = numeric(1)
    )
  }

  if (args$prop_spelling_mistakes > 0) {
    # only apply spelling mistakes on character columns
    char_cols <- names(linelist)[(vapply(linelist, is.character, logical(1)))]
    linelist[char_cols] <- lapply(linelist[char_cols], function(col) {
      misspell <- runif(length(col)) < args$prop_spelling_mistakes
      ifelse(
        test = misspell,
        yes = vapply(col, .spelling_mistake, character(1)),
        no = col
      )
    })
  }

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
