# Check if `<data.frame>` defining either age-stratified hospitalisation or death risk, or defining age structure of population is correct

Check if `<data.frame>` defining either age-stratified hospitalisation
or death risk, or defining age structure of population is correct

## Usage

``` r
.check_df(x, df_type = c("risk", "age"), age_range = NULL)
```

## Arguments

- x:

  A `<data.frame>`.

- df_type:

  A `character` string, either `"risk"` or `"age"` to specify which
  input `<data.frame>` is being checked.

- age_range:

  A `numeric` vector of length 2. Only required when `df_type = risk`,
  `NULL` by default.

## Value

A `<data.frame>`, also called for error side-effects when input is
invalid.
