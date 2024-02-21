#' Simulate a random network branching process model with a probability of
#' infection for each contact
#'
#' @description
#' Simulate a branching process on a infinite network where the contact
#' distribution provides a function to sample the number of contacts of each
#' individual in the simulation. Each contact is then infected with the
#' probability of infection. The time between each infection is determined
#' by the contact interval function.
#'
#' @details
#' The contact distribution sampled takes the network effect
#' \eqn{q(n) \sim (n + 1)p(n + 1)} where \eqn{p(n)} is the probability
#' density function of a distribution, e.g., Poisson or Negative binomial.
#' That is to say, the probability of having choosing a contact at random by
#' following up a contact chooses individuals with a probability proportional
#' to their number of contacts. The plus one is because one of the contacts
#' was "used" to infect the person.
#'
#' @inheritParams sim_linelist
#'
#' @return A `<data.frame>` with the contact and transmission chain data.
#' @keywords internal
.sim_network_bp <- function(contact_distribution,
                            contact_interval,
                            prob_infect,
                            config) {
  if (is.null(config$network) ||
      !config$network %in% c("adjusted", "unadjusted")) {
    stop("Network incorrectly specified, check config", call. = FALSE)
  }

  # initialise data object
  ancestor <- vector(mode = "integer", 1e5)
  generation <- vector(mode = "integer", 1e5)
  infected <- vector(mode = "integer", 1e5)
  time <- vector(mode = "double", 1e5)

  # store initial individual
  ancestor[1] <- NA_integer_
  generation[1] <- 1L
  # 1 is infected, 0 is non-infected contact
  infected[1] <- 1L
  time[1] <- 0

  # initialise counters
  next_gen_size <- 1L
  chain_generation <- 1L
  chain_size <- 1L
  chain_length <- 1L
  ancestor_idx <- 1L
  prev_ancestors <- 1L

  # run loop until no more individuals are sampled
  while (next_gen_size > 0) {
    if (config$network == "adjusted") {
      # sample contact distribution (excess degree distribution)
      q <- contact_distribution(0:1e4 + 1) * (0:1e4 + 1)
      q <- q / sum(q)
    } else {
      q <- contact_distribution(0:1e4)
    }
    contacts <- sample(0:1e4, size = next_gen_size, replace = TRUE, prob = q)

    # add contacts if sampled
    if (sum(contacts) > 0L) {
      chain_size <- chain_size + sum(contacts)
      chain_length <- chain_length + any(contacts >= 1L)
      chain_generation <- chain_generation + 1L

      for (i in seq_along(contacts)) {

        if (contacts[i] > 0) {

          # vec index can be which.min of either generation or ancestor vec
          vec_idx <-
            which.min(generation):(which.min(generation) + contacts[i] - 1)

          # grow vectors if idx exceeds length
          if (max(vec_idx) > length(generation)) {
            ancestor <- c(ancestor, vector(mode = "integer", 1e5))
            generation <- c(generation, vector(mode = "integer", 1e5))
            infected <- c(infected, vector(mode = "integer", 1e5))
            time <- c(time, vector(mode = "double", 1e5))
          }

          generation[vec_idx] <- chain_generation
          ancestor[vec_idx] <- ancestor_idx[i]

          # sample infected contacts
          infect <- stats::rbinom(n = contacts[i], size = 1, prob = prob_infect)
          infected[vec_idx] <- as.numeric(infect)

          # add delay time, removing first element of ancestor time as it is NA
          time[vec_idx] <- contact_interval(length(vec_idx)) +
            time[ancestor == ancestor_idx[i]][-1]
        }
      }
      ancestor_idx <- setdiff(which(infected == 1), prev_ancestors)
      prev_ancestors <- c(prev_ancestors, ancestor_idx)
      next_gen_size <- length(ancestor_idx)
    } else {
      next_gen_size <- 0L
    }
  }

  ancestor <- ancestor[ancestor != 0]
  generation <- generation[generation != 0]

  # remove unused IDs
  id <- seq_along(generation)
  infected <- infected[seq_along(generation)]
  # if the outcome names are changed, please find and update all
  # logical expressions, e.g., x == "infected" or x == "contact"
  infected <- ifelse(test = infected, yes = "infected", no = "contact")
  time <- time[seq_along(generation)]

  # return chain as <data.frame>
  data.frame(
    id = id,
    ancestor = ancestor,
    generation = generation,
    infected = infected,
    time = time
  )
}
