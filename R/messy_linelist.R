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
#' * Duplicates 1% of rows
#'
#' To change the defaults of `messy_linelist()` arguments can be supplied
#' to `...`.
#'
#' Accepted arguments and their defaults are:
#'
#' \describe{
#'   \item{`prop_missing`}{A `numeric` between 0 and 1 for the proportion of
#'   missing values. Default is `0.1` (10%).}
#'   \item{`missing_value`}{A single atomic \R object used to represent missing
#'   values. Default is `NA`.}
#'   \item{`prop_spelling_mistakes`}{A `numeric` between 0 and 1 used to
#'   specify the proportion of spelling mistakes in `character` columns.
#'   Default is `0.1` (10%).}
#'   \item{`inconsistent_sex`}{A `logical` boolean to specify whether the
#'   `$sex` column uses `"m"` and `"f"`, or inconsistently uses `"m"`, `"f"`,
#'   `"M"`, `"F"`, `"male"`, `"female"`, `"Male"` or `"Female"`. Default
#'   is `TRUE` so sexes are sampled from the options.}
#'   \item{`sex_as_numeric`}{A `logical` boolean used to specify whether
#'   the values in the `$sex` column should be encoded as `numeric`
#'   values (`0` and `1`). Default is `FALSE`. `sex_as_numeric` cannot be
#'   `TRUE` if `inconsistent_sex = TRUE`.}
#'   \item{`numeric_as_char`}{A `logical` boolean used to specify whether
#'   `numeric` columns should be coerced to `character`. Default is `TRUE`.}
#'   \item{`date_as_char`}{A `logical` boolean used to specify whether `Date`
#'   columns should be coerced to `character`. Default is `TRUE`.}
#'   \item{`inconsistent_dates`}{A `logical` boolean used to specify whether
#'   the values in `Date` columns are inconsistently formatted (e.g.
#'   `"%Y-%m-%d"`, `"%Y/%m/%d"`, `"%d-%m-%Y"`, or `"%d %B %Y"`).
#'   Default is `FALSE`.}
#'   \item{`int_as_word`}{A `logical` boolean used to specify whether
#'   `integer` columns should be coerced to `words` (see
#'   [english::words()]). Default is `TRUE`.}
#'   \item{`prop_duplicate_row`}{A `numeric` between 0 and 1 for the
#'   proportion of rows to duplicate. Default is `0.01` (1%). If
#'   `prop_duplicate_row` > 0 then it is guaranteed that at least one row will
#'   be duplicated.}
#' }
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
#' Rows are duplicated after other _messy_ modifications so the duplicated row
#' contains identical _messy_ elements.
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
  linelist <- .as_df(linelist)

  args <- list(
    prop_missing = 0.1,
    missing_value = NA,
    prop_spelling_mistakes = 0.1,
    inconsistent_sex = TRUE,
    sex_as_numeric = FALSE,
    numeric_as_char = TRUE,
    date_as_char = TRUE,
    inconsistent_dates = FALSE,
    int_as_word = TRUE,
    prop_duplicate_row = 0.1
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
  checkmate::assert_number(args$prop_duplicate_row, lower = 0, upper = 1)
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
      misspell <- stats::runif(length(col)) < args$prop_spelling_mistakes
      ifelse(
        test = misspell,
        yes = vapply(col, .spelling_mistake, character(1)),
        no = col
      )
    })
  }

  # call before numeric_as_char to detect integer cols
  if (args$int_as_word) {
    int_col <- vapply(linelist, is.integer, FUN.VALUE = logical(1))
    linelist[, int_col] <- vapply(
      linelist[, int_col],
      english::words,
      FUN.VALUE = character(nrow(linelist))
    )
  }

  # call after prop_spelling_mistakes to not create mistakes to numeric chars
  if (args$numeric_as_char) {
    numeric_col <- vapply(linelist, is.numeric, FUN.VALUE = logical(1))
    # as.data.frame to stop data.frame column inserted as matrix
    # drop = FALSE as length of FUN.VALUE arg depends on input type
    linelist[, numeric_col] <- as.data.frame(
      vapply(
        linelist[, numeric_col, drop = FALSE],
        as.character,
        FUN.VALUE = character(nrow(linelist))
      )
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

  if (args$prop_duplicate_row > 0) {
    n_row <- nrow(linelist)
    row_idx <- sample(x = n_row,size = ceiling(args$prop_duplicate_row * n_row))
    row_idx <- sort(c(seq_len(n_row), row_idx), decreasing = FALSE)
    linelist <- linelist[row_idx, ]
    row.names(linelist) <- NULL
  }

  linelist <- .restore_df_subclass(linelist)

  # return line list
  linelist
}
