create_contacts <- function(.data,
                            outbreak_start_date,
                            contact_distribution,
                            age_range,
                            contact_tracing_status_probs = c(
                              under_followup = 0.7,
                              lost_to_followup = 0.2,
                              unknown = 0.1
                            ),
                            config) {
  contact_distribution <- epiparameter::epidist(
    disease = "COVID-19",
    epi_dist = "contact_distribution",
    prob_distribution = "pois",
    prob_distribution_params = c(l = 5)
  )

  if (!"infector_name" %in% colnames(.data)) {
    .data <- .add_names(.data = .data)
  }

  contact_investigation <- subset(
    .data,
    select = c(
      "infector", "infector_name", "case_name", "age", "gender",
      "date_first_contact", "date_last_contact")
  )
  colnames(contact_investigation) <- c(
    "infector", "part_name", "contact_name", "cnt_age", "cnt_gender",
    "date_first_contact", "date_last_contact"
  )
  contact_investigation <- contact_investigation[-1, ]
  contact_investigation$was_case <- "Y"

  other_contacts <- subset(.data, select = c("infector", "infector_time"))
  other_contacts <- other_contacts[-1, ]
  other_contacts$part_name <- contact_investigation$part_name
  other_contacts <- subset(
    other_contacts,
    subset = !duplicated(other_contacts$infector)
  )

  # sample contact distribution for non-infected contacts
  contact_freq <- epiparameter::generate(
    contact_distribution,
    nrow(other_contacts)
  )

  #Multiply row by times specified in frequency column V
  other_contacts <-
    other_contacts[rep(row.names(other_contacts), contact_freq), ]

  # add random age and gender
  other_contacts$cnt_age <- sample(
    age_range[1]:age_range[2],
    replace = TRUE,
    size = nrow(other_contacts)
  )
  other_contacts$cnt_gender <- sample(
    c("m", "f"),
    size = nrow(other_contacts),
    replace = TRUE
  )

  #Add corresponding names acc to the gender V
  other_contacts$contact_name <- randomNames::randomNames(
    which.names = "both",
    name.sep = " ",
    name.order = "first.last",
    gender = other_contacts$cnt_gender,
    sample.with.replacement = FALSE
  )

  # add contact dates
  other_contacts <- .add_date_last_contact(
    .data = other_contacts,
    outbreak_start_date = outbreak_start_date,
    distribution = config$last_contact_distribution,
    config$last_contact_distribution_params
  )
  other_contacts <- .add_date_first_contact(
    .data = other_contacts,
    distribution = config$first_contact_distribution,
    config$first_contact_distribution_params
  )

  other_contacts <- subset(
    other_contacts,
    select = c(
      "infector", "part_name", "contact_name", "cnt_age", "cnt_gender",
      "date_first_contact", "date_last_contact"
    )
  )
  other_contacts$was_case <- "N"

  # merge both datasets and keep all the values from both
  contact_investigation <- rbind(contact_investigation, other_contacts)
  contact_investigation <-
    contact_investigation[order(contact_investigation$infector), ]
  row.names(contact_investigation) <- NULL

  # add contact tracing status
  pick_N <- which(contact_investigation$was_case == "N")
  status_type <- sample(
    names(contact_tracing_status_probs),
    size = length(pick_N),
    replace = TRUE,
    prob = contact_tracing_status_probs
  )
  contact_investigation$status <- NA
  contact_investigation$status[pick_N] <- status_type
  contact_investigation$status <- ifelse(
    test = is.na(contact_investigation$status),
    yes = "case",
    no = contact_investigation$status
  )

  # remove infector col
  contact_investigation <- contact_investigation[, -1]

  # return contacts
  contact_investigation
}
