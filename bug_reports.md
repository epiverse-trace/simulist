## Bug Report: simulist R Package

---

### Bug 1 — findInterval off-by-one produces NA risk for the maximum-age individual (add_cols.R)

**Severity: High**
**Location:** `.add_hospitalisation()` (line 92–98) and `apply_death_risk()` inside `.add_outcome()` (line 148–154)

Both functions use an identical pattern to look up an individual's risk group:

```r
hosp_risk_group_idx <- findInterval(
  x = .data$age,
  vec = hosp_risk$max_age,
  rightmost.closed = TRUE
) + 1
hosp_risk_ <- hosp_risk$risk[hosp_risk_group_idx]
```

`findInterval` returns values in the range `[0, length(vec)]`. When `x == max(vec)` (i.e. an individual whose age equals the upper bound of the oldest age group), `rightmost.closed = TRUE` causes `findInterval` to return `length(vec)`. After adding 1, the index becomes `length(vec) + 1`, which is out of bounds. Subsetting an R vector at an out-of-bounds position silently returns `NA`.

**Consequence for the default scalar-risk case:** when `hosp_risk` is supplied as a single number (e.g. the default `0.2`), the function converts it to a one-row data frame whose `max_age` equals `max(.data$age)`. Whoever is the oldest person in the simulation data always gets `NA` for their risk, and subsequently `rbinom(prob = 1 - NA)` returns `NA`. The downstream logical assignment then sets their hospitalisation column to `NA` regardless of the configured risk. This means the single oldest person in every simulation is silently never hospitalised.

**Consequence for the age-stratified case:** ages that fall exactly on the upper boundary of any non-final age group are assigned to the *next* group's risk (e.g. if groups are defined with max_ages `c(4, 79, 90)`, someone aged 4 gets the second group's risk, not the first; someone aged 79 gets the third group's risk; someone aged 90 gets `NA`). The same mis-indexing affects `hosp_death_risk` and `non_hosp_death_risk`.

---

### Bug 2 — `prop_duplicate_row` default value contradicts documentation (messy_linelist.R)

**Severity: Moderate**
**Location:** `messy_linelist()`, the internal `.args` list (line 141)

The Roxygen documentation for `prop_duplicate_row` states:

> Default is `0.01` (1%).

The actual default value in the code is:

```r
prop_duplicate_row = 0.1,
```

This is 10%, not 1%. Either the documented default or the code is wrong. As written, the function duplicates ten times more rows than users are told to expect, which can materially affect the size and composition of the output data frame.

---

### Bug 3 — Exact floating-point equality used for `case_type_probs` sum check (checkers.R)

**Severity: Low–Moderate**
**Location:** `.check_sim_input()`, line 156

```r
stopifnot(
  "The values in the case_type_prob vector must sum to 1" =
    sum(case_type_probs) == 1,
```

This uses exact equality (`== 1`). For the analogous `contact_tracing_status_probs` check (line 190–192), the code correctly uses `all.equal()`:

```r
stopifnot(
  "The values in the contact_tracing_status_probs vector must sum to 1" =
    all.equal(sum(contact_tracing_status_probs), 1)
)
```

Due to floating-point representation, some valid probability triplets (e.g. `c(0.1, 0.3, 0.6)`) may not sum to exactly `1.0` in IEEE 754 arithmetic, causing a spurious error. The `case_type_probs` check should use `isTRUE(all.equal(sum(case_type_probs), 1))` to be consistent with the other check and robust to floating-point rounding.

---

### Bug 4 — Zero infectious period silently passes validation (utils.R)

**Severity: Low–Moderate**
**Location:** `.sample_infectious_period()`, line 273

```r
if (contact_infectious_period < 0) {
  stop(
    "Negative infectious period sampled. ",
    "The infectious period must be strictly positive.",
    call. = FALSE
  )
}
```

The check only rejects negative values. The error message says the period "must be strictly positive", but a sampled value of exactly zero passes through without error. A zero-length infectious period then causes `runif(n, min = 0, max = 0)` to return 0 for all contact times, collapsing all transmission events to the same instant as the infector and producing a degenerate simulation. The condition should be `<= 0` to match the stated requirement.

---

### Bug 5 — Documentation typos in `censor_linelist()` parameter description (censor_linelist.R)

**Severity: Low**
**Location:** `@param interval` Roxygen block, lines 41–44

The bullet list of valid character values for the `interval` argument contains two errors:

1. `"daily` is missing its closing backtick (renders incorrectly in the help page).
2. `"montly"` is a misspelling of `"monthly"`.

The correct spelling `"monthly"` is what `match.arg()` actually accepts (line 115 of the same file). A user reading the help page and typing `"montly"` as shown will receive a confusing error from `match.arg`.
