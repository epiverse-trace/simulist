#' Create messy line list data
#'
#' @description
#' Take line list output from [sim_linelist()] and replace elements of
#' the `<data.frame>` with missing values (e.g. `NA`), introduce spelling
#' mistakes and inconsistencies, as well as coerce date types.
#'
#' @param linelist Line list `<data.frame>` output from [sim_linelist()].
#' @inheritParams create_config
#'
#' @details
#' By default `messy_linelist()`:
#'
#' * Makes 10% of values missing, i.e. converts to `NA`.
#' * Introduces spelling mistakes in 10% of `character` columns.
#' * Introduce inconsistency in the reporting of `$sex`.
#' * Converts `numeric` columns (`double` & `integer`) to `character`.
#' * Converts `Date` columns to `character`.
#' * Converts `integer` columns to (English) words.
#'
#' To change the defaults of `messy_linelist()` arguments can be supplied
#' to `...`.
#'
#' Accepted arguments and their defaults are:
#'
#' * `prop_missing = 0.1`
#' * `missing_value = NA`
#' * `prop_spelling_mistakes = 0.1`
#' * `inconsistent_sex = TRUE`
#' * `sex_as_numeric = FALSE`
#' * `numeric_as_char = TRUE`
#' * `date_as_char = TRUE`
#' * `inconsistent_dates = FALSE`
#' * `int_as_word = TRUE`
#'
#' When setting `sex_as_numeric` to `TRUE`, male is set to `0` and female
#' to `1`. Only one of `inconsistent_sex` or `sex_as_numeric` can be `TRUE`,
#' otherwise the function will error.
#'
#' If `numeric_as_char = TRUE` and `sex_as_numeric = TRUE` then the sex encoded
#' as 0 or 1 is converted to `character`. If `prop_spelling_mistake` > 0 and
#' `numeric_as_char = TRUE` the columns that are converted from `numeric` to
#' `character` do not have spelling mistakes introduced, because they are
#' numeric characters stored as character strings. If
#' `prop_spelling_mistake` > 0 and `date_as_char = TRUE` spelling mistakes are
#' not introduced into dates.
#'
#' The `Date` columns can be converted into an inconsistent format by
#' setting `inconsistent_dates = TRUE` and it requires `date_as_char = TRUE`,
#' if the latter is `FALSE` the function will error.
#'
#' If `numeric_as_char = FALSE` and `int_as_word = TRUE` then the integer
#' columns are converted to `character` string words but the other `numeric`
#' columns are not coerced. Spelling mistakes are not introduced into integers
#' converted to words when `prop_spelling_mistakes` > 0 and
#' `int_as_word = TRUE`.
#'
#' @return A messy line list `<data.frame>`.
#' @export
#'
#' @examples
#' linelist <- sim_linelist()
#' messy_linelist <- messy_linelist(linelist)
#'
#' # increasing proportion of missingness to 30% with a missing value of -99
#' messy_linelist <- messy_linelist(
#'   linelist,
#'   prop_missing = 0.3,
#'   missing_value = -99
#' )
#'
#' # increasing proportion of spelling mistakes to 50%
#' messy_linelist <- messy_linelist(linelist, prop_spelling_mistakes = 0.5)
#'
#' # encode `$sex` as `numeric`
#' messy_linelist <- messy_linelist(
#'   linelist,
#'   sex_as_numeric = TRUE,
#'   inconsistent_sex = FALSE
#' )
#'
#' # inconsistently formatted dates
#' messy_linelist <- messy_linelist(linelist, inconsistent_dates = TRUE)
messy_linelist <- function(linelist, ...) {
  .check_linelist(linelist)

  args <- list(
    prop_missing = 0.1,
    missing_value = NA,
    prop_spelling_mistakes = 0.1,
    inconsistent_sex = TRUE,
    sex_as_numeric = FALSE,
    numeric_as_char = TRUE,
    date_as_char = TRUE,
    inconsistent_dates = FALSE,
    int_as_word = TRUE
  )

  # capture dynamic dots
  dots <- rlang::dots_list(..., .ignore_empty = "none", .homonyms = "error")
  dots_names <- names(dots)

  # check arguments in dots match arg list
  stopifnot(
    "Incorrect argument names supplied to `messy_linelist()`" =
      all(dots_names %in% names(args))
  )

  # replace default args if in dots
  args <- utils::modifyList(args, dots)

  # check args list after any user changes
  checkmate::assert_number(args$prop_spelling_mistakes, lower = 0, upper = 1)
  checkmate::assert_logical(args$inconsistent_sex, any.missing = FALSE, len = 1)
  checkmate::assert_logical(args$sex_as_numeric, any.missing = FALSE, len = 1)
  checkmate::assert_logical(args$numeric_as_char, any.missing = FALSE, len = 1)
  checkmate::assert_logical(args$date_as_char, any.missing = FALSE, len = 1)
  checkmate::assert_logical(
    args$inconsistent_dates, any.missing = FALSE, len = 1
  )
  checkmate::assert_logical(args$int_as_word, any.missing = FALSE, len = 1)
  stopifnot(
    "Only one of `inconsistent_sex` or `sex_as_numeric` can be `TRUE`." =
      !(args$inconsistent_sex && args$sex_as_numeric),
    "`date_as_char` must be TRUE when `inconsistent_dates = TRUE`." =
      !(args$inconsistent_dates && isFALSE(args$date_as_char))
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

  # call after prop_spelling_mistakes to not create mistakes to numeric chars
  if (args$numeric_as_char) {
    numeric_col <- vapply(linelist, is.numeric, FUN.VALUE = logical(1))
    linelist[, numeric_col] <- vapply(
      linelist[, numeric_col],
      as.character,
      FUN.VALUE = character(nrow(linelist))
    )
  }

  # call after prop_spelling_mistakes to not create mistakes to date chars
  if (args$date_as_char) {
    date_col <- vapply(
      linelist, inherits, FUN.VALUE = logical(1), what = "Date"
    )
    linelist[, date_col] <- vapply(
      linelist[, date_col],
      as.character,
      FUN.VALUE = character(nrow(linelist))
    )
  }

  if (args$inconsistent_dates) {
    date_col <- startsWith(colnames(linelist), "date_")
    date_fmt <- sample(
      c("%Y-%m-%d", "%Y/%m/%d", "%d-%m-%Y", "%d/%m/%Y", "%d %B %Y", "%d %b %Y"), # nolint nonportable_path_linter
      size = nrow(linelist),
      replace = TRUE
    )
    for (col in colnames(linelist[, date_col])) {
      # format arg is is vectorised
      linelist[, col] <- strftime(linelist[, col], format = date_fmt)
    }
  }

  if (args$int_as_word) {
    int_col <- vapply(linelist, is.integer, FUN.VALUE = logical(1))
    linelist[, int_col] <- vapply(
      linelist[, int_col],
      english::words,
      FUN.VALUE = character(nrow(linelist))
    )
  }

  # random missingness introduced across <data.frame>
  num_missing <- round(prod(dim(linelist)) * args$prop_missing)

  # matrix of line list dimensions to sample unique index pairs
  ll_dim_idx <- expand.grid(
    row = seq_len(nrow(linelist)),
    col = seq_len(ncol(linelist))
  )

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
