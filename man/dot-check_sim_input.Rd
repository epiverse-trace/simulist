% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checkers.R
\name{.check_sim_input}
\alias{.check_sim_input}
\title{Check if arguments input to simulation function are valid}
\usage{
.check_sim_input(
  sim_type = c("linelist", "contacts", "outbreak"),
  R,
  serial_interval,
  outbreak_start_date,
  min_outbreak_size,
  onset_to_hosp = NULL,
  onset_to_death = NULL,
  contact_distribution = NULL,
  add_names = NULL,
  add_ct = NULL,
  case_type_probs = NULL,
  contact_tracing_status_probs = NULL,
  hosp_risk = NULL,
  hosp_death_risk = NULL,
  non_hosp_death_risk = NULL,
  population_age = NULL
)
}
\arguments{
\item{sim_type}{A \code{character} string specifying which simulation function
this function is being called within.}

\item{R}{A single \code{numeric} for the reproduction number.}

\item{serial_interval}{An \verb{<epidist>} object or anonymous function for
the serial interval.}

\item{outbreak_start_date}{A \code{date} for the start of the outbreak.}

\item{min_outbreak_size}{A single \code{numeric} defining the minimum chain size
for the simulated outbreak. Default is \code{10}. This can be increased when the
function should simulate a larger outbreak.}

\item{onset_to_hosp}{An \verb{<epidist>} object or anonymous function for
the onset to hospitalisation delay distribution.}

\item{onset_to_death}{An \verb{<epidist>} object or anonymous function for
the onset to death delay distribution.}

\item{contact_distribution}{An \verb{<epidist>} object or anonymous function for
the contact distribution. This is similar to the offspring distribution,
but describes the heterogeneity of contacts that are not infected.}

\item{add_names}{A \code{logical} boolean for whether to add names to each row
of the line list. Default is \code{TRUE}.}

\item{add_ct}{A \code{logical} boolean for whether to add Ct values to each row
of the line list. Default is \code{TRUE}.}

\item{case_type_probs}{A named \code{numeric} vector with the probability of
each case type. The names of the vector must be \code{"suspected"}, \code{"probable"},
\code{"confirmed"}. Values of each case type must sum to one.}

\item{contact_tracing_status_probs}{A named \code{numeric} vector with the
probability of each contact tracing status. The names of the vector must
be \code{"under_followup"}, \code{"lost_to_followup"}, \code{"unknown"}. Values of each
contact tracing status must sum to one.}

\item{hosp_risk}{Either a single \code{numeric} for the hospitalisation risk of
everyone in the population, or a \verb{<data.frame>} with age specific
hospitalisation risks Default is 20\% hospitalisation (\code{0.2}) for the entire
population. See details and examples for more information.}

\item{hosp_death_risk}{Either a single \code{numeric} for the death risk for
hospitalised individuals across the population, or a \verb{<data.frame>} with age
specific hospitalised death risks Default is 50\% death risk in hospitals
(\code{0.5}) for the entire population. See details and examples for more
information.}

\item{non_hosp_death_risk}{Either a single \code{numeric} for the death risk for
outside of hospitals across the population, or a \verb{<data.frame>} with age
specific death risks outside of hospitals. Default is 5\% death risk outside
of hospitals  (\code{0.05}) for the entire population. See details and examples
for more information.}

\item{population_age}{Either a \code{numeric} vector with two elements or a
\verb{<data.frame>} with age structure in the population. Use a \code{numeric} vector
to specific the age range of the population, the first element is the lower
bound for the age range, and and the second is the upper bound for the age
range (both inclusive, i.e. [lower, upper]). The \verb{<data.frame>} with
age groups and the proportion of the population in that group. See details
and examples for more information.}
}
\value{
Invisibly return the \code{sim_type} \code{character} string. The function is
called for its side-effects, which will error if the input is invalid.
}
\description{
Check if arguments input to simulation function are valid
}
\details{
Arguments that are used by all simulation functions are required
and not given a default value, for other arguments that are not inputs in
all simulation functions a default of \code{NULL} is used.

Defaults mentioned in argument documentation is the default for the exported
simulation function and not the default in this checking function. In this
function there is either no default or \code{NULL}.
}
\keyword{internal}
