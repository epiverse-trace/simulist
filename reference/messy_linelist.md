# Create messy line list data

Take line list output from
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md)
and replace elements of the `<data.frame>` with missing values (e.g.
`NA`), introduce spelling mistakes and inconsistencies, as well as
coerce date types.

## Usage

``` r
messy_linelist(linelist, ...)
```

## Arguments

- linelist:

  Line list `<data.frame>` output from
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md).

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  Named elements to replace default settings. Only if names match
  exactly are elements replaced, otherwise the function errors.

  Accepted arguments and their defaults are:

  `prop_missing`

  :   A `numeric` between 0 and 1 for the proportion of missing values
      introduced. Default is `0.1` (10%).

  `missing_value`

  :   A vector with the missing value(s). If multiple values are
      supplied a missing value is randomly sampled for each cell in the
      line list. Default is `NA`.

  `prop_spelling_mistakes`

  :   A `numeric` between 0 and 1 used to specify the proportion of
      spelling mistakes in `character` columns. Default is `0.1` (10%).

  `inconsistent_sex`

  :   A `logical` boolean to specify whether the `$sex` column uses
      `"m"` and `"f"`, or inconsistently uses `"m"`, `"f"`, `"M"`,
      `"F"`, `"male"`, `"female"`, `"Male"` or `"Female"`. Default is
      `TRUE` so sexes are sampled from the options.

  `sex_as_numeric`

  :   A `logical` boolean used to specify whether the values in the
      `$sex` column should be encoded as `numeric` values (`0` and `1`).
      Default is `FALSE`. `sex_as_numeric` cannot be `TRUE` if
      `inconsistent_sex = TRUE`.

  `numeric_as_char`

  :   A `logical` boolean used to specify whether `numeric` columns
      should be coerced to `character`. Default is `TRUE`.

  `date_as_char`

  :   A `logical` boolean used to specify whether `Date` columns should
      be coerced to `character`. Default is `TRUE`.

  `inconsistent_dates`

  :   A `logical` boolean used to specify whether the values in `Date`
      columns are inconsistently formatted (e.g. `"%Y-%m-%d"`,
      `"%Y/%m/%d"`, `"%d-%m-%Y"`, or `"%d %B %Y"`). Default is `FALSE`.

  `prop_int_as_word`

  :   A `numeric` between 0 and 1 for the proportion of elements in
      `integer` columns should that are coerced to `words` (see
      [`english::words()`](https://rdrr.io/pkg/english/man/words.html)).
      Default is `0.5` (50%).

  `prop_duplicate_row`

  :   A `numeric` between 0 and 1 for the proportion of rows to
      duplicate. Default is `0.01` (1%). If `prop_duplicate_row` \> 0
      then it is guaranteed that at least one row will be duplicated.

  `inconsistent_id`

  :   A `logical` boolean used to specify whether the `$id` column has
      inconsistent formatting by appending random prefixes and suffixes
      to a random sample (~10%) of IDs. Default is `FALSE`, so IDs are
      numbers (`numeric`, `characters` or words depending on
      `prop_int_as_word` and `numeric_as_char`).

## Value

A messy line list `<data.frame>`.

The output `<data.frame>` has the same structure as the input
`<data.frame>` from
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/reference/sim_linelist.md),
with messy entries.

## Details

By default `messy_linelist()`:

- Introduces 10% of values missing, i.e. converts to `NA`.

- Introduces spelling mistakes in 10% of `character` columns.

- Introduce inconsistency in the reporting of `$sex`.

- Converts `numeric` columns (`double` & `integer`) to `character`.

- Converts `Date` columns to `character`.

- Converts 50% of `integer`s to (English) words.

- Duplicates 1% of rows.

Setting `missing_value` to something other than `NA` will likely cause
type coercion in the line list `<data.frame>` columns, most likely to
`character`.

When setting `sex_as_numeric` to `TRUE`, male is set to `0` and female
to `1`. Only one of `inconsistent_sex` or `sex_as_numeric` can be
`TRUE`, otherwise the function will error.

If `numeric_as_char = TRUE` and `sex_as_numeric = TRUE` then the sex
encoded as 0 or 1 is converted to `character`. If
`prop_spelling_mistake` \> 0 and `numeric_as_char = TRUE` the columns
that are converted from `numeric` to `character` do not have spelling
mistakes introduced, because they are numeric characters stored as
character strings. If `prop_spelling_mistake` \> 0 and
`date_as_char = TRUE` spelling mistakes are not introduced into dates.

The `Date` columns can be converted into an inconsistent format by
setting `inconsistent_dates = TRUE` and it requires
`date_as_char = TRUE`, if the latter is `FALSE` the function will error.

If `numeric_as_char = FALSE` and `prop_int_as_word` \> 0 then the
integer columns are converted to `character` string (either `character`
numbers or words) but the other `numeric` columns are not coerced.
Spelling mistakes are not introduced into integers converted to words
when `prop_spelling_mistakes` \> 0 and `prop_int_as_word` \> 0.

Rows are duplicated after other *messy* modifications so the duplicated
row contains identical *messy* elements.

## Examples

``` r
linelist <- sim_linelist()
messy_linelist <- messy_linelist(linelist)

# increasing proportion of missingness to 30% with a missing value of -99
messy_linelist <- messy_linelist(
  linelist,
  prop_missing = 0.3,
  missing_value = -99
)

# increasing proportion of spelling mistakes to 50%
messy_linelist <- messy_linelist(linelist, prop_spelling_mistakes = 0.5)

# encode `$sex` as `numeric`
messy_linelist <- messy_linelist(
  linelist,
  sex_as_numeric = TRUE,
  inconsistent_sex = FALSE
)

# inconsistently formatted dates
messy_linelist <- messy_linelist(linelist, inconsistent_dates = TRUE)
```
