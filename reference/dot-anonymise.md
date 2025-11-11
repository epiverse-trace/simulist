# Anonymise names

A simple algorithm to replace names with an alphanumeric string with an
fixed number of characters (i.e.
[`nchar()`](https://rdrr.io/r/base/nchar.html)) specified by
`string_len`.

## Usage

``` r
.anonymise(x, string_len = 10)
```

## Arguments

- x:

  A vector of `character` strings.

- string_len:

  A single `numeric` specifying the number of alphanumeric characters to
  use for each anonymising `character` string. Default is `10`.

## Value

A vector of `character` strings of equal length to the input.
