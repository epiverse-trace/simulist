# .sim_network_bp works as expected

    Code
      .sim_network_bp(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, max_outbreak_size = 10000, config = create_config())
    Output
         id ancestor generation infected     time
      1   1       NA          1 infected 0.000000
      2   2        1          2  contact 1.882402
      3   3        1          2 infected 1.804512
      4   4        3          3 infected 1.863476
      5   5        3          3  contact 2.962868
      6   6        3          3  contact 2.794532
      7   7        4          4 infected 4.003837
      8   8        7          5  contact 4.473719
      9   9        7          5  contact 4.698090
      10 10        7          5  contact 4.072034

# .sim_network_bp works as expected with no contacts

    Code
      .sim_network_bp(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, max_outbreak_size = 10000, config = create_config())
    Output
        id ancestor generation infected time
      1  1       NA          1 infected    0

# .sim_network_bp works as expected with unadjusted network

    Code
      .sim_network_bp(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, max_outbreak_size = 10000, config = create_config(network = "unadjusted"))
    Output
         id ancestor generation infected     time
      1   1       NA          1 infected 0.000000
      2   2        1          2  contact 1.882402
      3   3        1          2 infected 1.804512
      4   4        3          3 infected 1.863476
      5   5        3          3  contact 2.962868
      6   6        3          3  contact 2.794532
      7   7        4          4 infected 4.003837
      8   8        7          5  contact 4.473719
      9   9        7          5  contact 4.698090
      10 10        7          5  contact 4.072034

