# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
         id                 case_name case_type sex age date_onset date_admission
      1   1               Damion Hamm confirmed   m  35 2023-01-01           <NA>
      2   2         Ignacio Hernandez confirmed   m  43 2023-01-01           <NA>
      3   3            Bryce Donnelly confirmed   m   1 2023-01-01           <NA>
      4   5             David Arrieta confirmed   m  78 2023-01-01           <NA>
      5   6 Kristina Vazquez Pallares confirmed   f  22 2023-01-01           <NA>
      6   8          Nusaiba el-Farah suspected   f  28 2023-01-01           <NA>
      7  11    Dominic Kills In Sight  probable   m  46 2023-01-01     2023-01-13
      8  12              Violet Watts confirmed   f  67 2023-01-01           <NA>
      9  13       Khristopher Cunniff confirmed   m  86 2023-01-01     2023-01-01
      10 18               Paige Reich  probable   f  60 2023-01-02           <NA>
      11 20           Jackson Carlson confirmed   m  49 2023-01-02           <NA>
      12 22           Cassandra Smith suspected   f   7 2023-01-02     2023-01-02
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>     25.6
      2  recovered         <NA>         2022-12-30        2023-01-05     25.6
      3  recovered         <NA>         2022-12-30        2023-01-02     25.6
      4  recovered         <NA>         2022-12-29        2023-01-02     25.6
      5  recovered         <NA>         2023-01-01        2023-01-03     25.6
      6  recovered         <NA>         2023-01-03        2023-01-04       NA
      7  recovered         <NA>         2023-01-04        2023-01-05       NA
      8  recovered         <NA>         2023-01-01        2023-01-04     25.6
      9  recovered         <NA>         2022-12-31        2023-01-03     25.6
      10 recovered         <NA>         2022-12-30        2023-01-03       NA
      11 recovered         <NA>         2023-01-01        2023-01-04     25.6
      12      died   2023-01-16         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with age-strat risks

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
         id             case_name case_type sex age date_onset date_admission
      1   1    David Garcia Mayen  probable   m  35 2023-01-01           <NA>
      2   2   Rory Kills In Sight confirmed   m  43 2023-01-01           <NA>
      3   3      Sheldon Martinez confirmed   m   1 2023-01-01     2023-01-11
      4   5         Bryce Cunniff  probable   m  78 2023-01-01           <NA>
      5   6        Lien Whitworth confirmed   f  22 2023-01-01           <NA>
      6   8         Tiffany Weiss suspected   f  28 2023-01-01           <NA>
      7  11    Cleatus Kacprowicz  probable   m  46 2023-01-01           <NA>
      8  12          Taylor Moore confirmed   f  67 2023-01-01           <NA>
      9  13         Tyler Carlson confirmed   m  86 2023-01-01     2023-01-01
      10 18      Grayson Lovelace confirmed   f  60 2023-01-02           <NA>
      11 20 Abdul Maalik al-Ishak suspected   m  49 2023-01-02     2023-01-09
      12 22         Kendra Newton confirmed   f   7 2023-01-02           <NA>
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>       NA
      2  recovered         <NA>         2022-12-30        2023-01-05       25
      3  recovered         <NA>         2022-12-30        2023-01-02       25
      4  recovered         <NA>         2022-12-29        2023-01-02       NA
      5  recovered         <NA>         2023-01-01        2023-01-03       25
      6  recovered         <NA>         2023-01-03        2023-01-04       NA
      7  recovered         <NA>         2023-01-04        2023-01-05       NA
      8  recovered         <NA>         2023-01-01        2023-01-04       25
      9  recovered         <NA>         2022-12-31        2023-01-03       25
      10 recovered         <NA>         2022-12-30        2023-01-03       25
      11 recovered         <NA>         2023-01-01        2023-01-04       NA
      12 recovered         <NA>         2023-01-01        2023-01-03       25

# sim_linelist works as expected without Ct

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_ct = FALSE)
    Output
         id                 case_name case_type sex age date_onset date_admission
      1   1               Damion Hamm confirmed   m  35 2023-01-01           <NA>
      2   2         Ignacio Hernandez confirmed   m  43 2023-01-01           <NA>
      3   3            Bryce Donnelly confirmed   m   1 2023-01-01           <NA>
      4   5             David Arrieta confirmed   m  78 2023-01-01           <NA>
      5   6 Kristina Vazquez Pallares confirmed   f  22 2023-01-01           <NA>
      6   8          Nusaiba el-Farah suspected   f  28 2023-01-01           <NA>
      7  11    Dominic Kills In Sight  probable   m  46 2023-01-01     2023-01-13
      8  12              Violet Watts confirmed   f  67 2023-01-01           <NA>
      9  13       Khristopher Cunniff confirmed   m  86 2023-01-01     2023-01-01
      10 18               Paige Reich  probable   f  60 2023-01-02           <NA>
      11 20           Jackson Carlson confirmed   m  49 2023-01-02           <NA>
      12 22           Cassandra Smith suspected   f   7 2023-01-02     2023-01-02
           outcome date_outcome date_first_contact date_last_contact
      1  recovered         <NA>               <NA>              <NA>
      2  recovered         <NA>         2022-12-30        2023-01-05
      3  recovered         <NA>         2022-12-30        2023-01-02
      4  recovered         <NA>         2022-12-29        2023-01-02
      5  recovered         <NA>         2023-01-01        2023-01-03
      6  recovered         <NA>         2023-01-03        2023-01-04
      7  recovered         <NA>         2023-01-04        2023-01-05
      8  recovered         <NA>         2023-01-01        2023-01-04
      9  recovered         <NA>         2022-12-31        2023-01-03
      10 recovered         <NA>         2022-12-30        2023-01-03
      11 recovered         <NA>         2023-01-01        2023-01-04
      12      died   2023-01-16         2023-01-01        2023-01-03

# sim_linelist works as expected with anonymous

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_names = FALSE)
    Output
         id case_type sex age date_onset date_admission   outcome date_outcome
      1   1 confirmed   m  35 2023-01-01           <NA> recovered         <NA>
      2   2 confirmed   m  43 2023-01-01           <NA> recovered         <NA>
      3   3 confirmed   m   1 2023-01-01           <NA> recovered         <NA>
      4   5 confirmed   m  78 2023-01-01           <NA> recovered         <NA>
      5   6 suspected   f  22 2023-01-01           <NA> recovered         <NA>
      6   8  probable   f  28 2023-01-01           <NA> recovered         <NA>
      7  11 confirmed   m  46 2023-01-01     2023-01-13 recovered         <NA>
      8  12 confirmed   f  67 2023-01-01           <NA> recovered         <NA>
      9  13  probable   m  86 2023-01-01     2023-01-01 recovered         <NA>
      10 18  probable   f  60 2023-01-02           <NA> recovered         <NA>
      11 20 confirmed   m  49 2023-01-02           <NA> recovered         <NA>
      12 22 confirmed   f   7 2023-01-02     2023-01-02      died   2023-01-16
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>     25.7
      2          2022-12-30        2023-01-05     25.7
      3          2022-12-30        2023-01-02     25.7
      4          2022-12-29        2023-01-02     25.7
      5          2023-01-01        2023-01-03       NA
      6          2023-01-03        2023-01-04       NA
      7          2023-01-04        2023-01-05     25.7
      8          2023-01-01        2023-01-04     25.7
      9          2022-12-31        2023-01-03       NA
      10         2022-12-30        2023-01-03       NA
      11         2023-01-01        2023-01-04     25.7
      12         2023-01-01        2023-01-03     25.7

# sim_linelist works as expected with age structure

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
         id         case_name case_type sex age date_onset date_admission   outcome
      1   1        Mark Beard confirmed   m  44 2023-01-01           <NA> recovered
      2   2   Brian Mccracken confirmed   m  13 2023-01-01           <NA> recovered
      3   3     Jesus Garduno confirmed   m  22 2023-01-01     2023-01-09      died
      4   5   Taalib al-Naqvi confirmed   m  85 2023-01-01           <NA> recovered
      5   6       Kelly Geist confirmed   f  41 2023-01-01           <NA> recovered
      6   8    Madison Krause suspected   f  89 2023-01-01     2023-01-02 recovered
      7  11   Jonathon Lujano  probable   m  69 2023-01-01           <NA> recovered
      8  12      Ashlan Allen confirmed   f  23 2023-01-01           <NA> recovered
      9  13 Dhaahir el-Hariri confirmed   m   9 2023-01-01           <NA> recovered
      10 18       Korren Hart  probable   f  62 2023-01-02           <NA> recovered
      11 20        Isaac Huff confirmed   m  52 2023-01-02     2023-01-15 recovered
      12 22      Ryanna Watts suspected   f  76 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>     25.6
      2          <NA>         2022-12-30        2023-01-05     25.6
      3    2023-01-09         2022-12-30        2023-01-02     25.6
      4          <NA>         2022-12-29        2023-01-02     25.6
      5          <NA>         2023-01-01        2023-01-03     25.6
      6          <NA>         2023-01-03        2023-01-04       NA
      7          <NA>         2023-01-04        2023-01-05       NA
      8          <NA>         2023-01-01        2023-01-04     25.6
      9          <NA>         2022-12-31        2023-01-03     25.6
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04     25.6
      12         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with age-strat risks & age struct

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, population_age = age_struct)
    Output
         id        case_name case_type sex age date_onset date_admission   outcome
      1   1        Gene Than  probable   m  44 2023-01-01           <NA> recovered
      2   2 Caleb Fredericks  probable   m  13 2023-01-01           <NA> recovered
      3   3  Jaisean Venable suspected   m  22 2023-01-01           <NA> recovered
      4   5     Taylor Swift  probable   m  85 2023-01-01     2023-01-01 recovered
      5   6    Korren Bailey confirmed   f  41 2023-01-01           <NA> recovered
      6   8     Madison Zahn confirmed   f  89 2023-01-01           <NA> recovered
      7  11    Dustin Bellow confirmed   m  69 2023-01-01           <NA> recovered
      8  12      Ryanna Hart confirmed   f  23 2023-01-01           <NA> recovered
      9  13    Rafael Garcia confirmed   m   9 2023-01-01           <NA> recovered
      10 18    Ashlan Hendon confirmed   f  62 2023-01-02           <NA> recovered
      11 20    Tieran Moorer suspected   m  52 2023-01-02           <NA> recovered
      12 22      Paige Reich  probable   f  76 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05       NA
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03       24
      6          <NA>         2023-01-03        2023-01-04       24
      7          <NA>         2023-01-04        2023-01-05       24
      8          <NA>         2023-01-01        2023-01-04       24
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
         id               case_name case_type sex age date_onset date_admission
      1   1      Lilibeth Depoyster suspected   f  20 2023-01-01           <NA>
      2   2       Mubarak el-Othman confirmed   m  24 2023-01-01           <NA>
      3   3          Tae Woo Karman confirmed   m  51 2023-01-01     2023-01-07
      4   5       Raakaan el-Vaziri suspected   m  16 2023-01-01           <NA>
      5   6         Jaasim al-Shams confirmed   m  83 2023-01-01           <NA>
      6   8          Jared Chambers confirmed   m  48 2023-01-01           <NA>
      7  11          Muneer al-Miah confirmed   m  77 2023-01-01     2023-01-01
      8  12 Abdul Khaliq al-Youssef confirmed   m  90 2023-01-01           <NA>
      9  13         Cheyenne Garcia confirmed   f  66 2023-01-01           <NA>
      10 18       Shaakira al-Gaber  probable   f  31 2023-01-02     2023-01-02
      11 20          Miguel Stimack suspected   m  46 2023-01-02           <NA>
      12 22          Benito Casarez confirmed   m  75 2023-01-02           <NA>
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>       NA
      2  recovered         <NA>         2022-12-30        2023-01-01     25.1
      3       died   2023-01-10         2022-12-31        2023-01-02     25.1
      4  recovered         <NA>         2022-12-30        2023-01-02       NA
      5  recovered         <NA>         2022-12-31        2023-01-01     25.1
      6  recovered         <NA>         2022-12-31        2023-01-01     25.1
      7  recovered         <NA>         2022-12-30        2023-01-02     25.1
      8  recovered         <NA>         2022-12-30        2023-01-01     25.1
      9  recovered         <NA>         2022-12-29        2023-01-01     25.1
      10 recovered         <NA>         2022-12-30        2023-01-01       NA
      11 recovered         <NA>         2022-12-30        2023-01-01       NA
      12 recovered         <NA>         2022-12-30        2023-01-02     25.1

# sim_linelist works as expected with modified config parameters

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution_params = c(lambda = 5)))
    Output
         id                 case_name case_type sex age date_onset date_admission
      1   1               Damion Hamm confirmed   m  35 2023-01-01           <NA>
      2   2         Ignacio Hernandez confirmed   m  43 2023-01-01           <NA>
      3   3            Bryce Donnelly confirmed   m   1 2023-01-01           <NA>
      4   5             David Arrieta confirmed   m  78 2023-01-01           <NA>
      5   6 Kristina Vazquez Pallares confirmed   f  22 2023-01-01           <NA>
      6   8          Nusaiba el-Farah suspected   f  28 2023-01-01           <NA>
      7  11    Dominic Kills In Sight  probable   m  46 2023-01-01     2023-01-13
      8  12              Violet Watts confirmed   f  67 2023-01-01           <NA>
      9  13       Khristopher Cunniff confirmed   m  86 2023-01-01     2023-01-01
      10 18               Paige Reich  probable   f  60 2023-01-02           <NA>
      11 20           Jackson Carlson confirmed   m  49 2023-01-02           <NA>
      12 22           Cassandra Smith suspected   f   7 2023-01-02     2023-01-02
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>     25.6
      2  recovered         <NA>         2023-01-01        2023-01-07     25.6
      3  recovered         <NA>         2022-12-31        2023-01-03     25.6
      4  recovered         <NA>         2022-12-31        2023-01-04     25.6
      5  recovered         <NA>         2023-01-02        2023-01-04     25.6
      6  recovered         <NA>         2023-01-06        2023-01-07       NA
      7  recovered         <NA>         2023-01-07        2023-01-08       NA
      8  recovered         <NA>         2023-01-03        2023-01-06     25.6
      9  recovered         <NA>         2023-01-02        2023-01-05     25.6
      10 recovered         <NA>         2023-01-01        2023-01-05       NA
      11 recovered         <NA>         2023-01-04        2023-01-07     25.6
      12      died   2023-01-16         2023-01-03        2023-01-05       NA

# sim_linelist works as expected with time-varying cfr

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(time_varying_death_risk = function(x) dexp(x = x,
          rate = 0.05)))
    Output
         id                 case_name case_type sex age date_onset date_admission
      1   1              Devyn Chavez  probable   m  35 2023-01-01           <NA>
      2   2             Bryce Cunniff confirmed   m  43 2023-01-01           <NA>
      3   3      Ignacio Garcia Mayen confirmed   m   1 2023-01-01           <NA>
      4   5      Jacob Kills In Sight  probable   m  78 2023-01-01           <NA>
      5   6          Tiffany Harrison confirmed   f  22 2023-01-01           <NA>
      6   8      Caroline Hergenreter suspected   f  28 2023-01-01           <NA>
      7  11        Khristopher Kelley  probable   m  46 2023-01-01     2023-01-13
      8  12             Carolyn Moore confirmed   f  67 2023-01-01           <NA>
      9  13             Tyler Carlson confirmed   m  86 2023-01-01     2023-01-01
      10 18 Chantelle Vazquez-Luevano confirmed   f  60 2023-01-02           <NA>
      11 20              David Abeyta suspected   m  49 2023-01-02           <NA>
      12 22          Megan Riggenbach confirmed   f   7 2023-01-02     2023-01-02
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>       NA
      2  recovered         <NA>         2022-12-30        2023-01-05       25
      3  recovered         <NA>         2022-12-30        2023-01-02       25
      4  recovered         <NA>         2022-12-29        2023-01-02       NA
      5  recovered         <NA>         2023-01-01        2023-01-03       25
      6  recovered         <NA>         2023-01-03        2023-01-04       NA
      7  recovered         <NA>         2023-01-04        2023-01-05       NA
      8  recovered         <NA>         2023-01-01        2023-01-04       25
      9  recovered         <NA>         2022-12-31        2023-01-03       25
      10 recovered         <NA>         2022-12-30        2023-01-03       25
      11 recovered         <NA>         2023-01-01        2023-01-04       NA
      12      died   2023-01-15         2023-01-01        2023-01-03       25

# sim_linelist works as expected with time-varying cfr & age-strat

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_death_risk = age_dep_hosp_death_risk, config = create_config(
          time_varying_death_risk = function(x) dexp(x = x, rate = 0.05)))
    Output
         id             case_name case_type sex age date_onset date_admission
      1   1        Bryce Lehmkuhl  probable   m  35 2023-01-01           <NA>
      2   2       Dennison Bellow confirmed   m  43 2023-01-01           <NA>
      3   3           Damion Long suspected   m   1 2023-01-01           <NA>
      4   5  Ignacio Garcia Mayen  probable   m  78 2023-01-01           <NA>
      5   6         Carolyn Moore confirmed   f  22 2023-01-01           <NA>
      6   8     Cheyenne Sayavong confirmed   f  28 2023-01-01           <NA>
      7  11          David Abeyta confirmed   m  46 2023-01-01     2023-01-13
      8  12             Kendra To suspected   f  67 2023-01-01           <NA>
      9  13 Morgan Kills In Sight confirmed   m  86 2023-01-01     2023-01-01
      10 18     Dominique Raymond confirmed   f  60 2023-01-02           <NA>
      11 20      Jackson Peterson  probable   m  49 2023-01-02           <NA>
      12 22         Susana Varela  probable   f   7 2023-01-02     2023-01-02
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

