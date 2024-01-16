#' Create contacts table
#'
#' @inheritParams .add_date
#' @inheritParams sim_contacts
#'
#' @return A contacts `<data.frame>`
#' @keywords internal
.sim_contacts_tbl <- function(.data,
                              contact_tracing_status_probs) {
  if (!"infector_name" %in% colnames(.data)) {
    .data <- .add_names(.data = .data)
  }

  contacts_tbl <- subset(
    .data,
    select = c(
      "infector_name", "case_name", "age", "gender",
      "date_first_contact", "date_last_contact"
    )
  )
  colnames(contacts_tbl) <- c(
    "from", "to", "age", "gender", "date_first_contact",
    "date_last_contact"
  )
  contacts_tbl$was_case <- ifelse(
    test = .data$infected == "infected",
    yes = "Y",
    no = "N"
  )

  # add contact tracing status
  pick_N <- which(contacts_tbl$was_case == "N")
  status_type <- sample(
    names(contact_tracing_status_probs),
    size = length(pick_N),
    replace = TRUE,
    prob = contact_tracing_status_probs
  )
  contacts_tbl$status <- "case"
  contacts_tbl$status[pick_N] <- status_type

  contacts_tbl <- contacts_tbl[-1, ]

  # return contacts
  contacts_tbl
}
