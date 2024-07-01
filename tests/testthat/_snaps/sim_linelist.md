# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
         id        case_name case_type sex age date_onset date_admission   outcome
      1   1  Wajdi al-Demian  probable   m  35 2023-01-01           <NA> recovered
      2   2    Raaid el-Diab confirmed   m  43 2023-01-01     2023-01-07 recovered
      3   3   Nickolas Nault suspected   m   1 2023-01-01           <NA> recovered
      4   5      Hee Kennedy confirmed   m  78 2023-01-01     2023-01-03      died
      5   6      Hope Arshad suspected   f  22 2023-01-01     2023-01-28      died
      6   8   Shanta Holiday  probable   f  28 2023-01-01           <NA> recovered
      7  11 Raakaan al-Shams  probable   m  46 2023-01-01           <NA> recovered
      8  12   Chandra Kilian suspected   f  67 2023-01-01           <NA> recovered
      9  13  Ricardo Sanchez confirmed   m  86 2023-01-01           <NA> recovered
      10 18    Kanani Nguyen confirmed   f  60 2023-01-02           <NA> recovered
      11 20   Jared Chambers  probable   m  49 2023-01-02           <NA> recovered
      12 22     Annie Carter  probable   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05     24.1
      3          <NA>         2022-12-30        2023-01-02       NA
      4    2023-01-21         2022-12-29        2023-01-02     24.1
      5    2023-01-10         2023-01-01        2023-01-03       NA
      6          <NA>         2023-01-03        2023-01-04       NA
      7          <NA>         2023-01-04        2023-01-05       NA
      8          <NA>         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03     24.1
      10         <NA>         2022-12-30        2023-01-03     24.1
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with age-strat risks

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1         Kyle Crane suspected   m  35 2023-01-01           <NA> recovered
      2   2 Ghaamid el-Ishmael confirmed   m  43 2023-01-01     2023-01-07 recovered
      3   3   Faatih el-Kaiser confirmed   m   1 2023-01-01           <NA> recovered
      4   5   Va'Aahi Galligan suspected   m  78 2023-01-01           <NA> recovered
      5   6     Katelyn Catlin confirmed   f  22 2023-01-01           <NA> recovered
      6   8       Lynsey Duron confirmed   f  28 2023-01-01           <NA> recovered
      7  11    Wajdi al-Demian confirmed   m  46 2023-01-01           <NA> recovered
      8  12       Jacy Cousins confirmed   f  67 2023-01-01           <NA> recovered
      9  13      Travis Foster confirmed   m  86 2023-01-01           <NA> recovered
      10 18     Maria Eberhart  probable   f  60 2023-01-02           <NA> recovered
      11 20  Mubarak el-Vaziri suspected   m  49 2023-01-02           <NA> recovered
      12 22        Erin Payson confirmed   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05     25.1
      3          <NA>         2022-12-30        2023-01-02     25.1
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03     25.1
      6          <NA>         2023-01-03        2023-01-04     25.1
      7          <NA>         2023-01-04        2023-01-05     25.1
      8          <NA>         2023-01-01        2023-01-04     25.1
      9          <NA>         2022-12-31        2023-01-03     25.1
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     25.1

# sim_linelist works as expected with anonymous

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
         id  case_name case_type sex age date_onset date_admission   outcome
      1   1 qKY39Zyiuu  probable   m  35 2023-01-01           <NA> recovered
      2   2 oY8Kxng7Az confirmed   m  43 2023-01-01     2023-01-07 recovered
      3   3 DS6oXfHuaq  probable   m   1 2023-01-01           <NA> recovered
      4   5 yEtT6tejRt confirmed   m  78 2023-01-01     2023-01-03      died
      5   6 34oCba8e6y confirmed   f  22 2023-01-01     2023-01-28      died
      6   8 eZaLTmhWsV suspected   f  28 2023-01-01           <NA> recovered
      7  11 XnmE3U4HDz confirmed   m  46 2023-01-01           <NA> recovered
      8  12 SVgVAWQihv confirmed   f  67 2023-01-01           <NA> recovered
      9  13 SfYVARDjDa confirmed   m  86 2023-01-01           <NA> recovered
      10 18 3p6KxuczwJ  probable   f  60 2023-01-02           <NA> recovered
      11 20 6ZKaUKvu5A  probable   m  49 2023-01-02           <NA> recovered
      12 22 tN2GNkk2uu confirmed   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05     24.2
      3          <NA>         2022-12-30        2023-01-02       NA
      4    2023-01-21         2022-12-29        2023-01-02     24.2
      5    2023-01-10         2023-01-01        2023-01-03     24.2
      6          <NA>         2023-01-03        2023-01-04       NA
      7          <NA>         2023-01-04        2023-01-05     24.2
      8          <NA>         2023-01-01        2023-01-04     24.2
      9          <NA>         2022-12-31        2023-01-03     24.2
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     24.2

# sim_linelist works as expected with age structure

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1      Gabriel Black  probable   m  44 2023-01-01     2023-01-02 recovered
      2   2       Tyler Kelley confirmed   m  13 2023-01-01           <NA> recovered
      3   3       Cody Morales suspected   m  22 2023-01-01           <NA> recovered
      4   5          Joewid Le  probable   m  85 2023-01-01           <NA> recovered
      5   6      Carolyn Moore confirmed   f  41 2023-01-01           <NA> recovered
      6   8  Cheyenne Sayavong confirmed   f  89 2023-01-01           <NA> recovered
      7  11 Pierce Khanthavong confirmed   m  69 2023-01-01           <NA> recovered
      8  12          Kendra To suspected   f  23 2023-01-01           <NA> recovered
      9  13  Preston Barringer confirmed   m   9 2023-01-01           <NA> recovered
      10 18  Dominique Raymond confirmed   f  62 2023-01-02     2023-01-03      died
      11 20   Bassaam el-Majid  probable   m  52 2023-01-02           <NA> recovered
      12 22      Susana Varela  probable   f  76 2023-01-02     2023-01-05 recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05       24
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03       24
      6          <NA>         2023-01-03        2023-01-04       24
      7          <NA>         2023-01-04        2023-01-05       24
      8          <NA>         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03       24
      10   2023-01-21         2022-12-30        2023-01-03       24
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with age-strat risks & age struct

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, population_age = age_struct)
    Output
         id           case_name case_type sex age date_onset date_admission   outcome
      1   1        Bryce Kelley confirmed   m  44 2023-01-01           <NA> recovered
      2   2 Khristopher Carlson confirmed   m  13 2023-01-01           <NA> recovered
      3   3       Cleatus Black suspected   m  22 2023-01-01           <NA> recovered
      4   5       Tyler Spencer confirmed   m  85 2023-01-01           <NA> recovered
      5   6    Sajiyya el-Bahri confirmed   f  41 2023-01-01           <NA> recovered
      6   8   Shameema al-Fayad confirmed   f  89 2023-01-01           <NA> recovered
      7  11           Jelani Le confirmed   m  69 2023-01-01           <NA> recovered
      8  12    Ashley Depoyster confirmed   f  23 2023-01-01           <NA> recovered
      9  13     Rushdi el-Amara  probable   m   9 2023-01-01           <NA> recovered
      10 18      Sabrina Catlin suspected   f  62 2023-01-02           <NA> recovered
      11 20       Jackson Sheek confirmed   m  52 2023-01-02           <NA> recovered
      12 22       Talia Cousins  probable   f  76 2023-01-02     2023-01-05 recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>     25.5
      2          <NA>         2022-12-30        2023-01-05     25.5
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02     25.5
      5          <NA>         2023-01-01        2023-01-03     25.5
      6          <NA>         2023-01-03        2023-01-04     25.5
      7          <NA>         2023-01-04        2023-01-05     25.5
      8          <NA>         2023-01-01        2023-01-04     25.5
      9          <NA>         2022-12-31        2023-01-03       NA
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04     25.5
      12         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with modified config

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution = "geom",
          last_contact_distribution_params = c(prob = 0.5)))
    Output
         id           case_name case_type sex age date_onset date_admission   outcome
      1   1        Lily Camacho confirmed   f  20 2023-01-01           <NA> recovered
      2   2 Charles Stuart Rasi suspected   m  24 2023-01-01     2023-01-02      died
      3   3        Jonah Burden suspected   m  51 2023-01-01           <NA> recovered
      4   5          Craig Agee  probable   m  16 2023-01-01           <NA> recovered
      5   6 Christopher Lohrenz suspected   m  83 2023-01-01           <NA>      died
      6   8      Kevin Saunders suspected   m  48 2023-01-01           <NA> recovered
      7  11     Saabiq al-Samra  probable   m  77 2023-01-01     2023-01-15 recovered
      8  12      Kenneth Cahill confirmed   m  90 2023-01-01           <NA> recovered
      9  13    Halle Batchelder confirmed   f  66 2023-01-01           <NA> recovered
      10 18  Morgan Grant-Perry confirmed   f  31 2023-01-02           <NA> recovered
      11 20      Enrique Galvan confirmed   m  46 2023-01-02           <NA> recovered
      12 22     Robert Chaparro confirmed   m  75 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>     24.7
      2    2023-01-10         2022-12-30        2023-01-01       NA
      3          <NA>         2022-12-31        2023-01-02       NA
      4          <NA>         2022-12-30        2023-01-02       NA
      5    2023-01-16         2022-12-31        2023-01-01       NA
      6          <NA>         2022-12-31        2023-01-01       NA
      7          <NA>         2022-12-30        2023-01-02       NA
      8          <NA>         2022-12-30        2023-01-01     24.7
      9          <NA>         2022-12-29        2023-01-01     24.7
      10         <NA>         2022-12-30        2023-01-01     24.7
      11         <NA>         2022-12-30        2023-01-01     24.7
      12         <NA>         2022-12-30        2023-01-02     24.7

# sim_linelist works as expected with modified config parameters

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution_params = c(lambda = 5)))
    Output
         id        case_name case_type sex age date_onset date_admission   outcome
      1   1  Wajdi al-Demian  probable   m  35 2023-01-01           <NA> recovered
      2   2    Raaid el-Diab confirmed   m  43 2023-01-01     2023-01-07 recovered
      3   3   Nickolas Nault suspected   m   1 2023-01-01           <NA> recovered
      4   5      Hee Kennedy confirmed   m  78 2023-01-01     2023-01-03      died
      5   6      Hope Arshad suspected   f  22 2023-01-01     2023-01-28      died
      6   8   Shanta Holiday  probable   f  28 2023-01-01           <NA> recovered
      7  11 Raakaan al-Shams  probable   m  46 2023-01-01           <NA> recovered
      8  12   Chandra Kilian suspected   f  67 2023-01-01           <NA> recovered
      9  13  Ricardo Sanchez confirmed   m  86 2023-01-01           <NA> recovered
      10 18    Kanani Nguyen confirmed   f  60 2023-01-02           <NA> recovered
      11 20   Jared Chambers  probable   m  49 2023-01-02           <NA> recovered
      12 22     Annie Carter  probable   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2023-01-01        2023-01-07     24.1
      3          <NA>         2022-12-31        2023-01-03       NA
      4    2023-01-21         2022-12-31        2023-01-04     24.1
      5    2023-01-10         2023-01-02        2023-01-04       NA
      6          <NA>         2023-01-06        2023-01-07       NA
      7          <NA>         2023-01-07        2023-01-08       NA
      8          <NA>         2023-01-03        2023-01-06       NA
      9          <NA>         2023-01-02        2023-01-05     24.1
      10         <NA>         2023-01-01        2023-01-05     24.1
      11         <NA>         2023-01-04        2023-01-07       NA
      12         <NA>         2023-01-03        2023-01-05       NA

# sim_linelist works as expected with time-varying cfr

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(time_varying_death_risk = function(risk, time) risk *
          exp(-time)))
    Output
         id        case_name case_type sex age date_onset date_admission   outcome
      1   1  Wajdi al-Demian  probable   m  35 2023-01-01           <NA> recovered
      2   2    Raaid el-Diab confirmed   m  43 2023-01-01     2023-01-07 recovered
      3   3   Nickolas Nault suspected   m   1 2023-01-01           <NA> recovered
      4   5      Hee Kennedy confirmed   m  78 2023-01-01     2023-01-03      died
      5   6      Hope Arshad suspected   f  22 2023-01-01     2023-01-28      died
      6   8   Shanta Holiday  probable   f  28 2023-01-01           <NA> recovered
      7  11 Raakaan al-Shams  probable   m  46 2023-01-01           <NA> recovered
      8  12   Chandra Kilian suspected   f  67 2023-01-01           <NA> recovered
      9  13  Ricardo Sanchez confirmed   m  86 2023-01-01           <NA> recovered
      10 18    Kanani Nguyen confirmed   f  60 2023-01-02           <NA> recovered
      11 20   Jared Chambers  probable   m  49 2023-01-02           <NA> recovered
      12 22     Annie Carter  probable   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05     24.1
      3          <NA>         2022-12-30        2023-01-02       NA
      4    2023-01-21         2022-12-29        2023-01-02     24.1
      5    2023-01-10         2023-01-01        2023-01-03       NA
      6          <NA>         2023-01-03        2023-01-04       NA
      7          <NA>         2023-01-04        2023-01-05       NA
      8          <NA>         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03     24.1
      10         <NA>         2022-12-30        2023-01-03     24.1
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with time-varying cfr & age-strat

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_death_risk = age_dep_hosp_death_risk, config = create_config(
          time_varying_death_risk = function(risk, time) risk * exp(-time)))
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1         Kyle Crane suspected   m  35 2023-01-01           <NA> recovered
      2   2 Ghaamid el-Ishmael confirmed   m  43 2023-01-01     2023-01-07 recovered
      3   3   Faatih el-Kaiser confirmed   m   1 2023-01-01           <NA> recovered
      4   5   Va'Aahi Galligan suspected   m  78 2023-01-01     2023-01-03 recovered
      5   6     Katelyn Catlin confirmed   f  22 2023-01-01     2023-01-28 recovered
      6   8       Lynsey Duron confirmed   f  28 2023-01-01           <NA> recovered
      7  11    Wajdi al-Demian confirmed   m  46 2023-01-01           <NA> recovered
      8  12       Jacy Cousins confirmed   f  67 2023-01-01           <NA> recovered
      9  13      Travis Foster confirmed   m  86 2023-01-01           <NA> recovered
      10 18     Maria Eberhart  probable   f  60 2023-01-02           <NA> recovered
      11 20  Mubarak el-Vaziri suspected   m  49 2023-01-02           <NA> recovered
      12 22        Erin Payson confirmed   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05     25.1
      3          <NA>         2022-12-30        2023-01-02     25.1
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03     25.1
      6          <NA>         2023-01-03        2023-01-04     25.1
      7          <NA>         2023-01-04        2023-01-05     25.1
      8          <NA>         2023-01-01        2023-01-04     25.1
      9          <NA>         2022-12-31        2023-01-03     25.1
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     25.1

