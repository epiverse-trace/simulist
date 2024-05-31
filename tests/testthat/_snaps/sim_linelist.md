# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1    Rushdi al-Ishak  probable   m  35 2023-01-01           <NA> recovered
      2   2         Jeffrey Le confirmed   m  43 2023-01-01           <NA> recovered
      3   3  Dominic Barringer suspected   m   1 2023-01-01           <NA> recovered
      4   5       Tyler Kelley  probable   m  78 2023-01-01           <NA> recovered
      5   6      Carolyn Moore confirmed   f  22 2023-01-01           <NA> recovered
      6   8  Cheyenne Sayavong confirmed   f  28 2023-01-01     2023-01-04      died
      7  11   Bassaam el-Majid confirmed   m  46 2023-01-01     2023-01-14 recovered
      8  12          Kendra To suspected   f  67 2023-01-01     2023-01-10      died
      9  13    Qaaid al-Madani confirmed   m  86 2023-01-01           <NA> recovered
      10 18  Dominique Raymond confirmed   f  60 2023-01-02           <NA> recovered
      11 20 Abdul Noor el-Syed  probable   m  49 2023-01-02           <NA> recovered
      12 22      Susana Varela  probable   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05       24
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03       24
      6    2023-01-16         2023-01-03        2023-01-04       24
      7          <NA>         2023-01-04        2023-01-05       24
      8    2023-01-17         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03       24
      10         <NA>         2022-12-30        2023-01-03       24
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with age-strat risks

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1 Ghaamid el-Ishmael suspected   m  35 2023-01-01           <NA> recovered
      2   2   Faatih el-Kaiser confirmed   m  43 2023-01-01           <NA> recovered
      3   3   Brandon Galligan confirmed   m   1 2023-01-01     2023-01-04 recovered
      4   5      Aiman el-Riaz suspected   m  78 2023-01-01           <NA> recovered
      5   6     Katelyn Catlin confirmed   f  22 2023-01-01           <NA> recovered
      6   8       Lynsey Duron confirmed   f  28 2023-01-01           <NA> recovered
      7  11      Travis Foster confirmed   m  46 2023-01-01           <NA> recovered
      8  12       Jacy Cousins confirmed   f  67 2023-01-01           <NA> recovered
      9  13        Khoa Murray confirmed   m  86 2023-01-01     2023-01-02 recovered
      10 18     Maria Eberhart  probable   f  60 2023-01-02           <NA> recovered
      11 20        John Flores suspected   m  49 2023-01-02           <NA> recovered
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
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
         id  case_name case_type sex age date_onset date_admission   outcome
      1   1 1ePRI5wC1I suspected   m  35 2023-01-01           <NA> recovered
      2   2 Ji3IItv5Ov suspected   m  43 2023-01-01           <NA> recovered
      3   3 sRrRMCAJFE  probable   m   1 2023-01-01           <NA> recovered
      4   5 uuoY8Kxng7  probable   m  78 2023-01-01           <NA> recovered
      5   6 AzDS6oXfHu  probable   f  22 2023-01-01           <NA> recovered
      6   8 h4yEtT6tej confirmed   f  28 2023-01-01     2023-01-04      died
      7  11 7XeZaLTmhW confirmed   m  46 2023-01-01     2023-01-14 recovered
      8  12 sVUBVWYTLk  probable   f  67 2023-01-01     2023-01-10      died
      9  13 hw9tYeb1el suspected   m  86 2023-01-01           <NA> recovered
      10 18 UJRewLYtBB  probable   f  60 2023-01-02           <NA> recovered
      11 20 9HLY9VZdzu  probable   m  49 2023-01-02           <NA> recovered
      12 22 wJ3WvUcVV4 confirmed   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05       NA
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03       NA
      6    2023-01-16         2023-01-03        2023-01-04     23.8
      7          <NA>         2023-01-04        2023-01-05     23.8
      8    2023-01-17         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03       NA
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     23.8

# sim_linelist works as expected with age structure

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
         id            case_name case_type sex age date_onset date_admission
      1   1        Bryce Cunniff  probable   m  44 2023-01-01           <NA>
      2   2 Ignacio Garcia Mayen confirmed   m  13 2023-01-01           <NA>
      3   3     Dominic Martinez suspected   m  22 2023-01-01           <NA>
      4   5   Sheldon Kacprowicz  probable   m  85 2023-01-01     2023-01-22
      5   6 Caroline Hergenreter confirmed   f  41 2023-01-01     2023-01-01
      6   8  Cassandra Whitworth confirmed   f  89 2023-01-01     2023-01-03
      7  11        Tyler Carlson confirmed   m  69 2023-01-01           <NA>
      8  12    Harleigh Sayavong suspected   f  23 2023-01-01           <NA>
      9  13        Cleatus Black confirmed   m   9 2023-01-01           <NA>
      10 18            Kendra To confirmed   f  62 2023-01-02           <NA>
      11 20            Jelani Le  probable   m  52 2023-01-02           <NA>
      12 22        Amanda Kaiser  probable   f  76 2023-01-02           <NA>
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>       NA
      2  recovered         <NA>         2022-12-30        2023-01-05       24
      3  recovered         <NA>         2022-12-30        2023-01-02       NA
      4       died   2023-01-16         2022-12-29        2023-01-02       NA
      5  recovered         <NA>         2023-01-01        2023-01-03       24
      6       died   2023-01-16         2023-01-03        2023-01-04       24
      7  recovered         <NA>         2023-01-04        2023-01-05       24
      8  recovered         <NA>         2023-01-01        2023-01-04       NA
      9  recovered         <NA>         2022-12-31        2023-01-03       24
      10 recovered         <NA>         2022-12-30        2023-01-03       24
      11 recovered         <NA>         2023-01-01        2023-01-04       NA
      12 recovered         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with age-strat risks & age struct

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, population_age = age_struct)
    Output
         id           case_name case_type sex age date_onset date_admission   outcome
      1   1  Sheldon Kacprowicz  probable   m  44 2023-01-01           <NA> recovered
      2   2        Bryce Kelley confirmed   m  13 2023-01-01           <NA> recovered
      3   3 Khristopher Carlson suspected   m  22 2023-01-01           <NA> recovered
      4   5       Cleatus Black  probable   m  85 2023-01-01           <NA> recovered
      5   6       Carolyn Moore confirmed   f  41 2023-01-01           <NA> recovered
      6   8   Cheyenne Sayavong confirmed   f  89 2023-01-01           <NA> recovered
      7  11         David Grano confirmed   m  69 2023-01-01           <NA> recovered
      8  12           Kendra To suspected   f  23 2023-01-01           <NA> recovered
      9  13           Jelani Le confirmed   m   9 2023-01-01           <NA> recovered
      10 18   Dominique Raymond confirmed   f  62 2023-01-02           <NA> recovered
      11 20   Gabriel Barringer  probable   m  52 2023-01-02           <NA> recovered
      12 22       Susana Varela  probable   f  76 2023-01-02           <NA> recovered
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
      10         <NA>         2022-12-30        2023-01-03       24
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with modified config

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution = "geom",
          last_contact_distribution_params = c(prob = 0.5)))
    Output
         id                 case_name case_type sex age date_onset date_admission
      1   1      Ashly Magana Aguirre confirmed   f  20 2023-01-01           <NA>
      2   2 Jose Martinez Villalpando confirmed   m  24 2023-01-01           <NA>
      3   3            Michael Cooper  probable   m  51 2023-01-01           <NA>
      4   5           Cass Loughridge  probable   m  16 2023-01-01           <NA>
      5   6             Vincent White confirmed   m  83 2023-01-01     2023-01-03
      6   8              Donald Jumbo  probable   m  48 2023-01-01           <NA>
      7  11          Khaleel al-Amini  probable   m  77 2023-01-01     2023-01-15
      8  12         Zayyaan al-Masood confirmed   m  90 2023-01-01           <NA>
      9  13            Maricela Perez  probable   f  66 2023-01-01           <NA>
      10 18          Aiyana Burgdorff suspected   f  31 2023-01-02           <NA>
      11 20              Dante Burden  probable   m  46 2023-01-02           <NA>
      12 22            Jonah Orlowske confirmed   m  75 2023-01-02     2023-01-04
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>     23.9
      2  recovered         <NA>         2022-12-30        2023-01-01     23.9
      3  recovered         <NA>         2022-12-31        2023-01-02       NA
      4  recovered         <NA>         2022-12-30        2023-01-02       NA
      5  recovered         <NA>         2022-12-31        2023-01-01     23.9
      6  recovered         <NA>         2022-12-31        2023-01-01       NA
      7       died   2023-01-12         2022-12-30        2023-01-02       NA
      8  recovered         <NA>         2022-12-30        2023-01-01     23.9
      9  recovered         <NA>         2022-12-29        2023-01-01       NA
      10 recovered         <NA>         2022-12-30        2023-01-01       NA
      11 recovered         <NA>         2022-12-30        2023-01-01       NA
      12 recovered         <NA>         2022-12-30        2023-01-02     23.9

# sim_linelist works as expected with modified config parameters

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution_params = c(lambda = 5)))
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1    Rushdi al-Ishak  probable   m  35 2023-01-01           <NA> recovered
      2   2         Jeffrey Le confirmed   m  43 2023-01-01           <NA> recovered
      3   3  Dominic Barringer suspected   m   1 2023-01-01           <NA> recovered
      4   5       Tyler Kelley  probable   m  78 2023-01-01           <NA> recovered
      5   6      Carolyn Moore confirmed   f  22 2023-01-01           <NA> recovered
      6   8  Cheyenne Sayavong confirmed   f  28 2023-01-01     2023-01-04      died
      7  11   Bassaam el-Majid confirmed   m  46 2023-01-01     2023-01-14 recovered
      8  12          Kendra To suspected   f  67 2023-01-01     2023-01-10      died
      9  13    Qaaid al-Madani confirmed   m  86 2023-01-01           <NA> recovered
      10 18  Dominique Raymond confirmed   f  60 2023-01-02           <NA> recovered
      11 20 Abdul Noor el-Syed  probable   m  49 2023-01-02           <NA> recovered
      12 22      Susana Varela  probable   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2023-01-01        2023-01-07       24
      3          <NA>         2022-12-31        2023-01-03       NA
      4          <NA>         2022-12-31        2023-01-04       NA
      5          <NA>         2023-01-02        2023-01-04       24
      6    2023-01-16         2023-01-06        2023-01-07       24
      7          <NA>         2023-01-07        2023-01-08       24
      8    2023-01-17         2023-01-03        2023-01-06       NA
      9          <NA>         2023-01-02        2023-01-05       24
      10         <NA>         2023-01-01        2023-01-05       24
      11         <NA>         2023-01-04        2023-01-07       NA
      12         <NA>         2023-01-03        2023-01-05       NA

# sim_linelist works as expected with time-varying cfr

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(time_varying_death_risk = function(risk, time) risk *
          exp(-time)))
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1       Cody Morales confirmed   m  35 2023-01-01           <NA> recovered
      2   2          Joewid Le suspected   m  43 2023-01-01           <NA> recovered
      3   3    Rushdi el-Laham confirmed   m   1 2023-01-01           <NA> recovered
      4   5 Pierce Khanthavong confirmed   m  78 2023-01-01           <NA> recovered
      5   6   Kendra Domingues suspected   f  22 2023-01-01           <NA> recovered
      6   8       Amanda Hayes confirmed   f  28 2023-01-01     2023-01-04      died
      7  11      Jackson Duffy confirmed   m  46 2023-01-01     2023-01-14 recovered
      8  12     Natalie Nguyen confirmed   f  67 2023-01-01     2023-01-10 recovered
      9  13       Sam Pluskett confirmed   m  86 2023-01-01           <NA> recovered
      10 18    Dominique Suggs confirmed   f  60 2023-01-02           <NA> recovered
      11 20         Ryan Hirro  probable   m  49 2023-01-02           <NA> recovered
      12 22   Najlaa al-Rahimi suspected   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>     23.4
      2          <NA>         2022-12-30        2023-01-05       NA
      3          <NA>         2022-12-30        2023-01-02     23.4
      4          <NA>         2022-12-29        2023-01-02     23.4
      5          <NA>         2023-01-01        2023-01-03       NA
      6    2023-01-16         2023-01-03        2023-01-04     23.4
      7          <NA>         2023-01-04        2023-01-05     23.4
      8          <NA>         2023-01-01        2023-01-04     23.4
      9          <NA>         2022-12-31        2023-01-03     23.4
      10         <NA>         2022-12-30        2023-01-03     23.4
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with time-varying cfr & age-strat

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_death_risk = age_dep_hosp_death_risk, config = create_config(
          time_varying_death_risk = function(risk, time) risk * exp(-time)))
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1      Gabriel Black  probable   m  35 2023-01-01           <NA> recovered
      2   2       Tyler Kelley confirmed   m  43 2023-01-01           <NA> recovered
      3   3       Cody Morales suspected   m   1 2023-01-01           <NA> recovered
      4   5          Joewid Le  probable   m  78 2023-01-01           <NA> recovered
      5   6      Carolyn Moore confirmed   f  22 2023-01-01           <NA> recovered
      6   8  Cheyenne Sayavong confirmed   f  28 2023-01-01     2023-01-04 recovered
      7  11 Pierce Khanthavong confirmed   m  46 2023-01-01     2023-01-14 recovered
      8  12          Kendra To suspected   f  67 2023-01-01     2023-01-10 recovered
      9  13  Preston Barringer confirmed   m  86 2023-01-01           <NA> recovered
      10 18  Dominique Raymond confirmed   f  60 2023-01-02           <NA> recovered
      11 20   Bassaam el-Majid  probable   m  49 2023-01-02           <NA> recovered
      12 22      Susana Varela  probable   f   7 2023-01-02           <NA> recovered
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
      10         <NA>         2022-12-30        2023-01-03       24
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03       NA

