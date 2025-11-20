#' Create messy line list data
#'
#' @description
#' Take line list output from [sim_linelist()] and replace elements of
#' the `<data.frame>` with missing values (e.g. `NA`), introduce spelling
#' mistakes and inconsistencies, as well as coerce date types.
#'
#' @param linelist Line list `<data.frame>` output from [sim_linelist()].
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> Named elements to replace
#' default settings. Only if names match exactly are elements replaced,
#' otherwise the function errors.
#'
#' Accepted arguments and their defaults are:
#'
#' \describe{
#'   \item{`prop_missing`}{A `numeric` between 0 and 1 for the proportion of
#'   missing values introduced. Default is `0.1` (10%).
#'   }
#'   \item{`missing_value`}{A vector with the missing value(s). If multiple
#'   values are supplied a missing value is randomly sampled for each cell
#'   in the line list. Default is `NA`.}
#'   \item{`prop_spelling_mistakes`}{A `numeric` between 0 and 1 used to
#'   specify the proportion of spelling mistakes in `character` columns.
#'   Default is `0.1` (10%).
#'   }
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
#'   \item{`prop_int_as_word`}{A `numeric` between 0 and 1 for the proportion
#'   of elements in `integer` columns should that are coerced to `words` (see
#'   [english::words()]). Default is `0.5` (50%).
#'   }
#'   \item{`prop_duplicate_row`}{A `numeric` between 0 and 1 for the
#'   proportion of rows to duplicate. Default is `0.01` (1%). If
#'   `prop_duplicate_row` > 0 then it is guaranteed that at least one row will
#'   be duplicated.}
#'   \item{`inconsistent_id`}{A `logical` boolean used to specify whether the
#'   `$id` column has inconsistent formatting by appending random prefixes and
#'   suffixes to a random sample (~10%) of IDs. Default is `FALSE`, so IDs
#'   are numbers (`numeric`, `characters` or words depending on
#'   `prop_int_as_word` and `numeric_as_char`).}
#' }
#'
#' @details
#' By default `messy_linelist()`:
#'
#' * Introduces 10% of values missing, i.e. converts to `NA`.
#' * Introduces spelling mistakes in 10% of `character` columns.
#' * Introduce inconsistency in the reporting of `$sex`.
#' * Converts `numeric` columns (`double` & `integer`) to `character`.
#' * Converts `Date` columns to `character`.
#' * Converts 50% of `integer`s to (English) words.
#' * Duplicates 1% of rows.
#'
#' Setting `missing_value` to something other than `NA` will likely cause
#' type coercion in the line list `<data.frame>` columns, most likely to
#' `character`.
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
#' If `numeric_as_char = FALSE` and `prop_int_as_word` > 0 then the integer
#' columns are converted to `character` string (either `character` numbers or
#' words) but the other `numeric` columns are not coerced. Spelling mistakes
#' are not introduced into integers converted to words when
#' `prop_spelling_mistakes` > 0 and `prop_int_as_word` > 0.
#'
#' Rows are duplicated after other _messy_ modifications so the duplicated row
#' contains identical _messy_ elements.
#'
#' @return A messy line list `<data.frame>`.
#'
#' The output `<data.frame>` has the same structure as the input `<data.frame>`
#' from [sim_linelist()], with messy entries.
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

  .args <- list(
    prop_missing = 0.1,
    missing_value = NA,
    prop_spelling_mistakes = 0.1,
    inconsistent_sex = TRUE,
    sex_as_numeric = FALSE,
    numeric_as_char = TRUE,
    date_as_char = TRUE,
    inconsistent_dates = FALSE,
    prop_int_as_word = 0.5,
    prop_duplicate_row = 0.1,
    inconsistent_id = FALSE
  )

  # capture dynamic dots
  dots <- rlang::dots_list(..., .ignore_empty = "none", .homonyms = "error")
  dots_names <- names(dots)

  # check arguments in dots match arg list
  stopifnot(
    "Incorrect argument names supplied to `messy_linelist()`" =
      dots_names %in% names(.args)
  )

  # replace default args if in dots
  .args <- utils::modifyList(.args, dots)

  # check args list after any user changes
  checkmate::assert_number(.args$prop_missing, lower = 0, upper = 1)
  checkmate::assert_atomic(.args$missing_value)
  checkmate::assert_number(.args$prop_spelling_mistakes, lower = 0, upper = 1)
  checkmate::assert_logical(
    .args$inconsistent_sex, any.missing = FALSE, len = 1
  )
  checkmate::assert_logical(.args$sex_as_numeric, any.missing = FALSE, len = 1)
  checkmate::assert_logical(.args$numeric_as_char, any.missing = FALSE, len = 1)
  checkmate::assert_logical(.args$date_as_char, any.missing = FALSE, len = 1)
  checkmate::assert_logical(
    .args$inconsistent_dates, any.missing = FALSE, len = 1
  )
  checkmate::assert_number(.args$prop_int_as_word, lower = 0, upper = 1)
  checkmate::assert_number(.args$prop_duplicate_row, lower = 0, upper = 1)
  checkmate::assert_logical(.args$inconsistent_id, any.missing = FALSE, len = 1)
  stopifnot(
    "Only one of `inconsistent_sex` or `sex_as_numeric` can be `TRUE`." =
      !(.args$inconsistent_sex && .args$sex_as_numeric),
    "`date_as_char` must be TRUE when `inconsistent_dates = TRUE`." =
      !(.args$inconsistent_dates && isFALSE(.args$date_as_char))
  )

  if (.args$inconsistent_sex) {
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
  } else if (.args$sex_as_numeric) {
    # vectorised switch
    linelist$sex <- vapply(
      linelist$sex, switch, m = 0L, f = 1L, FUN.VALUE = numeric(1)
    )
  }

  if (.args$prop_spelling_mistakes > 0) {
    # only apply spelling mistakes on character columns
    char_cols <- names(linelist)[(vapply(linelist, is.character, logical(1)))]
    linelist[char_cols] <- lapply(linelist[char_cols], function(col) {
      misspell <- stats::runif(length(col)) < .args$prop_spelling_mistakes
      ifelse(
        test = misspell,
        yes = vapply(col, .spelling_mistake, character(1)),
        no = col
      )
    })
  }

  # call before numeric_as_char to detect integer cols
  if (.args$prop_int_as_word > 0) {
    int_col <- vapply(linelist, is.integer, FUN.VALUE = logical(1))
    linelist[, int_col] <- vapply(
      linelist[, int_col], function(x) {
        idx <- sample.int(
          n = length(x),
          size = round(.args$prop_int_as_word * length(x)),
          replace = FALSE
        )
        x[idx] <- english::words(x[idx])
        x
      },
      FUN.VALUE = character(nrow(linelist))
    )
  }

  # call after prop_int_as_word and before adding missing values
  if (.args$inconsistent_id) {
    idx <- list(prefix = NULL, suffix = NULL)
    idx <- lapply(
      idx,
      sample.int,
      n = nrow(linelist),
      size = ceiling(0.1 * nrow(linelist)),
      replace = FALSE
    )
    linelist$id[idx$prefix] <- paste(
      .anonymise(linelist$id[idx$prefix], string_len = 3),
      linelist$id[idx$prefix],
      sep = "_"
    )
    linelist$id[idx$suffix] <- paste(
      linelist$id[idx$suffix],
      .anonymise(linelist$id[idx$suffix], string_len = 3),
      sep = "_"
    )
  }

  # call after prop_spelling_mistakes to not create mistakes to numeric chars
  if (.args$numeric_as_char) {
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
  if (.args$date_as_char) {
    date_col <- vapply(
      linelist, inherits, FUN.VALUE = logical(1), what = "Date"
    )
    linelist[, date_col] <- vapply(
      linelist[, date_col],
      as.character,
      FUN.VALUE = character(nrow(linelist))
    )
  }

  if (.args$inconsistent_dates) {
    date_col <- startsWith(colnames(linelist), "date_")
    date_fmt <- sample(
      # nolint start: nonportable_path_linter.
      c("%Y-%m-%d", "%Y/%m/%d", "%d-%m-%Y", "%d/%m/%Y", "%d %B %Y", "%d %b %Y"),
      # nolint end
      size = nrow(linelist),
      replace = TRUE
    )
    for (col in colnames(linelist[, date_col])) {
      # format arg is is vectorised
      linelist[, col] <- strftime(linelist[, col], format = date_fmt)
    }
  }

  linelist <- .add_missing(linelist, .args = .args)

  if (.args$prop_duplicate_row > 0) {
    n_row <- nrow(linelist)
    row_idx <- sample(
      x = n_row,
      size = ceiling(.args$prop_duplicate_row * n_row)
    )
    row_idx <- sort(c(seq_len(n_row), row_idx), decreasing = FALSE)
    linelist <- linelist[row_idx, ]
    row.names(linelist) <- NULL
  }

  linelist <- .restore_df_subclass(linelist)

  # return line list
  linelist
}
