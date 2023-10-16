# this function is still WIP
# nocov start
# nolint start
create_contacts <- function(.data, outbreak_start_date) {

  if (!"infector_name" %in% colnames(linelist)) {
    linelist <- .add_names(.data = linelist)
  }

  contact_investigation <- subset(
    linelist,
    select = c(
      "infector_name", "case_name", "age", "gender", "date_first_contact",
      "date_last_contact")
  )
  colnames(contact_investigation) <- c(
    "part_name", "contact_name", "cnt_age", "cnt_gender",
    "date_first_contact", "date_last_contact"
  )
  contact_investigation <- contact_investigation[-1, ]
  contact_investigation$was_case <- "Y"

  other_contacts <- subset(linelist, select = c("infector", "infector_time"))
  other_contacts <- other_contacts[-1, ]
  other_contacts$part_name <- contact_investigation$part_name
  other_contacts <- subset(other_contacts, subset = !duplicated(infector))

  #Add a frequency of repetition for each infector V
  other_contacts$freq <- sample(x = 1:10, size = nrow(other_contacts), replace = TRUE)


  #Multiply row by times specified in frequency column V
  other_contacts <- other_contacts[rep(row.names(other_contacts), other_contacts$freq), 1:3]

  #Add random ages V
  other_contacts$cnt_age <- sample(0:90, replace = TRUE, size = length(other_contacts$infector))

  #Add random genders V
  other_contacts$cnt_gender <- sample(c("m", "f"), size = nrow(other_contacts), replace = TRUE)

  #Add corresponding names acc to the gender V
  cases_m <- sum(other_contacts$cnt_gender == "m")
  cases_f <- sum(other_contacts$cnt_gender == "f")
  names <- list(
    names_masc = randomNames::randomNames(
      n = cases_m,
      which.names = 'both',
      name.sep = " ",
      name.order = "first.last",
      gender = 0,
      sample.with.replacement = FALSE
    ),
    names_fem = randomNames::randomNames(
      n = cases_f,
      which.names = 'both',
      name.sep = " ",
      name.order = "first.last",
      gender = 1,
      sample.with.replacement = FALSE
    )
  )

  other_contacts$contact_name[other_contacts$cnt_gender == "m"] <- names$names_m # move to start of df
  other_contacts$contact_name[other_contacts$cnt_gender == "f"] <- names$names_f


  #Adding contact dates
  other_contacts$date_last_contact <- other_contacts$infector_time + stats::rpois(nrow(other_contacts),3) + outbreak_start_date
  other_contacts$date_first_contact <- other_contacts$date_last_contact - stats::rpois(nrow(other_contacts),3)
  other_contacts <- other_contacts[,c(3,6,4,5,7,8)]
  other_contacts$was_case <- 'N'


  # merge both datasets and keep all the values from both
  for (i in seq_len(nrow(other_contacts))) {
    contact_investigation_names <- contact_investigation$part_name
    if (other_contacts[i, "part_name"] %in% contact_investigation_names) {
      last_row <- max(which(contact_investigation_names == other_contacts[i, "part_name"]))
      contact_investigation <- rbind(contact_investigation[1:last_row, ], other_contacts[i, ], contact_investigation[-(1:last_row), ])
    }
  }

  ###Adding a contact tracing status ####
  status_list <- c("under_followup", "lost_to_followup", "unknown")
  pick_N <- which(contact_investigation$was_case == "N")
  status_type <- sample(status_list, length(pick_N), replace=TRUE, prob=c(0.7,0.2,0.1))
  contact_investigation$status <- NA
  contact_investigation$status[pick_N] <- status_type
  contact_investigation$status <- ifelse(is.na(contact_investigation$status), 'case', contact_investigation$status)

  # return contacts
  contact_investigation
}
# nolint end
# nocov end
