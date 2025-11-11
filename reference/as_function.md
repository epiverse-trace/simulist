# Convert `<epiparameter>` or `NULL` to function

An extension to
[`as.function()`](https://rdrr.io/r/base/as.function.html), particularly
the epiparameter `as.function` S3 method, with the added feature that
[`NULL`](https://rdrr.io/r/base/NULL.html)s are converted into functions
that generate a vector of `NA`s to behave equivalently to the generator
functions output from `as.function(..., func_type = "generate")`.

If a function is already passed to `as_function` it will be returned
unchanged.

There is also input checking to error if input is not an
`<epiparameter>`, `function`
([closure](https://rdrr.io/r/base/function.html)), or for onset-to-event
distributions `NULL`.

## Usage

``` r
as_function(x)
```

## Arguments

- x:

  A named list containing either `<epiparameter>`, `function` or `NULL`.
  Named list elements are: `"contact_distribution"`,
  `"infectious_period"`, `"onset_to_hosp"`, `"onset_to_death"`,
  `"onset_to_recovery".`

## Value

A list of `function`s.
