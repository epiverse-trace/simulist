# We want to flag partial matching as part of our testing & continuous
# integration process because it makes code more brittle.
options(
  warnPartialMatchAttr = TRUE,
  warnPartialMatchDollar = TRUE,
  # https://github.com/CenterForAssessment/randomNames/pull/82
  warnPartialMatchArgs = FALSE # temp FALSE due to PartialMatchArgs in import
)
