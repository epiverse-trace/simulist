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
#' Preferential attachment ...
#'
#'
#' @param mean_contacts A `numeric` for the mean number of contacts across the
#' population.
#' @param contact_interval An `<epidist>` object or anonymous function for
#' the contact interval. The contact interval is similar to the generation time
#' or serial interval, but describes the time between becoming infected by a
#' contact and contacting another susceptible individual.
#' @param prob_infect A `numeric` for the probability of a secondary contact
#' being infected by an infected primary contact.
#'
#' @return A `<data.frame>` with the contact and transmission chain data.
#' @keywords internal
.sim_network_bp <- function(mean_contacts, contact_interval, prob_infect) {
  # input checking
  stopifnot(
    "Input delay distributions need to be either functions or <epidist>" =
      inherits(contact_interval, c("function", "epidist"))

  )
  checkmate::assert_number(prob_infect, lower = 0, upper = 1)
  checkmate::assert_number(mean_contacts, lower = 1, upper = 50)

  # convert distribution to func if needed
  contact_interval <- as.function(contact_interval, func_type = "generate")

  # initialise data object
  id <- 1:1e5
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
    # sample contact distribution with preferential attachment
    q <- dpois(0:100 + 1, lambda = mean_contacts) * (0:100 + 1)
    q <- q / sum(q)
    contacts <- sample(0:100, size = next_gen_size, replace = TRUE, prob = q)

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

          generation[vec_idx] <- chain_generation
          ancestor[vec_idx] <- ancestor_idx[i]

          # sample infected contacts
          infect <- rbinom(n = contacts[i], size = 1, prob = prob_infect)
          infected[vec_idx] <- as.numeric(infect)

          # add delay time, removing first element of ancestor time as it is NA
          time[vec_idx] <- contact_interval(length(vec_idx)) +
            time[ancestor == ancestor_idx[i]][-1]
        }
      }
      ancestor_idx <- setdiff(which(infected == 1), prev_ancestors)
      prev_ancestors <- c(prev_ancestors, ancestor_idx)
      next_gen_size <- sum(infected[which(generation == max(generation))])
    } else {
      next_gen_size <- 0L
    }
  }

  ancestor <- ancestor[ancestor != 0]
  generation <- generation[generation != 0]

  # remove unused IDs
  id <- id[seq_along(generation)]
  infected <- infected[seq_along(generation)]
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
