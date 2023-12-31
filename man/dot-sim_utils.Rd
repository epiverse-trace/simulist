% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sim_utils.R
\name{.sim_utils}
\alias{.sim_utils}
\alias{.sim_bp_linelist}
\alias{.sim_clinical_linelist}
\title{Internal simulation functions used by the exported simulation functions
within \pkg{simulist}}
\usage{
.sim_bp_linelist(
  R,
  serial_interval,
  outbreak_start_date,
  min_outbreak_size,
  population_age,
  config
)

.sim_clinical_linelist(
  chain,
  onset_to_hosp,
  onset_to_death,
  hosp_risk,
  hosp_death_risk,
  non_hosp_death_risk,
  outbreak_start_date,
  add_names,
  add_ct,
  case_type_probs,
  config
)
}
\arguments{
\item{R}{A single \code{numeric} for the reproduction number.}

\item{serial_interval}{An \verb{<epidist>} object or anonymous function for
the serial interval.}

\item{outbreak_start_date}{A \code{date} for the start of the outbreak.}

\item{min_outbreak_size}{A single \code{numeric} defining the minimum chain size
for the simulated outbreak. Default is \code{10}. This can be increased when the
function should simulate a larger outbreak.}

\item{population_age}{Either a \code{numeric} vector with two elements or a
\verb{<data.frame>} with age structure in the population. Use a \code{numeric} vector
to specific the age range of the population, the first element is the lower
bound for the age range, and and the second is the upper bound for the age
range (both inclusive, i.e. [lower, upper]). The \verb{<data.frame>} with
age groups and the proportion of the population in that group. See details
and examples for more information.}

\item{config}{A list of settings to adjust the randomly sampled delays and
Ct values (if \code{add_ct = TRUE}). See \code{\link[=create_config]{create_config()}} for more information.}

\item{onset_to_hosp}{An \verb{<epidist>} object or anonymous function for
the onset to hospitalisation delay distribution.}

\item{onset_to_death}{An \verb{<epidist>} object or anonymous function for
the onset to death delay distribution.}

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

\item{add_names}{A \code{logical} boolean for whether to add names to each row
of the line list. Default is \code{TRUE}.}

\item{add_ct}{A \code{logical} boolean for whether to add Ct values to each row
of the line list. Default is \code{TRUE}.}

\item{case_type_probs}{A named \code{numeric} vector with the probability of
each case type. The names of the vector must be \code{"suspected"}, \code{"probable"},
\code{"confirmed"}. Values of each case type must sum to one.}
}
\value{
A \verb{<data.frame>}
}
\description{
These functions enable the codebase to be modular and prevent
code being repeated across several simulation functions.
}
\keyword{internal}
