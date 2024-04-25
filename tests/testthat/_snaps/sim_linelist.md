# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
         id              case_name case_type sex age date_onset date_admission
      1   1        Dominic Sundara  probable   m  35 2023-01-01           <NA>
      2   2     Preston Montgomery suspected   m  43 2023-01-01           <NA>
      3   3          Reece Chittum  probable   m   1 2023-01-01           <NA>
      4   5          Michael Cheek confirmed   m  78 2023-01-01           <NA>
      5   6         Jennifer Smith confirmed   f  22 2023-01-01           <NA>
      6   8         Erika Quintero confirmed   f  28 2023-01-01           <NA>
      7  11       Isaiah Patterson suspected   m  46 2023-01-01     2023-01-13
      8  12        Cicely Anderson suspected   f  67 2023-01-01           <NA>
      9  13           Michael John  probable   m  86 2023-01-01     2023-01-01
      10 18 Giovana Magana Aguirre suspected   f  60 2023-01-02           <NA>
      11 20       Mudrik al-Hallal suspected   m  49 2023-01-02           <NA>
      12 22          Tea Slaughter  probable   f   7 2023-01-02     2023-01-02
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>       NA
      2  recovered         <NA>         2022-12-30        2023-01-05       NA
      3  recovered         <NA>         2022-12-30        2023-01-02       NA
      4  recovered         <NA>         2022-12-29        2023-01-02     23.1
      5  recovered         <NA>         2023-01-01        2023-01-03     23.1
      6  recovered         <NA>         2023-01-03        2023-01-04     23.1
      7  recovered         <NA>         2023-01-04        2023-01-05       NA
      8  recovered         <NA>         2023-01-01        2023-01-04       NA
      9       died   2023-01-12         2022-12-31        2023-01-03       NA
      10 recovered         <NA>         2022-12-30        2023-01-03       NA
      11 recovered         <NA>         2023-01-01        2023-01-04       NA
      12 recovered         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with age-strat risks

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
         id        case_name case_type sex age date_onset date_admission   outcome
      1   1       Cass Duran  probable   m  35 2023-01-01           <NA> recovered
      2   2 Mudrik al-Hallal suspected   m  43 2023-01-01           <NA> recovered
      3   3  Jareer al-Safar  probable   m   1 2023-01-01     2023-01-11 recovered
      4   5  Raashid el-Huda confirmed   m  78 2023-01-01           <NA> recovered
      5   6     Erika Sierra confirmed   f  22 2023-01-01           <NA> recovered
      6   8    Jennifer Hong confirmed   f  28 2023-01-01           <NA> recovered
      7  11    Donald Childs suspected   m  46 2023-01-01           <NA> recovered
      8  12    Kayla Johnson suspected   f  67 2023-01-01           <NA>      died
      9  13   Avery Johnston  probable   m  86 2023-01-01     2023-01-01 recovered
      10 18  Giovana Segarra suspected   f  60 2023-01-02           <NA> recovered
      11 20      Donald Root suspected   m  49 2023-01-02     2023-01-09 recovered
      12 22      Kiona Dalke  probable   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05       NA
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02     23.1
      5          <NA>         2023-01-01        2023-01-03     23.1
      6          <NA>         2023-01-03        2023-01-04     23.1
      7          <NA>         2023-01-04        2023-01-05       NA
      8    2023-01-14         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03       NA
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected without Ct

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_ct = FALSE)
    Output
         id              case_name case_type sex age date_onset date_admission
      1   1        Dominic Sundara  probable   m  35 2023-01-01           <NA>
      2   2     Preston Montgomery suspected   m  43 2023-01-01           <NA>
      3   3          Reece Chittum  probable   m   1 2023-01-01           <NA>
      4   5          Michael Cheek confirmed   m  78 2023-01-01           <NA>
      5   6         Jennifer Smith confirmed   f  22 2023-01-01           <NA>
      6   8         Erika Quintero confirmed   f  28 2023-01-01           <NA>
      7  11       Isaiah Patterson suspected   m  46 2023-01-01     2023-01-13
      8  12        Cicely Anderson suspected   f  67 2023-01-01           <NA>
      9  13           Michael John  probable   m  86 2023-01-01     2023-01-01
      10 18 Giovana Magana Aguirre suspected   f  60 2023-01-02           <NA>
      11 20       Mudrik al-Hallal suspected   m  49 2023-01-02           <NA>
      12 22          Tea Slaughter  probable   f   7 2023-01-02     2023-01-02
           outcome date_outcome date_first_contact date_last_contact
      1  recovered         <NA>               <NA>              <NA>
      2  recovered         <NA>         2022-12-30        2023-01-05
      3  recovered         <NA>         2022-12-30        2023-01-02
      4  recovered         <NA>         2022-12-29        2023-01-02
      5  recovered         <NA>         2023-01-01        2023-01-03
      6  recovered         <NA>         2023-01-03        2023-01-04
      7  recovered         <NA>         2023-01-04        2023-01-05
      8  recovered         <NA>         2023-01-01        2023-01-04
      9       died   2023-01-12         2022-12-31        2023-01-03
      10 recovered         <NA>         2022-12-30        2023-01-03
      11 recovered         <NA>         2023-01-01        2023-01-04
      12 recovered         <NA>         2023-01-01        2023-01-03

# sim_linelist works as expected with anonymous

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_names = FALSE)
    Output
         id case_type sex age date_onset date_admission   outcome date_outcome
      1   1 confirmed   m  35 2023-01-01           <NA> recovered         <NA>
      2   2 suspected   m  43 2023-01-01           <NA> recovered         <NA>
      3   3  probable   m   1 2023-01-01           <NA> recovered         <NA>
      4   5 confirmed   m  78 2023-01-01           <NA> recovered         <NA>
      5   6 confirmed   f  22 2023-01-01           <NA> recovered         <NA>
      6   8 confirmed   f  28 2023-01-01           <NA> recovered         <NA>
      7  11 confirmed   m  46 2023-01-01     2023-01-13 recovered         <NA>
      8  12 suspected   f  67 2023-01-01           <NA> recovered         <NA>
      9  13 confirmed   m  86 2023-01-01     2023-01-01      died   2023-01-12
      10 18 suspected   f  60 2023-01-02           <NA> recovered         <NA>
      11 20 confirmed   m  49 2023-01-02           <NA> recovered         <NA>
      12 22 confirmed   f   7 2023-01-02     2023-01-02 recovered         <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>     23.9
      2          2022-12-30        2023-01-05       NA
      3          2022-12-30        2023-01-02       NA
      4          2022-12-29        2023-01-02     23.9
      5          2023-01-01        2023-01-03     23.9
      6          2023-01-03        2023-01-04     23.9
      7          2023-01-04        2023-01-05     23.9
      8          2023-01-01        2023-01-04       NA
      9          2022-12-31        2023-01-03     23.9
      10         2022-12-30        2023-01-03       NA
      11         2023-01-01        2023-01-04     23.9
      12         2023-01-01        2023-01-03     23.9

# sim_linelist works as expected with age structure

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1         Kyle Crane suspected   m  44 2023-01-01           <NA> recovered
      2   2 Ghaamid el-Ishmael confirmed   m  13 2023-01-01           <NA> recovered
      3   3   Faatih el-Kaiser confirmed   m  22 2023-01-01     2023-01-09 recovered
      4   5   Va'Aahi Galligan suspected   m  85 2023-01-01           <NA> recovered
      5   6     Katelyn Catlin confirmed   f  41 2023-01-01           <NA> recovered
      6   8       Lynsey Duron confirmed   f  89 2023-01-01     2023-01-02      died
      7  11    Wajdi al-Demian confirmed   m  69 2023-01-01           <NA> recovered
      8  12       Jacy Cousins confirmed   f  23 2023-01-01           <NA> recovered
      9  13      Travis Foster confirmed   m   9 2023-01-01           <NA> recovered
      10 18     Maria Eberhart  probable   f  62 2023-01-02           <NA> recovered
      11 20  Mubarak el-Vaziri suspected   m  52 2023-01-02     2023-01-15 recovered
      12 22        Erin Payson confirmed   f  76 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05     25.1
      3          <NA>         2022-12-30        2023-01-02     25.1
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03     25.1
      6    2023-01-26         2023-01-03        2023-01-04     25.1
      7          <NA>         2023-01-04        2023-01-05     25.1
      8          <NA>         2023-01-01        2023-01-04     25.1
      9          <NA>         2022-12-31        2023-01-03     25.1
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     25.1

# sim_linelist works as expected with age-strat risks & age struct

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, population_age = age_struct)
    Output
         id        case_name case_type sex age date_onset date_admission   outcome
      1   1 Maazin el-Othman  probable   m  44 2023-01-01           <NA> recovered
      2   2 Faisal el-Vaziri confirmed   m  13 2023-01-01           <NA> recovered
      3   3     Jorge Marten suspected   m  22 2023-01-01           <NA> recovered
      4   5  Kaleb Natarelli confirmed   m  85 2023-01-01     2023-01-01 recovered
      5   6      Hope Arshad suspected   f  41 2023-01-01           <NA> recovered
      6   8   Shanta Holiday  probable   f  89 2023-01-01           <NA> recovered
      7  11  Nicholas Orgill  probable   m  69 2023-01-01           <NA> recovered
      8  12   Chandra Kilian suspected   f  23 2023-01-01           <NA> recovered
      9  13     Corey Alcala confirmed   m   9 2023-01-01           <NA> recovered
      10 18    Kanani Nguyen confirmed   f  62 2023-01-02           <NA> recovered
      11 20    Sean Shrestha  probable   m  52 2023-01-02           <NA> recovered
      12 22     Annie Carter  probable   f  76 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05     24.1
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02     24.1
      5          <NA>         2023-01-01        2023-01-03       NA
      6          <NA>         2023-01-03        2023-01-04       NA
      7          <NA>         2023-01-04        2023-01-05       NA
      8          <NA>         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03     24.1
      10         <NA>         2022-12-30        2023-01-03     24.1
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with modified config

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution = "geom",
          last_contact_distribution_params = c(prob = 0.5)))
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1       Lily Camacho confirmed   f  20 2023-01-01           <NA> recovered
      2   2       Sad el-Irani suspected   m  24 2023-01-01           <NA> recovered
      3   3   Tristan Benjamin suspected   m  51 2023-01-01     2023-01-07 recovered
      4   5     Treven Cornejo  probable   m  16 2023-01-01           <NA> recovered
      5   6    Kevin Contreras suspected   m  83 2023-01-01           <NA> recovered
      6   8       Tyler Garcia suspected   m  48 2023-01-01           <NA> recovered
      7  11      Royse Beltran  probable   m  77 2023-01-01     2023-01-01 recovered
      8  12     Clayton Falcon confirmed   m  90 2023-01-01           <NA> recovered
      9  13   Halle Batchelder confirmed   f  66 2023-01-01           <NA> recovered
      10 18 Morgan Grant-Perry confirmed   f  31 2023-01-02     2023-01-02 recovered
      11 20      Bowen Apodaca confirmed   m  46 2023-01-02           <NA> recovered
      12 22  Haaroon el-Firman confirmed   m  75 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>     24.7
      2          <NA>         2022-12-30        2023-01-01       NA
      3          <NA>         2022-12-31        2023-01-02       NA
      4          <NA>         2022-12-30        2023-01-02       NA
      5          <NA>         2022-12-31        2023-01-01       NA
      6          <NA>         2022-12-31        2023-01-01       NA
      7          <NA>         2022-12-30        2023-01-02       NA
      8          <NA>         2022-12-30        2023-01-01     24.7
      9          <NA>         2022-12-29        2023-01-01     24.7
      10         <NA>         2022-12-30        2023-01-01     24.7
      11         <NA>         2022-12-30        2023-01-01     24.7
      12         <NA>         2022-12-30        2023-01-02     24.7

# sim_linelist works as expected with modified config parameters

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution_params = c(lambda = 5)))
    Output
         id              case_name case_type sex age date_onset date_admission
      1   1        Dominic Sundara  probable   m  35 2023-01-01           <NA>
      2   2     Preston Montgomery suspected   m  43 2023-01-01           <NA>
      3   3          Reece Chittum  probable   m   1 2023-01-01           <NA>
      4   5          Michael Cheek confirmed   m  78 2023-01-01           <NA>
      5   6         Jennifer Smith confirmed   f  22 2023-01-01           <NA>
      6   8         Erika Quintero confirmed   f  28 2023-01-01           <NA>
      7  11       Isaiah Patterson suspected   m  46 2023-01-01     2023-01-13
      8  12        Cicely Anderson suspected   f  67 2023-01-01           <NA>
      9  13           Michael John  probable   m  86 2023-01-01     2023-01-01
      10 18 Giovana Magana Aguirre suspected   f  60 2023-01-02           <NA>
      11 20       Mudrik al-Hallal suspected   m  49 2023-01-02           <NA>
      12 22          Tea Slaughter  probable   f   7 2023-01-02     2023-01-02
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>       NA
      2  recovered         <NA>         2023-01-01        2023-01-07       NA
      3  recovered         <NA>         2022-12-31        2023-01-03       NA
      4  recovered         <NA>         2022-12-31        2023-01-04     23.1
      5  recovered         <NA>         2023-01-02        2023-01-04     23.1
      6  recovered         <NA>         2023-01-06        2023-01-07     23.1
      7  recovered         <NA>         2023-01-07        2023-01-08       NA
      8  recovered         <NA>         2023-01-03        2023-01-06       NA
      9       died   2023-01-12         2023-01-02        2023-01-05       NA
      10 recovered         <NA>         2023-01-01        2023-01-05       NA
      11 recovered         <NA>         2023-01-04        2023-01-07       NA
      12 recovered         <NA>         2023-01-03        2023-01-05       NA

# sim_linelist works as expected with time-varying cfr

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(time_varying_death_risk = function(risk, time) risk *
          exp(-time)))
    Output
         id         case_name case_type sex age date_onset date_admission   outcome
      1   1   Anthony Raigoza suspected   m  35 2023-01-01           <NA> recovered
      2   2      Joseph Begay  probable   m  43 2023-01-01           <NA> recovered
      3   3          Andi Lee  probable   m   1 2023-01-01           <NA> recovered
      4   5      Robert Duran suspected   m  78 2023-01-01           <NA> recovered
      5   6    Mikhaila Guyon confirmed   f  22 2023-01-01           <NA> recovered
      6   8        Kanani Ahn confirmed   f  28 2023-01-01           <NA> recovered
      7  11   Michael Chittum  probable   m  46 2023-01-01     2023-01-13 recovered
      8  12         Hope Cobb  probable   f  67 2023-01-01           <NA> recovered
      9  13        Eric Lopez confirmed   m  86 2023-01-01     2023-01-01 recovered
      10 18      Kelly Carter  probable   f  60 2023-01-02           <NA> recovered
      11 20   Turki el-Vaziri  probable   m  49 2023-01-02           <NA> recovered
      12 22 Cicely Shangreaux confirmed   f   7 2023-01-02     2023-01-02 recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05       NA
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03     25.4
      6          <NA>         2023-01-03        2023-01-04     25.4
      7          <NA>         2023-01-04        2023-01-05       NA
      8          <NA>         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03     25.4
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     25.4

# sim_linelist works as expected with time-varying cfr & age-strat

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_death_risk = age_dep_hosp_death_risk, config = create_config(
          time_varying_death_risk = function(risk, time) risk * exp(-time)))
    Output
         id         case_name case_type sex age date_onset date_admission   outcome
      1   1   Anthony Raigoza suspected   m  35 2023-01-01           <NA> recovered
      2   2      Joseph Begay  probable   m  43 2023-01-01           <NA> recovered
      3   3          Andi Lee  probable   m   1 2023-01-01           <NA> recovered
      4   5      Robert Duran suspected   m  78 2023-01-01           <NA> recovered
      5   6    Mikhaila Guyon confirmed   f  22 2023-01-01           <NA> recovered
      6   8        Kanani Ahn confirmed   f  28 2023-01-01           <NA> recovered
      7  11   Michael Chittum  probable   m  46 2023-01-01     2023-01-13 recovered
      8  12         Hope Cobb  probable   f  67 2023-01-01           <NA> recovered
      9  13        Eric Lopez confirmed   m  86 2023-01-01     2023-01-01 recovered
      10 18      Kelly Carter  probable   f  60 2023-01-02           <NA> recovered
      11 20   Turki el-Vaziri  probable   m  49 2023-01-02           <NA> recovered
      12 22 Cicely Shangreaux confirmed   f   7 2023-01-02     2023-01-02 recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05       NA
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03     25.4
      6          <NA>         2023-01-03        2023-01-04     25.4
      7          <NA>         2023-01-04        2023-01-05       NA
      8          <NA>         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03     25.4
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     25.4

