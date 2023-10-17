suppressMessages({
  # get onset to hospital admission from {epiparameter} database
  onset_to_hosp <- epiparameter::epidist_db(
    disease = "COVID-19",
    epi_dist = "onset to hospitalisation",
    single_epidist = TRUE
  )

  # get onset to death from {epiparameter} database
  onset_to_death <- epiparameter::epidist_db(
    disease = "COVID-19",
    epi_dist = "onset to death",
    single_epidist = TRUE
  )
})

test_that(".add_date_last_contact works as expected", {
  ll <- .create_linelist(scenario = "pre_date_last_contact")
  linelist <- .add_date_last_contact(
    .data = ll,
    outbreak_start_date = as.Date("2023-01-01"),
    distribution = "pois",
    rate = 3
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_s3_class(linelist$date_last_contact, class = "Date")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 1L))
  expect_identical(colnames(linelist), c(colnames(ll), "date_last_contact"))
})

test_that(".add_date_last_contact works as expected with different parameter", {
  ll <- .create_linelist(scenario = "pre_date_last_contact")
  linelist <- .add_date_last_contact(
    .data = ll,
    outbreak_start_date = as.Date("2023-01-01"),
    distribution = "pois",
    rate = 1
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_s3_class(linelist$date_last_contact, class = "Date")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 1L))
  expect_identical(colnames(linelist), c(colnames(ll), "date_last_contact"))
})

test_that(".add_date_last_contact fails as expected", {
  ll <- .create_linelist(scenario = "pre_date_last_contact")
  expect_error(
    .add_date_last_contact(
      .data = ll,
      outbreak_start_date = as.Date("2023-01-01"),
      distribution = "geom",
      prob = 0.5
    ),
    regexp = "(arg)*(should be)*(pois)"
  )

  expect_error(
    .add_date_last_contact(
      .data = ll,
      outbreak_start_date = as.Date("2023-01-01"),
      distribution = "pois"
    ),
    regexp = "Distribution parameters need to be supplied via ..."
  )
})

test_that(".add_date_first_contact works as expected", {
  ll <- .create_linelist(scenario = "pre_date_first_contact")
  linelist <- .add_date_first_contact(
    .data = ll,
    distribution = "pois",
    rate = 3
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_s3_class(linelist$date_first_contact, class = "Date")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 1L))
  expect_identical(colnames(linelist), c(colnames(ll), "date_first_contact"))
})

test_that(".add_date_first_contact works as expected with different param", {
  ll <- .create_linelist(scenario = "pre_date_first_contact")
  linelist <- .add_date_first_contact(
    .data = ll,
    distribution = "pois",
    rate = 1
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_s3_class(linelist$date_first_contact, class = "Date")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 1L))
  expect_identical(colnames(linelist), c(colnames(ll), "date_first_contact"))
})

test_that(".add_date_first_contact fails as expected", {
  ll <- .create_linelist(scenario = "pre_date_first_contact")
  expect_error(
    .add_date_first_contact(
      .data = ll,
      distribution = "geom",
      prob = 0.5
    ),
    regexp = "(arg)*(should be)*(pois)"
  )

  expect_error(
    .add_date_first_contact(
      .data = ll,
      distribution = "pois"
    ),
    regexp = "Distribution parameters need to be supplied via ..."
  )
})

test_that(".add_hospitalisation works as expected", {
  ll <- .create_linelist(scenario = "pre_hospitalisation")
  linelist <- .add_hospitalisation(
    .data = ll,
    onset_to_hosp = onset_to_hosp,
    hosp_rate = 0.5
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$hospitalisation, type = "double")
  expect_type(linelist$hosp_rounded, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 2L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "hospitalisation", "hosp_rounded")
  )
})

test_that(".add_hospitalisation works as expected with different parameter", {
  ll <- .create_linelist(scenario = "pre_hospitalisation")
  linelist <- .add_hospitalisation(
    .data = ll,
    onset_to_hosp = onset_to_hosp,
    hosp_rate = 0.1
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$hospitalisation, type = "double")
  expect_type(linelist$hosp_rounded, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 2L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "hospitalisation", "hosp_rounded")
  )
})

test_that(".add_hospitalisation works as expected with age-strat rates", {
  ll <- .create_linelist(scenario = "pre_hospitalisation")
  age_dep_hosp_rate <- data.frame(
    min_age = c(1, 5, 80),
    max_age = c(5, 80, 90),
    rate = c(0.1, 0.05, 0.2)
  )
  linelist <- .add_hospitalisation(
    .data = ll,
    onset_to_hosp = onset_to_hosp,
    hosp_rate = age_dep_hosp_rate
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$hospitalisation, type = "double")
  expect_type(linelist$hosp_rounded, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 2L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "hospitalisation", "hosp_rounded")
  )
})

test_that(".add_deaths works as expected", {
  ll <- .create_linelist(scenario = "pre_death")
  linelist <- .add_deaths(
    .data = ll,
    onset_to_death = onset_to_death,
    hosp_death_rate = 0.5,
    non_hosp_death_rate = 0.5
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$deaths, type = "double")
  expect_type(linelist$death_rounded, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 2L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "deaths", "death_rounded")
  )
})

test_that(".add_deaths works as expected with different parameter", {
  ll <- .create_linelist(scenario = "pre_death")
  linelist <- .add_deaths(
    .data = ll,
    onset_to_death = onset_to_death,
    hosp_death_rate = 0.9,
    non_hosp_death_rate = 0.1
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$deaths, type = "double")
  expect_type(linelist$death_rounded, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 2L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "deaths", "death_rounded")
  )
})

test_that(".add_deaths works as expected with age-strat rates", {
  ll <- .create_linelist(scenario = "pre_death")
  age_dep_hosp_death_rate <- data.frame(
    min_age = c(1, 5, 80),
    max_age = c(5, 80, 90),
    rate = c(0.1, 0.05, 0.2)
  )
  age_dep_non_hosp_death_rate <- data.frame(
    min_age = c(1, 5, 80),
    max_age = c(5, 80, 90),
    rate = c(0.05, 0.025, 0.1)
  )
  linelist <- .add_deaths(
    .data = ll,
    onset_to_death = onset_to_death,
    hosp_death_rate = age_dep_hosp_death_rate,
    non_hosp_death_rate = age_dep_non_hosp_death_rate
  )
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$deaths, type = "double")
  expect_type(linelist$death_rounded, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 2L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "deaths", "death_rounded")
  )
})

test_that(".add_names works as expected", {
  ll <- .create_linelist(scenario = "pre_names")
  linelist <- .add_names(.data = ll)
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$case_name, type = "character")
  expect_type(linelist$infector_name, type = "character")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 2L))
  expect_identical(
    colnames(linelist),
    c(colnames(ll), "case_name", "infector_name")
  )
})

test_that(".add_ct works as expected", {
  ll <- .create_linelist(scenario = "pre_ct")
  linelist <- .add_ct(.data = ll, distribution = "norm", mean = 3, sd = 0.5)
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$ct_value, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 1L))
  expect_identical(colnames(linelist), c(colnames(ll), "ct_value"))
})

test_that(".add_ct works as expected with different parameter", {
  ll <- .create_linelist(scenario = "pre_ct")
  linelist <- .add_ct(.data = ll, distribution = "norm", mean = 1, sd = 2)
  expect_s3_class(linelist, class = "data.frame")
  expect_type(linelist$ct_value, type = "double")
  expect_identical(dim(linelist), c(nrow(ll), ncol(ll) + 1L))
  expect_identical(colnames(linelist), c(colnames(ll), "ct_value"))
})

test_that(".add_ct fails as expected", {
  ll <- .create_linelist(scenario = "pre_ct")
  expect_error(
    .add_ct(.data = ll, distribution = "lnorm", meanlog = 1, sdlog = 1),
    regexp = "(arg)*(should be)*(norm)"
  )

  expect_error(
    .add_ct(.data = ll, distribution = "norm"),
    regexp = "Distribution parameters need to be supplied via ..."
  )
})
