#' Create a mock line list without simulating to test internal functions that
#' require line list data
#'
#' @param scenario A `character` string with the state of the line list.
#' Options are:
#'
#' * "pre_date_last_contact"
#' * "pre_date_first_contact"
#' * "pre_hospitalisation"
#' * "pre_deaths"
#' * "pre_names"
#' * "pre_ct"
#'
#' @details Each of the scenarios are created by taking a snapshot (i.e copy)
#' of the  line list `<data.frame>` are each stage of the simulation
#' ([sim_linelist()]) after setting the seed to 1 (`set.seed(1)`). The
#' scenarios are before each function call, for example,
#' `"pre_date_last_contact"` is the state of the line list prior to calling
#' [.add_date_last_contact()], and `"pre_names"` is the state of the line list
#' prior to calling [.add_names()].
#'
#' # Script to reproduce data:
#' set.seed(1)
#'
#' linelist <- sim_linelist(
#'   R = 1.1,
#'   serial_interval = serial_interval,
#'   onset_to_hosp = onset_to_hosp,
#'   onset_to_death = onset_to_death,
#'   hosp_rate = 0.5,
#'   add_ct = TRUE
#' )
#'
#' @return A `<data.frame>`.
#' @keywords internal
.create_linelist <- function(scenario) {

  scenario <- match.arg(
    arg = scenario,
    choices = c(
      "pre_date_last_contact", "pre_date_first_contact", "pre_hospitalisation",
      "pre_deaths", "pre_names", "pre_ct"
    )
  )

  scenario <- switch(scenario,
    pre_date_last_contact = 1,
    pre_date_first_contact = 2,
    pre_hospitalisation = 3,
    pre_deaths = 4,
    pre_names = 5,
    pre_ct = 6
  )

  # create default line list before appending columns
  linelist <- data.frame(
    n = 1,
    id = 1:42,
    infector = c(
      NA, 1, 2, 2, 2, 3, 3, 4, 5, 5, 6, 6, 12, 12, 12, 12, 13, 16, 16, 17, 18,
      20, 20, 20, 20, 21, 22, 23, 25, 27, 29, 30, 30, 31, 33, 33, 34, 35, 35,
      36, 38, 38
    ),
    generation = c(
      1, 2, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 6, 6, 6, 6, 7, 7, 7, 8, 8, 9, 9, 9,
      9, 9, 10, 10, 10, 11, 11, 12, 12, 12, 13, 13, 13, 14, 14, 14, 15, 15
    ),
    time = c(
      0.0000000, 0.8391981, 1.0290000, 1.6508956, 1.3018759, 1.2890611,
      2.7879625, 1.9728766, 1.6923072, 1.5329626, 5.0534452, 2.1101865,
      2.8804852, 2.1304715, 2.8027058, 3.1429067, 2.8861553, 6.7830489,
      3.6155448, 2.9986955, 9.2691453, 3.8914588, 3.1226936, 3.4179808,
      3.0051420, 9.8759747, 4.0614883, 4.9026453, 4.2001799, 5.0696647,
      4.9633253, 5.3777062, 6.1314795, 6.8041310, 7.7886416, 7.2491801,
      9.0557018, 9.8481565, 8.4636954, 8.7021180, 10.3783803, 9.9114821
    ),
    onset_date = as.Date(c(
      "2023-01-01", "2023-01-01", "2023-01-02", "2023-01-02", "2023-01-02",
      "2023-01-02", "2023-01-03", "2023-01-02", "2023-01-02", "2023-01-02",
      "2023-01-06", "2023-01-03", "2023-01-03", "2023-01-03", "2023-01-03",
      "2023-01-04", "2023-01-03", "2023-01-07", "2023-01-04", "2023-01-03",
      "2023-01-10", "2023-01-04", "2023-01-04", "2023-01-04", "2023-01-04",
      "2023-01-10", "2023-01-05", "2023-01-05", "2023-01-05", "2023-01-06",
      "2023-01-05", "2023-01-06", "2023-01-07", "2023-01-07", "2023-01-08",
      "2023-01-08", "2023-01-10", "2023-01-10", "2023-01-09", "2023-01-09",
      "2023-01-11", "2023-01-10"
    )),
    infector_time = c(
      NA, 0.0000000, 0.8391981, 0.8391981, 0.8391981, 1.0290000, 1.0290000,
      1.6508956, 1.3018759, 1.3018759, 1.2890611, 1.2890611, 2.1101865,
      2.1101865, 2.1101865, 2.1101865, 2.8804852, 3.1429067, 3.1429067,
      2.8861553, 6.7830489, 2.9986955, 2.9986955, 2.9986955, 2.9986955,
      9.2691453, 3.8914588, 3.1226936, 3.0051420, 4.0614883, 4.2001799,
      5.0696647, 5.0696647, 4.9633253, 6.1314795, 6.1314795, 6.8041310,
      7.7886416, 7.7886416, 7.2491801, 9.8481565, 9.8481565
    )
  )

  if (scenario >= 2) {
    linelist <- cbind(
      linelist,
      date_last_contact = as.Date(c(
        NA, "2023-01-07", "2023-01-02", "2023-01-05", "2023-01-07",
        "2023-01-07", "2023-01-04", "2023-01-06", "2023-01-08", "2023-01-08",
        "2023-01-04", "2023-01-04", "2023-01-04", "2023-01-05", "2023-01-06",
        "2023-01-09", "2023-01-06", "2023-01-06", "2023-01-04", "2023-01-05",
        "2023-01-12", "2023-01-05", "2023-01-04", "2023-01-05", "2023-01-06",
        "2023-01-12", "2023-01-08", "2023-01-08", "2023-01-07", "2023-01-08",
        "2023-01-08", "2023-01-08", "2023-01-09", "2023-01-10", "2023-01-08",
        "2023-01-09", "2023-01-09", "2023-01-11", "2023-01-09", "2023-01-11",
        "2023-01-16", "2023-01-14"
      ))
    )
  }

  if (scenario >= 3) {
    linelist <- cbind(
      linelist,
      date_first_contact = as.Date(c(
        NA, "2023-01-04", "2022-12-30", "2023-01-02", "2023-01-06",
        "2023-01-05", "2023-01-01", "2023-01-04", "2023-01-02", "2023-01-05",
        "2023-01-02", "2023-01-02", "2022-12-31", "2023-01-01", "2023-01-05",
        "2023-01-08", "2023-01-02", "2023-01-03", "2023-01-03", "2023-01-04",
        "2023-01-11", "2023-01-03", "2023-01-03", "2023-01-03", "2023-01-05",
        "2023-01-10", "2023-01-07", "2023-01-05", "2023-01-03", "2023-01-08",
        "2023-01-05", "2023-01-03", "2023-01-07", "2023-01-10", "2023-01-07",
        "2023-01-07", "2023-01-08", "2023-01-10", "2023-01-07", "2023-01-09",
        "2023-01-15", "2023-01-07"
      )),
      gender = c(
        "f", "m", "f", "f", "m", "f", "f", "m", "m", "m", "m", "m", "m", "f",
        "f", "f", "f", "m", "m", "m", "m", "m", "m", "m", "m", "m", "f", "m",
        "f", "f", "m", "m", "f", "f", "f", "f", "m", "m", "f", "f", "f", "m"
      ),
      age = c(
        28, 78, 31, 12, 80, 44, 74, 26, 33, 4, 53, 86, 89, 24, 37, 15, 14, 81,
        82, 72, 53, 56, 71, 50, 73, 20, 75, 2, 3, 38, 15, 28, 55, 69, 78, 37,
        43, 81, 1, 90, 45, 83
      )
    )
  }
  if (scenario >= 4) {
    linelist <- cbind(
      linelist,
      hospitalisation = c(
        NA, NA, NA, 5.477855, NA, 1.427216, 13.785723, NA, 6.261054, 2.395381,
        NA, NA, NA, NA, 3.035459, 7.920272, 9.335563, NA, NA, NA, NA,
        4.385845, NA, 7.683852, 3.272805, 20.281291, 4.086057, NA, NA,
        8.518551, 6.191753, NA, 9.145817, 15.788956, 9.358647, 7.306673, NA,
        NA, 12.115475, NA, 12.193475, NA
      )
    )
  }
  if (scenario >= 5) {
    linelist <- cbind(
      linelist,
      deaths = c(
        25.600677, 14.491225, 17.922241, 10.037944, 16.474349, 22.120845,
        16.537100, 12.752037, 11.556490, 14.489347, 26.120680, 12.748786,
        15.360872, 9.579580, 19.162734, 26.543037, 28.316540, 25.619271,
        9.398208, 19.270561, 25.356713, 15.159033, 17.310601, 12.418647,
        20.751621, 21.274662, 10.661994, 16.100791, 28.189550, 16.432404,
        23.132572, 25.339047, 19.319727, 18.077050, 18.215408, 25.473173,
        17.300417, 24.516624, 20.052498, 13.562214, 17.460922, 29.606215
      ),
      death_rounded = c(
        NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 15, 10, 19, NA, NA, NA,
        NA, NA, NA, NA, NA, 12, NA, NA, NA, NA, 28, NA, NA, 25, NA, 18, 18, NA,
        NA, NA, NA, NA, NA, NA
      ),
      hospitalisation_date = as.Date(c(
        NA, NA, NA, "2023-01-06", NA, "2023-01-02", "2023-01-15", NA,
        "2023-01-07", "2023-01-03", NA, NA, NA, NA, "2023-01-04", "2023-01-09",
        "2023-01-10", NA, NA, NA, NA, "2023-01-05", NA, "2023-01-09",
        "2023-01-04", "2023-01-21", "2023-01-05", NA, NA, "2023-01-10",
        "2023-01-07", NA, "2023-01-10", "2023-01-17", "2023-01-10",
        "2023-01-08", NA, NA, "2023-01-13", NA, "2023-01-13", NA
      )),
      death_date = as.Date(c(
        NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "2023-01-16",
        "2023-01-11", "2023-01-20", NA, NA, NA, NA, NA, NA, NA, NA,
        "2023-01-13", NA, NA, NA, NA, "2023-01-29", NA, NA, "2023-01-26", NA,
        "2023-01-19", "2023-01-19", NA, NA, NA, NA, NA, NA, NA
      ))
    )
  }
  if (scenario >= 6) {
    linelist <- cbind(
      linelist,
      case_name = c(
        "Amy Kakinari", "Isaiah Miles", "Shayla Pollard", "Kimberly Munoz",
        "Suhail el-Nasrallah", "Nyla Gama", "Annie Liu", "William Georgantas",
        "Joshua Long", "Alexander Dockstader", "Keyin Gonzales", "Joseph Leung",
        "Aatif el-Reza", "Jessica Akiyama", "Ariyya el-Baig", "Linda Nguyen",
        "Olivia Burnell", "Zaid al-Alli", "Destin Hammond", "Travis Law",
        "Marcus Toval Jr", "Arturo Rivera", "Saabiq al-Jamail", "Kolten Nickle",
        "Rahul Nguyen", "Elijah Carroll", "Virginia Bofill", "Alfred Tran",
        "Erica Newson", "Vanessa Romo-Astorga", "Ross Edmiston",
        "Patrick Hadnott", "Marwa al-Nour", "Claire Games", "Samantha Korfel",
        "Maggie Kerley", "Brian Son", "Benjamin Brooner", "Ashley Carruthers",
        "Micaella Lauryn Miller", "Kelley Thrun", "Jeremy Hutchinson"
      ),
      infector_name = c(
        NA, "Amy Kakinari", "Isaiah Miles", "Isaiah Miles", "Isaiah Miles",
        "Shayla Pollard", "Shayla Pollard", "Kimberly Munoz",
        "Suhail el-Nasrallah", "Suhail el-Nasrallah", "Nyla Gama", "Nyla Gama",
        "Joseph Leung", "Joseph Leung", "Joseph Leung", "Joseph Leung",
        "Aatif el-Reza", "Linda Nguyen", "Linda Nguyen", "Olivia Burnell",
        "Zaid al-Alli", "Travis Law", "Travis Law", "Travis Law", "Travis Law",
        "Marcus Toval Jr", "Arturo Rivera", "Saabiq al-Jamail", "Rahul Nguyen",
        "Virginia Bofill", "Erica Newson", "Vanessa Romo-Astorga",
        "Vanessa Romo-Astorga", "Ross Edmiston", "Marwa al-Nour",
        "Marwa al-Nour", "Claire Games", "Samantha Korfel", "Samantha Korfel",
        "Maggie Kerley", "Benjamin Brooner", "Benjamin Brooner"
      ),
      case_type = c(
        "confirmed", "confirmed", "confirmed", "confirmed", "confirmed",
        "confirmed", "probable", "confirmed", "confirmed", "confirmed",
        "suspected", "probable", "confirmed", "confirmed", "confirmed",
        "confirmed", "confirmed", "confirmed", "confirmed", "confirmed",
        "probable", "probable", "probable", "confirmed", "confirmed",
        "confirmed", "confirmed", "probable", "probable", "suspected",
        "confirmed", "suspected", "suspected", "confirmed", "suspected",
        "suspected", "probable", "confirmed", "probable", "confirmed",
        "probable", "suspected"
      )
    )
  }

  # return line list
  linelist
}
