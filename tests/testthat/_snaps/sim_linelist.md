# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1      Gabriel Black  probable   m  35 2023-01-01           <NA> recovered
      2   2       Tyler Kelley confirmed   m  43 2023-01-01           <NA> recovered
      3   3       Cody Morales suspected   m   1 2023-01-01           <NA> recovered
      4   5          Joewid Le  probable   m  78 2023-01-01           <NA> recovered
      5   6      Carolyn Moore confirmed   f  22 2023-01-01           <NA> recovered
      6   8  Cheyenne Sayavong confirmed   f  28 2023-01-01           <NA> recovered
      7  11 Pierce Khanthavong confirmed   m  46 2023-01-01     2023-01-13 recovered
      8  12          Kendra To suspected   f  67 2023-01-01           <NA> recovered
      9  13  Preston Barringer confirmed   m  86 2023-01-01     2023-01-01      died
      10 18  Dominique Raymond confirmed   f  60 2023-01-02           <NA> recovered
      11 20   Bassaam el-Majid  probable   m  49 2023-01-02           <NA> recovered
      12 22      Susana Varela  probable   f   7 2023-01-02     2023-01-02 recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05       24
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03       24
      6          <NA>         2023-01-03        2023-01-04       24
      7          <NA>         2023-01-04        2023-01-05       24
      8          <NA>         2023-01-01        2023-01-04       NA
      9    2023-01-09         2022-12-31        2023-01-03       24
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
         id         case_name case_type sex age date_onset date_admission   outcome
      1   1 Micheal Smallwood  probable   m  35 2023-01-01           <NA> recovered
      2   2       Kyle Foster confirmed   m  43 2023-01-01           <NA> recovered
      3   3 Ghaamid el-Kaiser suspected   m   1 2023-01-01     2023-01-11      died
      4   5    Faatih el-Riaz confirmed   m  78 2023-01-01           <NA> recovered
      5   6       Hope Arshad suspected   f  22 2023-01-01           <NA> recovered
      6   8    Shanta Holiday  probable   f  28 2023-01-01           <NA> recovered
      7  11   Aiman al-Demian  probable   m  46 2023-01-01           <NA> recovered
      8  12    Chandra Kilian suspected   f  67 2023-01-01           <NA> recovered
      9  13     Wajdi el-Diab confirmed   m  86 2023-01-01     2023-01-01 recovered
      10 18     Kanani Nguyen confirmed   f  60 2023-01-02           <NA> recovered
      11 20   Raaid el-Vaziri  probable   m  49 2023-01-02     2023-01-09 recovered
      12 22      Annie Carter  probable   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05     24.1
      3    2023-01-14         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02     24.1
      5          <NA>         2023-01-01        2023-01-03       NA
      6          <NA>         2023-01-03        2023-01-04       NA
      7          <NA>         2023-01-04        2023-01-05       NA
      8          <NA>         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03     24.1
      10         <NA>         2022-12-30        2023-01-03     24.1
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected without Ct

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_ct = FALSE)
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1      Gabriel Black  probable   m  35 2023-01-01           <NA> recovered
      2   2       Tyler Kelley confirmed   m  43 2023-01-01           <NA> recovered
      3   3       Cody Morales suspected   m   1 2023-01-01           <NA> recovered
      4   5          Joewid Le  probable   m  78 2023-01-01           <NA> recovered
      5   6      Carolyn Moore confirmed   f  22 2023-01-01           <NA> recovered
      6   8  Cheyenne Sayavong confirmed   f  28 2023-01-01           <NA> recovered
      7  11 Pierce Khanthavong confirmed   m  46 2023-01-01     2023-01-13 recovered
      8  12          Kendra To suspected   f  67 2023-01-01           <NA> recovered
      9  13  Preston Barringer confirmed   m  86 2023-01-01     2023-01-01      died
      10 18  Dominique Raymond confirmed   f  60 2023-01-02           <NA> recovered
      11 20   Bassaam el-Majid  probable   m  49 2023-01-02           <NA> recovered
      12 22      Susana Varela  probable   f   7 2023-01-02     2023-01-02 recovered
         date_outcome date_first_contact date_last_contact
      1          <NA>               <NA>              <NA>
      2          <NA>         2022-12-30        2023-01-05
      3          <NA>         2022-12-30        2023-01-02
      4          <NA>         2022-12-29        2023-01-02
      5          <NA>         2023-01-01        2023-01-03
      6          <NA>         2023-01-03        2023-01-04
      7          <NA>         2023-01-04        2023-01-05
      8          <NA>         2023-01-01        2023-01-04
      9    2023-01-09         2022-12-31        2023-01-03
      10         <NA>         2022-12-30        2023-01-03
      11         <NA>         2023-01-01        2023-01-04
      12         <NA>         2023-01-01        2023-01-03

# sim_linelist works as expected with anonymous

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_names = FALSE)
    Output
         id case_type sex age date_onset date_admission   outcome date_outcome
      1   1 confirmed   m  35 2023-01-01           <NA> recovered         <NA>
      2   2  probable   m  43 2023-01-01           <NA> recovered         <NA>
      3   3  probable   m   1 2023-01-01           <NA> recovered         <NA>
      4   5 confirmed   m  78 2023-01-01           <NA> recovered         <NA>
      5   6 confirmed   f  22 2023-01-01           <NA> recovered         <NA>
      6   8 confirmed   f  28 2023-01-01           <NA> recovered         <NA>
      7  11 confirmed   m  46 2023-01-01     2023-01-13 recovered         <NA>
      8  12 confirmed   f  67 2023-01-01           <NA> recovered         <NA>
      9  13 confirmed   m  86 2023-01-01     2023-01-01      died   2023-01-09
      10 18 confirmed   f  60 2023-01-02           <NA> recovered         <NA>
      11 20 confirmed   m  49 2023-01-02           <NA> recovered         <NA>
      12 22 confirmed   f   7 2023-01-02     2023-01-02 recovered         <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>     24.9
      2          2022-12-30        2023-01-05       NA
      3          2022-12-30        2023-01-02       NA
      4          2022-12-29        2023-01-02     24.9
      5          2023-01-01        2023-01-03     24.9
      6          2023-01-03        2023-01-04     24.9
      7          2023-01-04        2023-01-05     24.9
      8          2023-01-01        2023-01-04     24.9
      9          2022-12-31        2023-01-03     24.9
      10         2022-12-30        2023-01-03     24.9
      11         2023-01-01        2023-01-04     24.9
      12         2023-01-01        2023-01-03     24.9

# sim_linelist works as expected with age structure

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
         id        case_name case_type sex age date_onset date_admission   outcome
      1   1        Gene Than  probable   m  44 2023-01-01           <NA> recovered
      2   2 Caleb Fredericks  probable   m  13 2023-01-01           <NA> recovered
      3   3  Jaisean Venable suspected   m  22 2023-01-01     2023-01-09      died
      4   5     Taylor Swift  probable   m  85 2023-01-01           <NA> recovered
      5   6    Korren Bailey confirmed   f  41 2023-01-01           <NA> recovered
      6   8     Madison Zahn confirmed   f  89 2023-01-01     2023-01-02 recovered
      7  11    Dustin Bellow confirmed   m  69 2023-01-01           <NA> recovered
      8  12      Ryanna Hart confirmed   f  23 2023-01-01           <NA> recovered
      9  13    Rafael Garcia confirmed   m   9 2023-01-01           <NA> recovered
      10 18    Ashlan Hendon confirmed   f  62 2023-01-02           <NA> recovered
      11 20    Tieran Moorer suspected   m  52 2023-01-02     2023-01-15 recovered
      12 22      Paige Reich  probable   f  76 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05       NA
      3    2023-01-12         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03       24
      6          <NA>         2023-01-03        2023-01-04       24
      7          <NA>         2023-01-04        2023-01-05       24
      8          <NA>         2023-01-01        2023-01-04       24
      9          <NA>         2022-12-31        2023-01-03       24
      10         <NA>         2022-12-30        2023-01-03       24
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with age-strat risks & age struct

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, population_age = age_struct)
    Output
         id                 case_name case_type sex age date_onset date_admission
      1   1               Damion Hamm confirmed   m  44 2023-01-01           <NA>
      2   2         Ignacio Hernandez confirmed   m  13 2023-01-01           <NA>
      3   3            Bryce Donnelly confirmed   m  22 2023-01-01           <NA>
      4   5             David Arrieta confirmed   m  85 2023-01-01     2023-01-01
      5   6 Kristina Vazquez Pallares confirmed   f  41 2023-01-01           <NA>
      6   8          Nusaiba el-Farah suspected   f  89 2023-01-01           <NA>
      7  11    Dominic Kills In Sight  probable   m  69 2023-01-01           <NA>
      8  12              Violet Watts confirmed   f  23 2023-01-01           <NA>
      9  13       Khristopher Cunniff confirmed   m   9 2023-01-01           <NA>
      10 18               Paige Reich  probable   f  62 2023-01-02           <NA>
      11 20           Jackson Carlson confirmed   m  52 2023-01-02           <NA>
      12 22           Cassandra Smith suspected   f  76 2023-01-02           <NA>
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>     25.6
      2  recovered         <NA>         2022-12-30        2023-01-05     25.6
      3  recovered         <NA>         2022-12-30        2023-01-02     25.6
      4       died   2023-01-25         2022-12-29        2023-01-02     25.6
      5  recovered         <NA>         2023-01-01        2023-01-03     25.6
      6  recovered         <NA>         2023-01-03        2023-01-04       NA
      7  recovered         <NA>         2023-01-04        2023-01-05       NA
      8  recovered         <NA>         2023-01-01        2023-01-04     25.6
      9  recovered         <NA>         2022-12-31        2023-01-03     25.6
      10 recovered         <NA>         2022-12-30        2023-01-03       NA
      11 recovered         <NA>         2023-01-01        2023-01-04     25.6
      12 recovered         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with modified config

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution = "geom",
          last_contact_distribution_params = c(prob = 0.5)))
    Output
         id         case_name case_type sex age date_onset date_admission   outcome
      1   1  Maazina el-Kader  probable   f  20 2023-01-01           <NA> recovered
      2   2 Muneeb al-Youssef confirmed   m  24 2023-01-01           <NA> recovered
      3   3  Francisco Huerta suspected   m  51 2023-01-01     2023-01-07 recovered
      4   5      Sean Sundara confirmed   m  16 2023-01-01           <NA> recovered
      5   6    Jack Walentine suspected   m  83 2023-01-01           <NA> recovered
      6   8      Avery Temple  probable   m  48 2023-01-01           <NA> recovered
      7  11   Robert Gonzales  probable   m  77 2023-01-01     2023-01-01 recovered
      8  12     Timothy Cheek suspected   m  90 2023-01-01           <NA> recovered
      9  13    Courtney Smith confirmed   f  66 2023-01-01           <NA> recovered
      10 18     Jasra al-Hadi confirmed   f  31 2023-01-02     2023-01-02 recovered
      11 20   Codie Patterson  probable   m  46 2023-01-02           <NA> recovered
      12 22       Eric Childs  probable   m  75 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-01     24.1
      3          <NA>         2022-12-31        2023-01-02       NA
      4          <NA>         2022-12-30        2023-01-02     24.1
      5          <NA>         2022-12-31        2023-01-01       NA
      6          <NA>         2022-12-31        2023-01-01       NA
      7          <NA>         2022-12-30        2023-01-02       NA
      8          <NA>         2022-12-30        2023-01-01       NA
      9          <NA>         2022-12-29        2023-01-01     24.1
      10         <NA>         2022-12-30        2023-01-01     24.1
      11         <NA>         2022-12-30        2023-01-01       NA
      12         <NA>         2022-12-30        2023-01-02       NA

# sim_linelist works as expected with modified config parameters

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution_params = c(lambda = 5)))
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1      Gabriel Black  probable   m  35 2023-01-01           <NA> recovered
      2   2       Tyler Kelley confirmed   m  43 2023-01-01           <NA> recovered
      3   3       Cody Morales suspected   m   1 2023-01-01           <NA> recovered
      4   5          Joewid Le  probable   m  78 2023-01-01           <NA> recovered
      5   6      Carolyn Moore confirmed   f  22 2023-01-01           <NA> recovered
      6   8  Cheyenne Sayavong confirmed   f  28 2023-01-01           <NA> recovered
      7  11 Pierce Khanthavong confirmed   m  46 2023-01-01     2023-01-13 recovered
      8  12          Kendra To suspected   f  67 2023-01-01           <NA> recovered
      9  13  Preston Barringer confirmed   m  86 2023-01-01     2023-01-01      died
      10 18  Dominique Raymond confirmed   f  60 2023-01-02           <NA> recovered
      11 20   Bassaam el-Majid  probable   m  49 2023-01-02           <NA> recovered
      12 22      Susana Varela  probable   f   7 2023-01-02     2023-01-02 recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2023-01-01        2023-01-07       24
      3          <NA>         2022-12-31        2023-01-03       NA
      4          <NA>         2022-12-31        2023-01-04       NA
      5          <NA>         2023-01-02        2023-01-04       24
      6          <NA>         2023-01-06        2023-01-07       24
      7          <NA>         2023-01-07        2023-01-08       24
      8          <NA>         2023-01-03        2023-01-06       NA
      9    2023-01-09         2023-01-02        2023-01-05       24
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
         id               case_name case_type sex age date_onset date_admission
      1   1            Bryce Kelley  probable   m  35 2023-01-01           <NA>
      2   2      Cleatus Kacprowicz confirmed   m  43 2023-01-01           <NA>
      3   3     Khristopher Carlson suspected   m   1 2023-01-01           <NA>
      4   5          Raynaldo Grano  probable   m  78 2023-01-01           <NA>
      5   6           Carolyn Moore confirmed   f  22 2023-01-01           <NA>
      6   8       Cheyenne Sayavong confirmed   f  28 2023-01-01           <NA>
      7  11 Abdul Maalik al-Chahine confirmed   m  46 2023-01-01     2023-01-13
      8  12               Kendra To suspected   f  67 2023-01-01           <NA>
      9  13               Joewid Le confirmed   m  86 2023-01-01     2023-01-01
      10 18       Dominique Raymond confirmed   f  60 2023-01-02           <NA>
      11 20           Jackson Sheek  probable   m  49 2023-01-02           <NA>
      12 22           Susana Varela  probable   f   7 2023-01-02     2023-01-02
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>       NA
      2  recovered         <NA>         2022-12-30        2023-01-05       24
      3  recovered         <NA>         2022-12-30        2023-01-02       NA
      4  recovered         <NA>         2022-12-29        2023-01-02       NA
      5  recovered         <NA>         2023-01-01        2023-01-03       24
      6  recovered         <NA>         2023-01-03        2023-01-04       24
      7  recovered         <NA>         2023-01-04        2023-01-05       24
      8  recovered         <NA>         2023-01-01        2023-01-04       NA
      9  recovered         <NA>         2022-12-31        2023-01-03       24
      10 recovered         <NA>         2022-12-30        2023-01-03       24
      11 recovered         <NA>         2023-01-01        2023-01-04       NA
      12 recovered         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with time-varying cfr & age-strat

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_death_risk = age_dep_hosp_death_risk, config = create_config(
          time_varying_death_risk = function(risk, time) risk * exp(-time)))
    Output
         id               case_name case_type sex age date_onset date_admission
      1   1            Bryce Kelley  probable   m  35 2023-01-01           <NA>
      2   2      Cleatus Kacprowicz confirmed   m  43 2023-01-01           <NA>
      3   3     Khristopher Carlson suspected   m   1 2023-01-01           <NA>
      4   5          Raynaldo Grano  probable   m  78 2023-01-01           <NA>
      5   6           Carolyn Moore confirmed   f  22 2023-01-01           <NA>
      6   8       Cheyenne Sayavong confirmed   f  28 2023-01-01           <NA>
      7  11 Abdul Maalik al-Chahine confirmed   m  46 2023-01-01     2023-01-13
      8  12               Kendra To suspected   f  67 2023-01-01           <NA>
      9  13               Joewid Le confirmed   m  86 2023-01-01     2023-01-01
      10 18       Dominique Raymond confirmed   f  60 2023-01-02           <NA>
      11 20           Jackson Sheek  probable   m  49 2023-01-02           <NA>
      12 22           Susana Varela  probable   f   7 2023-01-02     2023-01-02
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>       NA
      2  recovered         <NA>         2022-12-30        2023-01-05       24
      3  recovered         <NA>         2022-12-30        2023-01-02       NA
      4  recovered         <NA>         2022-12-29        2023-01-02       NA
      5  recovered         <NA>         2023-01-01        2023-01-03       24
      6  recovered         <NA>         2023-01-03        2023-01-04       24
      7  recovered         <NA>         2023-01-04        2023-01-05       24
      8  recovered         <NA>         2023-01-01        2023-01-04       NA
      9  recovered         <NA>         2022-12-31        2023-01-03       24
      10 recovered         <NA>         2022-12-30        2023-01-03       24
      11 recovered         <NA>         2023-01-01        2023-01-04       NA
      12 recovered         <NA>         2023-01-01        2023-01-03       NA

