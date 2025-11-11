# Simulate a random network branching process model with a probability of infection for each contact

Simulate a branching process on a infinite network where the contact
distribution provides a function to sample the number of contacts of
each individual in the simulation. Each contact is then infected with
the probability of infection. The time between each contact is assumed
to be evenly distributed across the infectious period of the infected
individual, and is independent of whether the contact becomes infected.

## Usage

``` r
.sim_network_bp(
  contact_distribution,
  infectious_period,
  prob_infection,
  max_outbreak_size,
  config
)
```

## Arguments

- contact_distribution:

  A `function` or an `<epiparameter>` object to generate the number of
  contacts per infection.

  The function can be defined or anonymous. The function must have a
  single argument in the form of an `integer` vector with elements
  representing the number of contacts, and return a `numeric` vector
  where each element corresponds to the probability of observing the
  number of contacts in the vector passed to the function. The index of
  the `numeric` vector returned is offset by one to the corresponding
  probability of observing the number of contacts, i.e. the first
  element of the output vector is the probability of observing zero
  contacts, the second element is the probability of observing one
  contact, etc.

  An `<epiparameter>` can be provided. This will be converted into a
  probability mass function internally.

  The default is an anonymous function with a Poisson probability mass
  function ([`dpois()`](https://rdrr.io/r/stats/Poisson.html)) with a
  mean (\\\lambda\\) of 2 contacts per infection.

- infectious_period:

  A `function` or an `<epiparameter>` object for the infectious period.
  This defines the duration from becoming infectious to no longer
  infectious. In the simulation, individuals are assumed to become
  infectious immediately after being infected (the latency period is
  assumed to be zero). The time intervals between an infected individual
  and their contacts are assumed to be uniformly distributed within the
  infectious period. Infectious periods must be strictly positive.

  The function can be defined or anonymous. The function must return a
  vector of randomly generated real numbers representing sampled
  infectious periods. The function must have a single argument, the
  number of random infectious periods to generate.

  An `<epiparameter>` can be provided. This will be converted into
  random number generator internally.

  The default is an anonymous function with a lognormal distribution
  random number generator
  ([`rlnorm()`](https://rdrr.io/r/stats/Lognormal.html)) with
  `meanlog = 2` and `sdlog = 0.5`.

- prob_infection:

  A single `numeric` for the probability of a secondary contact being
  infected by an infected primary contact.

- config:

  A list of settings to adjust the randomly sampled delays and Ct
  values. See
  [`create_config()`](https://epiverse-trace.github.io/simulist/reference/create_config.md)
  for more information.

## Value

A `<data.frame>` with the contact and transmission chain data.

## Details

The contact distribution sampled takes the network effect \\q(n) \sim
(n + 1)p(n + 1)\\ where \\p(n)\\ is the probability density function of
a distribution, e.g., Poisson or Negative binomial. That is to say, the
probability of having choosing a contact at random by following up a
contact chooses individuals with a probability proportional to their
number of contacts. The plus one is because one of the contacts was
"used" to infect the person.
