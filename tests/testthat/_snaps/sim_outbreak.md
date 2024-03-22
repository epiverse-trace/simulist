# sim_outbreak works as expected

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
      $linelist
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
      
      $contacts
                       from                   to age sex date_first_contact
      1      Joshua Esparza          Victor Sisk  51   m         2022-12-30
      2      Joshua Esparza       Alyshah Atkins  44   f         2023-01-01
      3      Alyshah Atkins       Rifat al-Mussa  49   m         2023-01-02
      4      Alyshah Atkins     Aaliyah Mascotti  60   f         2023-01-04
      5      Alyshah Atkins        Silbret Locks  56   f         2022-12-29
      6      Rifat al-Mussa Alyssa Yohe-Ironwing  49   f         2023-01-03
      7      Rifat al-Mussa   Zachery Miramontes  50   m         2023-01-02
      8      Rifat al-Mussa            Ryan Zahn   7   m         2023-01-03
      9      Rifat al-Mussa     Sofia Lara Gomez  20   f         2023-01-02
      10     Rifat al-Mussa      Bruce Hishinuma  24   m         2023-01-02
      11     Rifat al-Mussa         Lucas Tafoya  51   m         2023-01-03
      12 Zachery Miramontes      Dennison Duvall  53   m         2023-01-02
      13 Zachery Miramontes          Luis Torres  16   m         2023-01-02
      14    Bruce Hishinuma           Mary Silva  83   f         2023-01-07
      15    Bruce Hishinuma         Sage Thielke   2   f         2023-01-02
      16    Bruce Hishinuma     Stephany Botello  48   f         2023-01-03
      17    Dennison Duvall      Rebecca Jenkins  65   f         2023-01-04
      18         Mary Silva        Kaylin Casner  44   f         2023-01-03
      19         Mary Silva       Zameel el-Saab  77   m         2023-01-03
      20         Mary Silva   Zane Coronado-Romo  90   m         2023-01-03
      21         Mary Silva        Taylor Hendon  66   m         2023-01-07
      22       Sage Thielke     Sulama al-Farman  19   f         2023-01-04
      23   Stephany Botello     Raymundo Ramirez  17   m         2022-12-29
      24   Stephany Botello       Chengleng Chun  34   m         2023-01-03
      25      Taylor Hendon   Courtney Fackelman  75   f         2022-12-31
         date_last_contact was_case           status
      1         2023-01-03        N   under_followup
      2         2023-01-02        Y             case
      3         2023-01-05        Y             case
      4         2023-01-07        N   under_followup
      5         2023-01-06        N          unknown
      6         2023-01-06        N lost_to_followup
      7         2023-01-05        Y             case
      8         2023-01-04        Y             case
      9         2023-01-06        N   under_followup
      10        2023-01-05        Y             case
      11        2023-01-06        N   under_followup
      12        2023-01-04        Y             case
      13        2023-01-04        N lost_to_followup
      14        2023-01-10        Y             case
      15        2023-01-05        Y             case
      16        2023-01-04        Y             case
      17        2023-01-04        N   under_followup
      18        2023-01-06        N lost_to_followup
      19        2023-01-09        N   under_followup
      20        2023-01-06        N   under_followup
      21        2023-01-10        Y             case
      22        2023-01-07        N   under_followup
      23        2023-01-05        N   under_followup
      24        2023-01-06        Y             case
      25        2023-01-04        N   under_followup
      

# sim_outbreak works as expected with add_names = FALSE

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_names = FALSE)
    Output
      $linelist
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
      
      $contacts
                          from                           to age sex
      1           Justin White                Alan Vallejos  51   m
      2           Justin White                 Courtney Fox  44   f
      3           Courtney Fox               Laosa Sayavong  49   m
      4           Courtney Fox Jacqueline Aguilera-Aguilera  60   f
      5           Courtney Fox              Wafaaa el-Hoque  56   f
      6         Laosa Sayavong                Melanie Gomez  49   f
      7         Laosa Sayavong                    Victor To  50   m
      8         Laosa Sayavong                  Zana Newton   7   m
      9         Laosa Sayavong                 Selena Lisle  20   f
      10        Laosa Sayavong              Damon Wolfchief  24   m
      11        Laosa Sayavong             Javonte Harrison  51   m
      12             Victor To             Nathaniel Gradoz  53   m
      13             Victor To             Geovanni Montoya  16   m
      14       Damon Wolfchief             Rayyana al-Mousa  83   f
      15       Damon Wolfchief        Quashaya Mbasi-Botuli   2   f
      16       Damon Wolfchief                 Jensen Ortiz  48   f
      17      Nathaniel Gradoz                 Kiana Czajka  65   f
      18      Rayyana al-Mousa               Natalie Montez  44   f
      19      Rayyana al-Mousa              Orran Curtis IV  77   m
      20      Rayyana al-Mousa               Geoffrey Smith  90   m
      21      Rayyana al-Mousa              Hamad al-Masood  66   m
      22 Quashaya Mbasi-Botuli               Linda Williams  19   f
      23          Jensen Ortiz                  Jesse Weiss  17   m
      24          Jensen Ortiz             Dustin Carpenter  34   m
      25       Hamad al-Masood                   Asia Owens  75   f
         date_first_contact date_last_contact was_case           status
      1          2022-12-30        2023-01-03        N lost_to_followup
      2          2023-01-01        2023-01-02        Y             case
      3          2023-01-02        2023-01-05        Y             case
      4          2023-01-04        2023-01-07        N          unknown
      5          2022-12-29        2023-01-06        N   under_followup
      6          2023-01-03        2023-01-06        N lost_to_followup
      7          2023-01-02        2023-01-05        Y             case
      8          2023-01-03        2023-01-04        Y             case
      9          2023-01-02        2023-01-06        N          unknown
      10         2023-01-02        2023-01-05        Y             case
      11         2023-01-03        2023-01-06        N          unknown
      12         2023-01-02        2023-01-04        Y             case
      13         2023-01-02        2023-01-04        N   under_followup
      14         2023-01-07        2023-01-10        Y             case
      15         2023-01-02        2023-01-05        Y             case
      16         2023-01-03        2023-01-04        Y             case
      17         2023-01-04        2023-01-04        N   under_followup
      18         2023-01-03        2023-01-06        N          unknown
      19         2023-01-03        2023-01-09        N   under_followup
      20         2023-01-03        2023-01-06        N          unknown
      21         2023-01-07        2023-01-10        Y             case
      22         2023-01-04        2023-01-07        N   under_followup
      23         2022-12-29        2023-01-05        N   under_followup
      24         2023-01-03        2023-01-06        Y             case
      25         2022-12-31        2023-01-04        N   under_followup
      

# sim_outbreak works as expected with age-strat risks

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
      $linelist
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
      
      $contacts
                       from                     to age sex date_first_contact
      1      Sean Depoyster         Carlos Bingham  51   m         2022-12-30
      2      Sean Depoyster       Selena Hernandez  44   f         2023-01-01
      3    Selena Hernandez        Khairi al-Gaber  49   m         2023-01-02
      4    Selena Hernandez       Naseema al-Mousa  60   f         2023-01-04
      5    Selena Hernandez          Kristin Owens  56   f         2022-12-29
      6     Khairi al-Gaber           Jensen Ortiz  49   f         2023-01-03
      7     Khairi al-Gaber        Braxton Lindsey  50   m         2023-01-02
      8     Khairi al-Gaber          Albert Nguyen   7   m         2023-01-03
      9     Khairi al-Gaber     Ceara Rivera Munoz  20   f         2023-01-02
      10    Khairi al-Gaber          Keili Ketchum  24   m         2023-01-02
      11    Khairi al-Gaber       Johnathan Catlin  51   m         2023-01-03
      12    Braxton Lindsey      Daniel Hemsouvanh  53   m         2023-01-02
      13    Braxton Lindsey           Aaron Todman  16   m         2023-01-02
      14      Keili Ketchum         Natalie Montez  83   f         2023-01-07
      15      Keili Ketchum        Morgan Williams   2   f         2023-01-02
      16      Keili Ketchum     Briana Greene-King  48   f         2023-01-03
      17  Daniel Hemsouvanh         Iliana Vasquez  65   f         2023-01-04
      18     Natalie Montez            Heaven Ford  44   f         2023-01-03
      19     Natalie Montez     Trey-Logan Russell  77   m         2023-01-03
      20     Natalie Montez              Jonel Jin  90   m         2023-01-03
      21     Natalie Montez         Dominick Maker  66   m         2023-01-07
      22    Morgan Williams        Kylee Koskovich  19   f         2023-01-04
      23 Briana Greene-King Francisco Huerta Lopez  17   m         2022-12-29
      24 Briana Greene-King          Carl Levi Lee  34   m         2023-01-03
      25     Dominick Maker          Alexa Jackson  75   f         2022-12-31
         date_last_contact was_case           status
      1         2023-01-03        N lost_to_followup
      2         2023-01-02        Y             case
      3         2023-01-05        Y             case
      4         2023-01-07        N   under_followup
      5         2023-01-06        N   under_followup
      6         2023-01-06        N   under_followup
      7         2023-01-05        Y             case
      8         2023-01-04        Y             case
      9         2023-01-06        N   under_followup
      10        2023-01-05        Y             case
      11        2023-01-06        N   under_followup
      12        2023-01-04        Y             case
      13        2023-01-04        N lost_to_followup
      14        2023-01-10        Y             case
      15        2023-01-05        Y             case
      16        2023-01-04        Y             case
      17        2023-01-04        N   under_followup
      18        2023-01-06        N   under_followup
      19        2023-01-09        N   under_followup
      20        2023-01-06        N   under_followup
      21        2023-01-10        Y             case
      22        2023-01-07        N   under_followup
      23        2023-01-05        N   under_followup
      24        2023-01-06        Y             case
      25        2023-01-04        N   under_followup
      

# sim_outbreak works as expected with age structure

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
      $linelist
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
      
      $contacts
                      from                     to age sex date_first_contact
      1         Cass Jumbo         Donald Lohrenz  62   m         2022-12-30
      2         Cass Jumbo         Stephanie Park  24   f         2023-01-01
      3     Stephanie Park        Joseph Orlowske  52   m         2023-01-02
      4     Stephanie Park Brialle Carrillo-Loera  74   f         2023-01-04
      5     Stephanie Park          Hailey Miller  76   f         2022-12-29
      6    Joseph Orlowske       Hamna el-Chahine  26   f         2023-01-03
      7    Joseph Orlowske        Hunter Saunders  25   m         2023-01-02
      8    Joseph Orlowske           Anthony Carr  69   m         2023-01-03
      9    Joseph Orlowske          Alexis Garcia  53   f         2023-01-02
      10   Joseph Orlowske      Thaamir al-Masood  19   m         2023-01-02
      11   Joseph Orlowske     Jaarallah el-Elbaz  49   m         2023-01-03
      12   Hunter Saunders        Riyaal al-Samra  68   m         2023-01-02
      13   Hunter Saunders            Jose Galvan  82   m         2023-01-02
      14 Thaamir al-Masood        Emily Rodriguez  84   f         2023-01-07
      15 Thaamir al-Masood         Allyson Browne  79   f         2023-01-02
      16 Thaamir al-Masood        Aneesa al-Malak   5   f         2023-01-03
      17   Riyaal al-Samra        Faseeha el-Riaz  78   f         2023-01-04
      18   Emily Rodriguez       Alexandria Marez  85   f         2023-01-03
      19   Emily Rodriguez             Dante Hill  36   m         2023-01-03
      20   Emily Rodriguez   Benjamin Stuart Rasi  62   m         2023-01-03
      21   Emily Rodriguez         Jonah Sterling  66   m         2023-01-07
      22    Allyson Browne           Tia Williams  43   f         2023-01-04
      23   Aneesa al-Malak           Charles Agee  61   m         2022-12-29
      24   Aneesa al-Malak          Michael Lopez  26   m         2023-01-03
      25    Jonah Sterling         Najlaa el-Dada  81   f         2022-12-31
         date_last_contact was_case           status
      1         2023-01-03        N   under_followup
      2         2023-01-02        Y             case
      3         2023-01-05        Y             case
      4         2023-01-07        N   under_followup
      5         2023-01-06        N          unknown
      6         2023-01-06        N   under_followup
      7         2023-01-05        Y             case
      8         2023-01-04        Y             case
      9         2023-01-06        N   under_followup
      10        2023-01-05        Y             case
      11        2023-01-06        N   under_followup
      12        2023-01-04        Y             case
      13        2023-01-04        N   under_followup
      14        2023-01-10        Y             case
      15        2023-01-05        Y             case
      16        2023-01-04        Y             case
      17        2023-01-04        N lost_to_followup
      18        2023-01-06        N   under_followup
      19        2023-01-09        N   under_followup
      20        2023-01-06        N   under_followup
      21        2023-01-10        Y             case
      22        2023-01-07        N lost_to_followup
      23        2023-01-05        N lost_to_followup
      24        2023-01-06        Y             case
      25        2023-01-04        N   under_followup
      

