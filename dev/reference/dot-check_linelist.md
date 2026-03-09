# Check if R object is line list from [`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)

Check if R object is line list from
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)

## Usage

``` r
.check_linelist(linelist)
```

## Arguments

- linelist:

  Line list `<data.frame>` output from
  [`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md).

## Value

Invisibly return the `linelist` `<data.frame>`. The function is called
for its side-effects, which will error if the input is invalid.

## Details

This is a check that the object supplied to `linelist` is from the
[`sim_linelist()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_linelist.md)
or
[`sim_outbreak()`](https://epiverse-trace.github.io/simulist/dev/reference/sim_outbreak.md)
functions, it is not related to the class of the object, in other words,
it does not check the object is of class `<linelist>`.
