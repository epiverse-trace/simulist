# sim_outbreak works as expected

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
      $linelist
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
      
      $contacts
                      from                to age sex date_first_contact
      1   Isaiah Patterson      Michael John  43   m         2022-12-30
      2   Isaiah Patterson    Lorenzo Gaynor   1   m         2022-12-30
      3       Michael John      Alyssa Davis  29   f         2022-12-27
      4       Michael John      Cass Milburn  78   m         2022-12-29
      5     Lorenzo Gaynor         Hope Cobb  22   f         2023-01-01
      6     Lorenzo Gaynor    Donald Simmons  70   m         2022-12-30
      7     Lorenzo Gaynor     Wyona Lenahan  28   f         2023-01-03
      8       Cass Milburn      Jasra al-Dib  37   f         2023-01-06
      9          Hope Cobb    Courtney Senff  61   f         2023-01-01
      10     Wyona Lenahan    Bishr al-Jamil  46   m         2023-01-04
      11     Wyona Lenahan  Viviana Martinez  67   f         2023-01-01
      12     Wyona Lenahan Mudrik al-Youssef  86   m         2022-12-31
      13    Bishr al-Jamil  Jareer al-Hallal  71   m         2022-12-28
      14    Bishr al-Jamil   Jennifer Nguyen  51   f         2023-01-01
      15    Bishr al-Jamil     Hector Abeyta  44   m         2023-01-02
      16  Viviana Martinez     Chandra Musil  49   f         2023-01-02
      17 Mudrik al-Youssef      Kylie Rieger  60   f         2022-12-30
      18 Mudrik al-Youssef  Alexandra Arshad  56   f         2023-01-06
      19 Mudrik al-Youssef   Vincent Edwards  49   m         2023-01-01
      20 Mudrik al-Youssef    Avery Johnston  50   m         2023-01-01
      21      Kylie Rieger      Michiyo Hong   7   f         2023-01-01
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-02        Y             case
      3         2023-01-03        N   under_followup
      4         2023-01-02        Y             case
      5         2023-01-03        Y             case
      6         2023-01-02        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-06        N          unknown
      9         2023-01-05        N lost_to_followup
      10        2023-01-05        Y             case
      11        2023-01-04        Y             case
      12        2023-01-03        Y             case
      13        2023-01-05        N lost_to_followup
      14        2023-01-04        N          unknown
      15        2023-01-05        N          unknown
      16        2023-01-03        N   under_followup
      17        2023-01-03        Y             case
      18        2023-01-09        N   under_followup
      19        2023-01-04        Y             case
      20        2023-01-03        N   under_followup
      21        2023-01-03        Y             case
      

# sim_outbreak works as expected with add_names = FALSE

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_names = FALSE)
    Output
      $linelist
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
      
      $contacts
                        from                      to age sex date_first_contact
      1  Christopher Chaffin            Kevin Cooper  43   m         2022-12-30
      2  Christopher Chaffin       Austin Loughridge   1   m         2022-12-30
      3         Kevin Cooper           Michiyo Smith  29   f         2022-12-27
      4         Kevin Cooper         Khaleel el-Huda  78   m         2022-12-29
      5    Austin Loughridge       Samantha Gonzalez  22   f         2023-01-01
      6    Austin Loughridge       Benjamin Mcdonald  70   m         2022-12-30
      7    Austin Loughridge           Tea Slaughter  28   f         2023-01-03
      8      Khaleel el-Huda            Audreon Hill  37   f         2023-01-06
      9    Samantha Gonzalez        Dieu Linh Batara  61   f         2023-01-01
      10       Tea Slaughter       Travis Montgomery  46   m         2023-01-04
      11       Tea Slaughter         Hishma el-Hamid  67   f         2023-01-01
      12       Tea Slaughter           Jose Gonzales  86   m         2022-12-31
      13   Travis Montgomery            Efren Abeyta  71   m         2022-12-28
      14   Travis Montgomery        Giovana Quintero  51   f         2023-01-01
      15   Travis Montgomery       Zayyaan el-Radwan  44   m         2023-01-02
      16     Hishma el-Hamid       Kiona Fitzsimmons  49   f         2023-01-02
      17       Jose Gonzales         Danita Anderson  60   f         2022-12-30
      18       Jose Gonzales          Arwa el-Moussa  56   f         2023-01-06
      19       Jose Gonzales Enrique Salas Dominguez  49   m         2023-01-01
      20       Jose Gonzales            Charles Graf  50   m         2023-01-01
      21     Danita Anderson         Cheyenne Miller   7   f         2023-01-01
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-02        Y             case
      3         2023-01-03        N lost_to_followup
      4         2023-01-02        Y             case
      5         2023-01-03        Y             case
      6         2023-01-02        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-06        N   under_followup
      9         2023-01-05        N   under_followup
      10        2023-01-05        Y             case
      11        2023-01-04        Y             case
      12        2023-01-03        Y             case
      13        2023-01-05        N          unknown
      14        2023-01-04        N lost_to_followup
      15        2023-01-05        N lost_to_followup
      16        2023-01-03        N          unknown
      17        2023-01-03        Y             case
      18        2023-01-09        N          unknown
      19        2023-01-04        Y             case
      20        2023-01-03        N   under_followup
      21        2023-01-03        Y             case
      

# sim_outbreak works as expected with age-strat risks

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
      $linelist
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
      
      $contacts
                       from                      to age sex date_first_contact
      1       Donald Childs           Michael Duran  43   m         2022-12-30
      2       Donald Childs               Cass Root   1   m         2022-12-30
      3       Michael Duran        Kaitlynne Rieger  29   f         2022-12-27
      4       Michael Duran        Mudrik al-Hallal  78   m         2022-12-29
      5           Cass Root            Erika Sierra  22   f         2023-01-01
      6           Cass Root         Jareer al-Safar  70   m         2022-12-30
      7           Cass Root           Jennifer Hong  28   f         2023-01-03
      8    Mudrik al-Hallal        Kaitlin Gonzalez  37   f         2023-01-06
      9        Erika Sierra       Marissa Slaughter  61   f         2023-01-01
      10      Jennifer Hong         Raashid el-Huda  46   m         2023-01-04
      11      Jennifer Hong           Kayla Johnson  67   f         2023-01-01
      12      Jennifer Hong      Dominic Montgomery  86   m         2022-12-31
      13    Raashid el-Huda          Lorenzo Gaynor  71   m         2022-12-28
      14    Raashid el-Huda            Michiyo Tran  51   f         2023-01-01
      15    Raashid el-Huda          Avery Johnston  44   m         2023-01-02
      16      Kayla Johnson Marzooqa el-Abdelrahman  49   f         2023-01-02
      17 Dominic Montgomery         Giovana Segarra  60   f         2022-12-30
      18 Dominic Montgomery       Kaylie Shangreaux  56   f         2023-01-06
      19 Dominic Montgomery         Vincent Edwards  49   m         2023-01-01
      20 Dominic Montgomery             Ethan Black  50   m         2023-01-01
      21    Giovana Segarra             Kiona Dalke   7   f         2023-01-01
         date_last_contact was_case         status
      1         2023-01-05        Y           case
      2         2023-01-02        Y           case
      3         2023-01-03        N under_followup
      4         2023-01-02        Y           case
      5         2023-01-03        Y           case
      6         2023-01-02        N under_followup
      7         2023-01-04        Y           case
      8         2023-01-06        N under_followup
      9         2023-01-05        N under_followup
      10        2023-01-05        Y           case
      11        2023-01-04        Y           case
      12        2023-01-03        Y           case
      13        2023-01-05        N under_followup
      14        2023-01-04        N under_followup
      15        2023-01-05        N under_followup
      16        2023-01-03        N under_followup
      17        2023-01-03        Y           case
      18        2023-01-09        N        unknown
      19        2023-01-04        Y           case
      20        2023-01-03        N under_followup
      21        2023-01-03        Y           case
      

# sim_outbreak works as expected with age structure

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
      $linelist
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
      
      $contacts
                       from                     to age sex date_first_contact
      1  Ghaamid el-Ishmael       Faatih el-Kaiser  13   m         2022-12-30
      2  Ghaamid el-Ishmael       Brandon Galligan  22   m         2022-12-30
      3    Faatih el-Kaiser Carisa Flores-Gonzalez   5   f         2022-12-27
      4    Faatih el-Kaiser          Aiman el-Riaz  85   m         2022-12-29
      5    Brandon Galligan         Katelyn Catlin  41   f         2023-01-01
      6    Brandon Galligan        Wajdi al-Demian   2   m         2022-12-30
      7    Brandon Galligan           Lynsey Duron  89   f         2023-01-03
      8       Aiman el-Riaz        Amaani al-Gaber  86   f         2023-01-06
      9      Katelyn Catlin         Lilibeth Black  82   f         2023-01-01
      10       Lynsey Duron          Travis Foster  69   m         2023-01-04
      11       Lynsey Duron           Jacy Cousins  23   f         2023-01-01
      12       Lynsey Duron            Khoa Murray   9   m         2022-12-31
      13      Travis Foster          Raaid el-Diab  79   m         2022-12-28
      14      Travis Foster       Marquaja Johnson  29   f         2023-01-01
      15      Travis Foster      Mubarak el-Vaziri   4   m         2023-01-02
      16       Jacy Cousins            Kayla Tudor  13   f         2023-01-02
      17        Khoa Murray         Maria Eberhart  62   f         2022-12-30
      18        Khoa Murray            Katja Muetz  24   f         2023-01-06
      19        Khoa Murray            John Flores  52   m         2023-01-01
      20        Khoa Murray             Bryce Sena  74   m         2023-01-01
      21     Maria Eberhart            Erin Payson  76   f         2023-01-01
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-02        Y             case
      3         2023-01-03        N   under_followup
      4         2023-01-02        Y             case
      5         2023-01-03        Y             case
      6         2023-01-02        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-06        N   under_followup
      9         2023-01-05        N          unknown
      10        2023-01-05        Y             case
      11        2023-01-04        Y             case
      12        2023-01-03        Y             case
      13        2023-01-05        N   under_followup
      14        2023-01-04        N lost_to_followup
      15        2023-01-05        N lost_to_followup
      16        2023-01-03        N   under_followup
      17        2023-01-03        Y             case
      18        2023-01-09        N lost_to_followup
      19        2023-01-04        Y             case
      20        2023-01-03        N   under_followup
      21        2023-01-03        Y             case
      

