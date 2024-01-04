#' Create contacts table
#'
#' @inheritParams .add_date
#' @inheritParams sim_contacts
#'
#' @return A contacts `<data.frame>`
#' @keywords internal
.sim_contacts_tbl <- function(.data,
                              outbreak_start_date,
                              contact_distribution,
                              population_age,
                              contact_tracing_status_probs,
                              config) {
  if (!"infector_name" %in% colnames(.data)) {
    .data <- .add_names(.data = .data)
  }

  contact_investigation <- subset(
    .data,
    select = c(
      "infector", "infector_name", "case_name", "age", "gender",
      "date_first_contact", "date_last_contact"
    )
  )
  colnames(contact_investigation) <- c(
    "infector", "from", "to", "cnt_age", "cnt_gender",
    "date_first_contact", "date_last_contact"
  )
  contact_investigation <- contact_investigation[-1, ]
  contact_investigation$was_case <- "Y"

  other_contacts <- subset(.data, select = c("infector", "infector_time"))
  other_contacts <- other_contacts[-1, ]
  other_contacts$from <- contact_investigation$from
  other_contacts <- subset(
    other_contacts,
    subset = !duplicated(other_contacts$infector)
  )

  # sample contact distribution for non-infected contacts
  contact_freq <- contact_distribution(nrow(other_contacts))

  # Multiply row by times specified in frequency column V
  other_contacts <-
    other_contacts[rep(row.names(other_contacts), contact_freq), ]

  # add random age and gender
  if (is.data.frame(population_age)) {
    age_groups <- apply(population_age, MARGIN = 1, function(x) x[1]:x[2])
    sample_weight <- rep(population_age$proportion, times = lengths(age_groups))
    # normalise for vector length
    sample_weight <- sample_weight /
      rep(lengths(age_groups), times = lengths(age_groups))
    other_contacts$cnt_age <- sample(
      unlist(age_groups),
      size = nrow(other_contacts),
      replace = TRUE,
      prob = sample_weight
    )
  } else {
    other_contacts$cnt_age <- sample(
      population_age[1]:population_age[2],
      size = nrow(other_contacts),
      replace = TRUE
    )
  }
  other_contacts$cnt_gender <- sample(
    c("m", "f"),
    size = nrow(other_contacts),
    replace = TRUE
  )

  # Add corresponding names acc to the gender V
  other_contacts$to <- randomNames::randomNames(
    which.names = "both",
    name.sep = " ",
    name.order = "first.last",
    gender = other_contacts$cnt_gender,
    sample.with.replacement = FALSE
  )

  # add contact dates
  other_contacts <- .add_date_contact(
    .data = other_contacts,
    contact_type = "last",
    distribution = config$last_contact_distribution,
    config$last_contact_distribution_params,
    outbreak_start_date = outbreak_start_date
  )
  other_contacts <- .add_date_contact(
    .data = other_contacts,
    contact_type = "first",
    distribution = config$first_contact_distribution,
    config$first_contact_distribution_params
  )

  other_contacts <- subset(
    other_contacts,
    select = c(
      "infector", "from", "to", "cnt_age", "cnt_gender",
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
  contact_investigation$infector <- NULL

  # return contacts
  contact_investigation
}
