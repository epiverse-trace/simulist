# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
         id          case_name case_type sex age date_onset date_admission date_death
      1   1     Joshua Esparza confirmed   m  71 2023-01-01           <NA>       <NA>
      2   3     Alyshah Atkins confirmed   f  44 2023-01-02           <NA> 2023-01-24
      3   4     Rifat al-Mussa suspected   m  49 2023-01-02     2023-01-03       <NA>
      4   8 Zachery Miramontes  probable   m  50 2023-01-02           <NA>       <NA>
      5   9          Ryan Zahn  probable   m   7 2023-01-02           <NA>       <NA>
      6  11    Bruce Hishinuma confirmed   m  24 2023-01-02     2023-01-12       <NA>
      7  13    Dennison Duvall suspected   m  53 2023-01-03           <NA>       <NA>
      8  15         Mary Silva  probable   f  83 2023-01-03           <NA>       <NA>
      9  16       Sage Thielke confirmed   f   2 2023-01-03           <NA>       <NA>
      10 17   Stephany Botello suspected   f  48 2023-01-03           <NA>       <NA>
      11 22      Taylor Hendon  probable   m  66 2023-01-03           <NA>       <NA>
      12 25     Chengleng Chun confirmed   m  34 2023-01-04     2023-01-08       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>     25.2
      2          2023-01-01        2023-01-02     25.2
      3          2023-01-02        2023-01-05       NA
      4          2023-01-02        2023-01-05       NA
      5          2023-01-03        2023-01-04       NA
      6          2023-01-02        2023-01-05     25.2
      7          2023-01-02        2023-01-04       NA
      8          2023-01-07        2023-01-10       NA
      9          2023-01-02        2023-01-05     25.2
      10         2023-01-03        2023-01-04       NA
      11         2023-01-07        2023-01-10       NA
      12         2023-01-03        2023-01-06     25.2

# sim_linelist works as expected with age-strat risks

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
         id          case_name case_type sex age date_onset date_admission date_death
      1   1     Sean Depoyster suspected   m  71 2023-01-01           <NA>       <NA>
      2   3   Selena Hernandez suspected   f  44 2023-01-02     2023-01-03 2023-01-15
      3   4    Khairi al-Gaber confirmed   m  49 2023-01-02           <NA> 2023-01-14
      4   8    Braxton Lindsey  probable   m  50 2023-01-02           <NA>       <NA>
      5   9      Albert Nguyen suspected   m   7 2023-01-02           <NA>       <NA>
      6  11      Keili Ketchum suspected   m  24 2023-01-02           <NA>       <NA>
      7  13  Daniel Hemsouvanh confirmed   m  53 2023-01-03           <NA>       <NA>
      8  15     Natalie Montez confirmed   f  83 2023-01-03     2023-01-05 2023-01-13
      9  16    Morgan Williams suspected   f   2 2023-01-03     2023-01-05 2023-01-10
      10 17 Briana Greene-King confirmed   f  48 2023-01-03           <NA>       <NA>
      11 22     Dominick Maker suspected   m  66 2023-01-03           <NA>       <NA>
      12 25      Carl Levi Lee confirmed   m  34 2023-01-04           <NA>       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>       NA
      2          2023-01-01        2023-01-02       NA
      3          2023-01-02        2023-01-05     25.1
      4          2023-01-02        2023-01-05       NA
      5          2023-01-03        2023-01-04       NA
      6          2023-01-02        2023-01-05       NA
      7          2023-01-02        2023-01-04     25.1
      8          2023-01-07        2023-01-10     25.1
      9          2023-01-02        2023-01-05       NA
      10         2023-01-03        2023-01-04     25.1
      11         2023-01-07        2023-01-10       NA
      12         2023-01-03        2023-01-06     25.1

# sim_linelist works as expected without Ct

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_ct = FALSE)
    Output
         id          case_name case_type sex age date_onset date_admission date_death
      1   1     Joshua Esparza confirmed   m  71 2023-01-01           <NA>       <NA>
      2   3     Alyshah Atkins confirmed   f  44 2023-01-02           <NA> 2023-01-24
      3   4     Rifat al-Mussa suspected   m  49 2023-01-02     2023-01-03       <NA>
      4   8 Zachery Miramontes  probable   m  50 2023-01-02           <NA>       <NA>
      5   9          Ryan Zahn  probable   m   7 2023-01-02           <NA>       <NA>
      6  11    Bruce Hishinuma confirmed   m  24 2023-01-02     2023-01-12       <NA>
      7  13    Dennison Duvall suspected   m  53 2023-01-03           <NA>       <NA>
      8  15         Mary Silva  probable   f  83 2023-01-03           <NA>       <NA>
      9  16       Sage Thielke confirmed   f   2 2023-01-03           <NA>       <NA>
      10 17   Stephany Botello suspected   f  48 2023-01-03           <NA>       <NA>
      11 22      Taylor Hendon  probable   m  66 2023-01-03           <NA>       <NA>
      12 25     Chengleng Chun confirmed   m  34 2023-01-04     2023-01-08       <NA>
         date_first_contact date_last_contact
      1                <NA>              <NA>
      2          2023-01-01        2023-01-02
      3          2023-01-02        2023-01-05
      4          2023-01-02        2023-01-05
      5          2023-01-03        2023-01-04
      6          2023-01-02        2023-01-05
      7          2023-01-02        2023-01-04
      8          2023-01-07        2023-01-10
      9          2023-01-02        2023-01-05
      10         2023-01-03        2023-01-04
      11         2023-01-07        2023-01-10
      12         2023-01-03        2023-01-06

# sim_linelist works as expected with anonymous

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_names = FALSE)
    Output
         id case_type sex age date_onset date_admission date_death date_first_contact
      1   1 suspected   m  71 2023-01-01           <NA>       <NA>               <NA>
      2   3 suspected   f  44 2023-01-02           <NA> 2023-01-24         2023-01-01
      3   4  probable   m  49 2023-01-02     2023-01-03       <NA>         2023-01-02
      4   8 confirmed   m  50 2023-01-02           <NA>       <NA>         2023-01-02
      5   9  probable   m   7 2023-01-02           <NA>       <NA>         2023-01-03
      6  11 suspected   m  24 2023-01-02     2023-01-12       <NA>         2023-01-02
      7  13 confirmed   m  53 2023-01-03           <NA>       <NA>         2023-01-02
      8  15 confirmed   f  83 2023-01-03           <NA>       <NA>         2023-01-07
      9  16 suspected   f   2 2023-01-03           <NA>       <NA>         2023-01-02
      10 17 confirmed   f  48 2023-01-03           <NA>       <NA>         2023-01-03
      11 22 confirmed   m  66 2023-01-03           <NA>       <NA>         2023-01-07
      12 25 confirmed   m  34 2023-01-04     2023-01-08       <NA>         2023-01-03
         date_last_contact ct_value
      1               <NA>       NA
      2         2023-01-02       NA
      3         2023-01-05       NA
      4         2023-01-05       24
      5         2023-01-04       NA
      6         2023-01-05       NA
      7         2023-01-04       24
      8         2023-01-10       24
      9         2023-01-05       NA
      10        2023-01-04       24
      11        2023-01-10       24
      12        2023-01-06       24

# sim_linelist works as expected with age structure

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
         id         case_name case_type sex age date_onset date_admission date_death
      1   1        Cass Jumbo suspected   m  13 2023-01-01           <NA>       <NA>
      2   3    Stephanie Park  probable   f  24 2023-01-02           <NA>       <NA>
      3   4   Joseph Orlowske confirmed   m  52 2023-01-02           <NA>       <NA>
      4   8   Hunter Saunders confirmed   m  25 2023-01-02           <NA>       <NA>
      5   9      Anthony Carr confirmed   m  69 2023-01-02     2023-01-15       <NA>
      6  11 Thaamir al-Masood suspected   m  19 2023-01-02           <NA>       <NA>
      7  13   Riyaal al-Samra suspected   m  68 2023-01-03     2023-01-04       <NA>
      8  15   Emily Rodriguez  probable   f  84 2023-01-03           <NA>       <NA>
      9  16    Allyson Browne confirmed   f  79 2023-01-03           <NA>       <NA>
      10 17   Aneesa al-Malak confirmed   f   5 2023-01-03           <NA>       <NA>
      11 22    Jonah Sterling  probable   m  66 2023-01-03           <NA>       <NA>
      12 25     Michael Lopez suspected   m  26 2023-01-04     2023-01-07       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>       NA
      2          2023-01-01        2023-01-02       NA
      3          2023-01-02        2023-01-05     25.5
      4          2023-01-02        2023-01-05     25.5
      5          2023-01-03        2023-01-04     25.5
      6          2023-01-02        2023-01-05       NA
      7          2023-01-02        2023-01-04       NA
      8          2023-01-07        2023-01-10       NA
      9          2023-01-02        2023-01-05     25.5
      10         2023-01-03        2023-01-04     25.5
      11         2023-01-07        2023-01-10       NA
      12         2023-01-03        2023-01-06       NA

# sim_linelist works as expected with age-strat risks & age struct

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, population_age = age_struct)
    Output
         id          case_name case_type sex age date_onset date_admission date_death
      1   1   Michaeli Apodaca confirmed   m  13 2023-01-01           <NA>       <NA>
      2   3     Rifqa al-Malak confirmed   f  24 2023-01-02           <NA> 2023-01-11
      3   4      Dennis Wilson confirmed   m  52 2023-01-02           <NA>       <NA>
      4   8        Sad el-Ozer suspected   m  25 2023-01-02           <NA>       <NA>
      5   9     Tristan Cahill suspected   m  69 2023-01-02           <NA>       <NA>
      6  11   Treven Contreras  probable   m  19 2023-01-02           <NA>       <NA>
      7  13      Tyler Beltran confirmed   m  68 2023-01-03           <NA>       <NA>
      8  15    Faseeha el-Dada confirmed   f  84 2023-01-03           <NA>       <NA>
      9  16 Brittany Rodriguez  probable   f  79 2023-01-03           <NA>       <NA>
      10 17    Lauren Williams suspected   f   5 2023-01-03           <NA>       <NA>
      11 22      Alex Stilwell  probable   m  66 2023-01-03           <NA>       <NA>
      12 25  Jacob Howlingwolf confirmed   m  26 2023-01-04           <NA>       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>     25.4
      2          2023-01-01        2023-01-02     25.4
      3          2023-01-02        2023-01-05     25.4
      4          2023-01-02        2023-01-05       NA
      5          2023-01-03        2023-01-04       NA
      6          2023-01-02        2023-01-05       NA
      7          2023-01-02        2023-01-04     25.4
      8          2023-01-07        2023-01-10     25.4
      9          2023-01-02        2023-01-05       NA
      10         2023-01-03        2023-01-04       NA
      11         2023-01-07        2023-01-10       NA
      12         2023-01-03        2023-01-06     25.4

# sim_linelist works as expected with modified config

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution = "geom",
          last_contact_distribution_params = c(prob = 0.5)))
    Output
         id          case_name case_type sex age date_onset date_admission date_death
      1   1   Irfaan al-Masood suspected   m  35 2023-01-01           <NA>       <NA>
      2   3      Cody Lovelace confirmed   m  19 2023-01-02     2023-01-05       <NA>
      3   4    Natalie Vasquez suspected   f  75 2023-01-02     2023-01-03       <NA>
      4   8 Mushtaaq al-Rahimi confirmed   m  50 2023-01-02           <NA>       <NA>
      5   9       Selena Anaya  probable   f  24 2023-01-02           <NA>       <NA>
      6  11 Shaamila al-Shahan  probable   f  79 2023-01-02           <NA>       <NA>
      7  13        Briana Ford  probable   f  39 2023-01-03     2023-01-03       <NA>
      8  15         Keili Huff confirmed   m  12 2023-01-03           <NA>       <NA>
      9  16   Iliana Archuleta confirmed   f  14 2023-01-03           <NA>       <NA>
      10 17      Ceara Directo confirmed   f  16 2023-01-03           <NA>       <NA>
      11 22        Daniel Kuch  probable   m  73 2023-01-03           <NA>       <NA>
      12 25 Trey-Logan Raymond confirmed   m   5 2023-01-04           <NA>       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>       NA
      2          2022-12-27        2023-01-01       26
      3          2023-01-01        2023-01-04       NA
      4          2023-01-02        2023-01-03       26
      5          2023-01-01        2023-01-03       NA
      6          2022-12-31        2023-01-02       NA
      7          2022-12-29        2023-01-03       NA
      8          2022-12-31        2023-01-02       26
      9          2022-12-31        2023-01-02       26
      10         2022-12-29        2023-01-03       26
      11         2023-01-02        2023-01-04       NA
      12         2023-01-01        2023-01-04       26

# sim_linelist works as expected with modified config parameters

    Code
      sim_linelist(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution_params = c(lambda = 5)))
    Output
         id          case_name case_type sex age date_onset date_admission date_death
      1   1     Joshua Esparza confirmed   m  71 2023-01-01           <NA>       <NA>
      2   3     Alyshah Atkins confirmed   f  44 2023-01-02           <NA> 2023-01-24
      3   4     Rifat al-Mussa suspected   m  49 2023-01-02     2023-01-03       <NA>
      4   8 Zachery Miramontes  probable   m  50 2023-01-02           <NA>       <NA>
      5   9          Ryan Zahn  probable   m   7 2023-01-02           <NA>       <NA>
      6  11    Bruce Hishinuma confirmed   m  24 2023-01-02     2023-01-12       <NA>
      7  13    Dennison Duvall suspected   m  53 2023-01-03           <NA>       <NA>
      8  15         Mary Silva  probable   f  83 2023-01-03           <NA>       <NA>
      9  16       Sage Thielke confirmed   f   2 2023-01-03           <NA>       <NA>
      10 17   Stephany Botello suspected   f  48 2023-01-03           <NA>       <NA>
      11 22      Taylor Hendon  probable   m  66 2023-01-03           <NA>       <NA>
      12 25     Chengleng Chun confirmed   m  34 2023-01-04     2023-01-08       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>     25.2
      2          2023-01-02        2023-01-03     25.2
      3          2023-01-05        2023-01-08       NA
      4          2023-01-04        2023-01-07       NA
      5          2023-01-05        2023-01-06       NA
      6          2023-01-04        2023-01-07     25.2
      7          2023-01-04        2023-01-06       NA
      8          2023-01-10        2023-01-13       NA
      9          2023-01-05        2023-01-08     25.2
      10         2023-01-04        2023-01-05       NA
      11         2023-01-10        2023-01-13       NA
      12         2023-01-04        2023-01-07     25.2

