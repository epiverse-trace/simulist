# .sim_network_bp works as expected

    Code
      .sim_network_bp(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, max_outbreak_size = 1e+05, config = create_config())
    Output
         id ancestor generation infected       time
      1   1       NA          1 infected 0.00000000
      2   2        1          2  contact 1.88240160
      3   3        1          2 infected 1.80451250
      4   4        3          3 infected 0.05896314
      5   5        3          3  contact 1.15835525
      6   6        3          3  contact 0.99001994
      7   7        4          4 infected 2.14036129
      8   8        7          5  contact 0.46988251
      9   9        7          5  contact 0.69425308
      10 10        7          5  contact 0.06819735

# .sim_network_bp works as expected with no contacts

    Code
      .sim_network_bp(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, max_outbreak_size = 1e+05, config = create_config())
    Output
        id ancestor generation infected time
      1  1       NA          1 infected    0

# .sim_network_bp works as expected with unadjusted network

    Code
      .sim_network_bp(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, max_outbreak_size = 1e+05, config = create_config(network = "unadjusted"))
    Output
         id ancestor generation infected       time
      1   1       NA          1 infected 0.00000000
      2   2        1          2  contact 1.88240160
      3   3        1          2 infected 1.80451250
      4   4        3          3 infected 0.05896314
      5   5        3          3  contact 1.15835525
      6   6        3          3  contact 0.99001994
      7   7        4          4 infected 2.14036129
      8   8        7          5  contact 0.46988251
      9   9        7          5  contact 0.69425308
      10 10        7          5  contact 0.06819735

