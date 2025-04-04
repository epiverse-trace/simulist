% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{.sample_outcome_time}
\alias{.sample_outcome_time}
\title{Sample the onset-to-outcome time conditional that the outcome is after
a hospitalisation event}
\usage{
.sample_outcome_time(.data, onset_to_outcome, idx)
}
\arguments{
\item{.data}{A \verb{<data.frame>} containing the infectious history from a
branching process simulation (\code{\link[=.sim_network_bp]{.sim_network_bp()}}).}

\item{onset_to_outcome}{A \code{function} for either the onset-to-death or
onset-to-recovery delay distribution. \code{onset_to_outcome} can also be set to
\code{NULL} to not simulate dates for individuals that died or recovered. See
\code{\link[=sim_linelist]{sim_linelist()}} documentation for more information.}

\item{idx}{Either the \code{infected_lgl_idx} or \code{died_lgl_idx} from
\code{.add_outcomes()} to define who to sample recovery or death times for,
respectively.}
}
\value{
A \verb{<data.frame>} with a potentially modified \verb{$outcome_time} column.
}
\description{
The outcome of a case, either died or recovered, can have a time of event,
but this must be after the hospitalisation time, if a case has been admitted
to hospital. This function samples either the onset-to-death or
onset-to-recovery time conditional on it being greater than a
onset-to-hospitalisation time for a given case, if the case was admitted
to hospital. It does this by resampling onset-to-outcome (death or recovery)
times if they are less than the onset-to-hospitalisation time (from
\code{\link[=.add_hospitalisation]{.add_hospitalisation()}}).
}
\keyword{internal}
