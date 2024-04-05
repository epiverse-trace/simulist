# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
         id         case_name case_type sex age date_onset date_admission date_death
      1   1  Isaiah Patterson  probable   m  35 2023-01-01           <NA>       <NA>
      2   2      Michael John suspected   m  43 2023-01-01           <NA>       <NA>
      3   3    Lorenzo Gaynor confirmed   m   1 2023-01-01           <NA>       <NA>
      4   5      Cass Milburn confirmed   m  78 2023-01-01           <NA>       <NA>
      5   6         Hope Cobb  probable   f  22 2023-01-01           <NA>       <NA>
      6   8     Wyona Lenahan  probable   f  28 2023-01-01           <NA>       <NA>
      7  11    Bishr al-Jamil confirmed   m  46 2023-01-01     2023-01-13       <NA>
      8  12  Viviana Martinez  probable   f  67 2023-01-01           <NA>       <NA>
      9  13 Mudrik al-Youssef  probable   m  86 2023-01-01     2023-01-01       <NA>
      10 18      Kylie Rieger confirmed   f  60 2023-01-02           <NA>       <NA>
      11 20   Vincent Edwards  probable   m  49 2023-01-02           <NA>       <NA>
      12 22      Michiyo Hong suspected   f   7 2023-01-02     2023-01-02       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>       NA
      2          2022-12-30        2023-01-05       NA
      3          2022-12-30        2023-01-02     25.6
      4          2022-12-29        2023-01-02     25.6
      5          2023-01-01        2023-01-03       NA
      6          2023-01-03        2023-01-04       NA
      7          2023-01-04        2023-01-05     25.6
      8          2023-01-01        2023-01-04       NA
      9          2022-12-31        2023-01-03       NA
      10         2022-12-30        2023-01-03     25.6
      11         2023-01-01        2023-01-04       NA
      12         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with age-strat risks

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
         id          case_name case_type sex age date_onset date_admission date_death
      1   1      Donald Childs  probable   m  35 2023-01-01           <NA>       <NA>
      2   2      Michael Duran suspected   m  43 2023-01-01           <NA>       <NA>
      3   3          Cass Root  probable   m   1 2023-01-01     2023-01-11 2023-01-19
      4   5   Mudrik al-Hallal confirmed   m  78 2023-01-01           <NA>       <NA>
      5   6       Erika Sierra confirmed   f  22 2023-01-01           <NA>       <NA>
      6   8      Jennifer Hong confirmed   f  28 2023-01-01           <NA>       <NA>
      7  11    Raashid el-Huda suspected   m  46 2023-01-01           <NA>       <NA>
      8  12      Kayla Johnson suspected   f  67 2023-01-01           <NA>       <NA>
      9  13 Dominic Montgomery  probable   m  86 2023-01-01     2023-01-01 2023-01-10
      10 18    Giovana Segarra suspected   f  60 2023-01-02           <NA>       <NA>
      11 20    Vincent Edwards suspected   m  49 2023-01-02     2023-01-09 2023-01-21
      12 22        Kiona Dalke  probable   f   7 2023-01-02           <NA>       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>       NA
      2          2022-12-30        2023-01-05       NA
      3          2022-12-30        2023-01-02       NA
      4          2022-12-29        2023-01-02     23.1
      5          2023-01-01        2023-01-03     23.1
      6          2023-01-03        2023-01-04     23.1
      7          2023-01-04        2023-01-05       NA
      8          2023-01-01        2023-01-04       NA
      9          2022-12-31        2023-01-03       NA
      10         2022-12-30        2023-01-03       NA
      11         2023-01-01        2023-01-04       NA
      12         2023-01-01        2023-01-03       NA

# sim_linelist works as expected without Ct

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_ct = FALSE)
    Output
         id         case_name case_type sex age date_onset date_admission date_death
      1   1  Isaiah Patterson  probable   m  35 2023-01-01           <NA>       <NA>
      2   2      Michael John suspected   m  43 2023-01-01           <NA>       <NA>
      3   3    Lorenzo Gaynor confirmed   m   1 2023-01-01           <NA>       <NA>
      4   5      Cass Milburn confirmed   m  78 2023-01-01           <NA>       <NA>
      5   6         Hope Cobb  probable   f  22 2023-01-01           <NA>       <NA>
      6   8     Wyona Lenahan  probable   f  28 2023-01-01           <NA>       <NA>
      7  11    Bishr al-Jamil confirmed   m  46 2023-01-01     2023-01-13       <NA>
      8  12  Viviana Martinez  probable   f  67 2023-01-01           <NA>       <NA>
      9  13 Mudrik al-Youssef  probable   m  86 2023-01-01     2023-01-01       <NA>
      10 18      Kylie Rieger confirmed   f  60 2023-01-02           <NA>       <NA>
      11 20   Vincent Edwards  probable   m  49 2023-01-02           <NA>       <NA>
      12 22      Michiyo Hong suspected   f   7 2023-01-02     2023-01-02       <NA>
         date_first_contact date_last_contact
      1                <NA>              <NA>
      2          2022-12-30        2023-01-05
      3          2022-12-30        2023-01-02
      4          2022-12-29        2023-01-02
      5          2023-01-01        2023-01-03
      6          2023-01-03        2023-01-04
      7          2023-01-04        2023-01-05
      8          2023-01-01        2023-01-04
      9          2022-12-31        2023-01-03
      10         2022-12-30        2023-01-03
      11         2023-01-01        2023-01-04
      12         2023-01-01        2023-01-03

# sim_linelist works as expected with anonymous

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_names = FALSE)
    Output
         id case_type sex age date_onset date_admission date_death date_first_contact
      1   1  probable   m  35 2023-01-01           <NA>       <NA>               <NA>
      2   2 confirmed   m  43 2023-01-01           <NA>       <NA>         2022-12-30
      3   3 confirmed   m   1 2023-01-01           <NA>       <NA>         2022-12-30
      4   5 confirmed   m  78 2023-01-01           <NA>       <NA>         2022-12-29
      5   6 confirmed   f  22 2023-01-01           <NA>       <NA>         2023-01-01
      6   8 suspected   f  28 2023-01-01           <NA>       <NA>         2023-01-03
      7  11 confirmed   m  46 2023-01-01     2023-01-13       <NA>         2023-01-04
      8  12 suspected   f  67 2023-01-01           <NA>       <NA>         2023-01-01
      9  13 confirmed   m  86 2023-01-01     2023-01-01       <NA>         2022-12-31
      10 18 confirmed   f  60 2023-01-02           <NA>       <NA>         2022-12-30
      11 20 confirmed   m  49 2023-01-02           <NA>       <NA>         2023-01-01
      12 22 confirmed   f   7 2023-01-02     2023-01-02       <NA>         2023-01-01
         date_last_contact ct_value
      1               <NA>       NA
      2         2023-01-05       26
      3         2023-01-02       26
      4         2023-01-02       26
      5         2023-01-03       26
      6         2023-01-04       NA
      7         2023-01-05       26
      8         2023-01-04       NA
      9         2023-01-03       26
      10        2023-01-03       26
      11        2023-01-04       26
      12        2023-01-03       26

# sim_linelist works as expected with age structure

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
         id          case_name case_type sex age date_onset date_admission date_death
      1   1 Ghaamid el-Ishmael suspected   m  44 2023-01-01           <NA>       <NA>
      2   2   Faatih el-Kaiser confirmed   m  13 2023-01-01           <NA>       <NA>
      3   3   Brandon Galligan confirmed   m  22 2023-01-01     2023-01-09       <NA>
      4   5      Aiman el-Riaz suspected   m  85 2023-01-01           <NA>       <NA>
      5   6     Katelyn Catlin confirmed   f  41 2023-01-01           <NA>       <NA>
      6   8       Lynsey Duron confirmed   f  89 2023-01-01     2023-01-02       <NA>
      7  11      Travis Foster confirmed   m  69 2023-01-01           <NA>       <NA>
      8  12       Jacy Cousins confirmed   f  23 2023-01-01           <NA>       <NA>
      9  13        Khoa Murray confirmed   m   9 2023-01-01           <NA>       <NA>
      10 18     Maria Eberhart  probable   f  62 2023-01-02           <NA>       <NA>
      11 20        John Flores suspected   m  52 2023-01-02     2023-01-15       <NA>
      12 22        Erin Payson confirmed   f  76 2023-01-02           <NA>       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>       NA
      2          2022-12-30        2023-01-05     25.1
      3          2022-12-30        2023-01-02     25.1
      4          2022-12-29        2023-01-02       NA
      5          2023-01-01        2023-01-03     25.1
      6          2023-01-03        2023-01-04     25.1
      7          2023-01-04        2023-01-05     25.1
      8          2023-01-01        2023-01-04     25.1
      9          2022-12-31        2023-01-03     25.1
      10         2022-12-30        2023-01-03       NA
      11         2023-01-01        2023-01-04       NA
      12         2023-01-01        2023-01-03     25.1

# sim_linelist works as expected with age-strat risks & age struct

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, population_age = age_struct)
    Output
         id              case_name case_type sex age date_onset date_admission
      1   1           Corey Marten  probable   m  44 2023-01-01           <NA>
      2   2         Sean Natarelli confirmed   m  13 2023-01-01           <NA>
      3   3         Collin Stimack suspected   m  22 2023-01-01           <NA>
      4   5        Nicholas Orgill confirmed   m  85 2023-01-01     2023-01-01
      5   6            Hope Arshad suspected   f  41 2023-01-01           <NA>
      6   8         Shanta Holiday  probable   f  89 2023-01-01           <NA>
      7  11 Anthony Zapata Morales  probable   m  69 2023-01-01           <NA>
      8  12         Chandra Kilian suspected   f  23 2023-01-01           <NA>
      9  13       Bradford Coffman confirmed   m   9 2023-01-01           <NA>
      10 18          Kanani Nguyen confirmed   f  62 2023-01-02           <NA>
      11 20            Codie North  probable   m  52 2023-01-02           <NA>
      12 22           Annie Carter  probable   f  76 2023-01-02           <NA>
         date_death date_first_contact date_last_contact ct_value
      1        <NA>               <NA>              <NA>       NA
      2        <NA>         2022-12-30        2023-01-05     24.1
      3        <NA>         2022-12-30        2023-01-02       NA
      4        <NA>         2022-12-29        2023-01-02     24.1
      5        <NA>         2023-01-01        2023-01-03       NA
      6        <NA>         2023-01-03        2023-01-04       NA
      7        <NA>         2023-01-04        2023-01-05       NA
      8        <NA>         2023-01-01        2023-01-04       NA
      9        <NA>         2022-12-31        2023-01-03     24.1
      10       <NA>         2022-12-30        2023-01-03     24.1
      11       <NA>         2023-01-01        2023-01-04       NA
      12       <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with modified config

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution = "geom",
          last_contact_distribution_params = c(prob = 0.5)))
    Output
         id          case_name case_type sex age date_onset date_admission date_death
      1   1       Lily Camacho confirmed   f  20 2023-01-01           <NA>       <NA>
      2   2     Justin Apodaca suspected   m  24 2023-01-01           <NA> 2023-01-10
      3   3       Sad el-Irani suspected   m  51 2023-01-01     2023-01-07       <NA>
      4   5   Tristan Benjamin  probable   m  16 2023-01-01           <NA>       <NA>
      5   6     Treven Cornejo suspected   m  83 2023-01-01           <NA>       <NA>
      6   8    Kevin Contreras suspected   m  48 2023-01-01           <NA>       <NA>
      7  11    Luqmaan el-Ozer  probable   m  77 2023-01-01     2023-01-01       <NA>
      8  12      Royse Beltran confirmed   m  90 2023-01-01           <NA>       <NA>
      9  13   Halle Batchelder confirmed   f  66 2023-01-01           <NA>       <NA>
      10 18 Morgan Grant-Perry confirmed   f  31 2023-01-02     2023-01-02       <NA>
      11 20     Matthew Chavez confirmed   m  46 2023-01-02           <NA>       <NA>
      12 22      Martin Gaspar confirmed   m  75 2023-01-02           <NA>       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>     24.7
      2          2022-12-30        2023-01-01       NA
      3          2022-12-31        2023-01-02       NA
      4          2022-12-30        2023-01-02       NA
      5          2022-12-31        2023-01-01       NA
      6          2022-12-31        2023-01-01       NA
      7          2022-12-30        2023-01-02       NA
      8          2022-12-30        2023-01-01     24.7
      9          2022-12-29        2023-01-01     24.7
      10         2022-12-30        2023-01-01     24.7
      11         2022-12-30        2023-01-01     24.7
      12         2022-12-30        2023-01-02     24.7

# sim_linelist works as expected with modified config parameters

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution_params = c(lambda = 5)))
    Output
         id         case_name case_type sex age date_onset date_admission date_death
      1   1  Isaiah Patterson  probable   m  35 2023-01-01           <NA>       <NA>
      2   2      Michael John suspected   m  43 2023-01-01           <NA>       <NA>
      3   3    Lorenzo Gaynor confirmed   m   1 2023-01-01           <NA>       <NA>
      4   5      Cass Milburn confirmed   m  78 2023-01-01           <NA>       <NA>
      5   6         Hope Cobb  probable   f  22 2023-01-01           <NA>       <NA>
      6   8     Wyona Lenahan  probable   f  28 2023-01-01           <NA>       <NA>
      7  11    Bishr al-Jamil confirmed   m  46 2023-01-01     2023-01-13       <NA>
      8  12  Viviana Martinez  probable   f  67 2023-01-01           <NA>       <NA>
      9  13 Mudrik al-Youssef  probable   m  86 2023-01-01     2023-01-01       <NA>
      10 18      Kylie Rieger confirmed   f  60 2023-01-02           <NA>       <NA>
      11 20   Vincent Edwards  probable   m  49 2023-01-02           <NA>       <NA>
      12 22      Michiyo Hong suspected   f   7 2023-01-02     2023-01-02       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>       NA
      2          2023-01-01        2023-01-07       NA
      3          2022-12-31        2023-01-03     25.6
      4          2022-12-31        2023-01-04     25.6
      5          2023-01-02        2023-01-04       NA
      6          2023-01-06        2023-01-07       NA
      7          2023-01-07        2023-01-08     25.6
      8          2023-01-03        2023-01-06       NA
      9          2023-01-02        2023-01-05       NA
      10         2023-01-01        2023-01-05     25.6
      11         2023-01-04        2023-01-07       NA
      12         2023-01-03        2023-01-05       NA

