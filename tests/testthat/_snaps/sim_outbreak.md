# sim_outbreak works as expected

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
      $linelist
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
      
      $contacts
                      from                        to age sex date_first_contact
      1    Rushdi al-Ishak                Jeffrey Le  43   m         2022-12-30
      2    Rushdi al-Ishak         Dominic Barringer   1   m         2022-12-30
      3         Jeffrey Le             Taylor Graves  29   f         2022-12-27
      4         Jeffrey Le              Tyler Kelley  78   m         2022-12-29
      5  Dominic Barringer             Carolyn Moore  22   f         2023-01-01
      6  Dominic Barringer           Jackson Carlson  70   m         2022-12-30
      7  Dominic Barringer         Cheyenne Sayavong  28   f         2023-01-03
      8       Tyler Kelley         Mercedes Lovelace  37   f         2023-01-06
      9      Carolyn Moore Chantelle Vazquez-Luevano  61   f         2023-01-01
      10 Cheyenne Sayavong          Bassaam el-Majid  46   m         2023-01-04
      11 Cheyenne Sayavong                 Kendra To  67   f         2023-01-01
      12 Cheyenne Sayavong           Qaaid al-Madani  86   m         2022-12-31
      13  Bassaam el-Majid          John Khanthavong  71   m         2022-12-28
      14  Bassaam el-Majid               Megan Hayes  51   f         2023-01-01
      15  Bassaam el-Majid     Abdul Kader el-Jabour  44   m         2023-01-02
      16         Kendra To         Amanda Larochelle  49   f         2023-01-02
      17   Qaaid al-Madani         Dominique Raymond  60   f         2022-12-30
      18   Qaaid al-Madani            Natalie Newton  56   f         2023-01-06
      19   Qaaid al-Madani        Abdul Noor el-Syed  49   m         2023-01-01
      20   Qaaid al-Madani               Sam Spencer  50   m         2023-01-01
      21 Dominique Raymond             Susana Varela   7   f         2023-01-01
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-02        Y             case
      3         2023-01-03        N          unknown
      4         2023-01-02        Y             case
      5         2023-01-03        Y             case
      6         2023-01-02        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-06        N   under_followup
      9         2023-01-05        N   under_followup
      10        2023-01-05        Y             case
      11        2023-01-04        Y             case
      12        2023-01-03        Y             case
      13        2023-01-05        N   under_followup
      14        2023-01-04        N lost_to_followup
      15        2023-01-05        N   under_followup
      16        2023-01-03        N   under_followup
      17        2023-01-03        Y             case
      18        2023-01-09        N          unknown
      19        2023-01-04        Y             case
      20        2023-01-03        N   under_followup
      21        2023-01-03        Y             case
      

# sim_outbreak works as expected with anonymised

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
      $linelist
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
      
      $contacts
               from         to age sex date_first_contact date_last_contact was_case
      1  1ePRI5wC1I Ji3IItv5Ov  43   m         2022-12-30        2023-01-05        Y
      2  1ePRI5wC1I sRrRMCAJFE   1   m         2022-12-30        2023-01-02        Y
      3  Ji3IItv5Ov Y3qKY39Zyi  29   f         2022-12-27        2023-01-03        N
      4  Ji3IItv5Ov uuoY8Kxng7  78   m         2022-12-29        2023-01-02        Y
      5  sRrRMCAJFE AzDS6oXfHu  22   f         2023-01-01        2023-01-03        Y
      6  sRrRMCAJFE aqm1SzNbO5  70   m         2022-12-30        2023-01-02        N
      7  sRrRMCAJFE h4yEtT6tej  28   f         2023-01-03        2023-01-04        Y
      8  uuoY8Kxng7 Rt34oCba8e  37   f         2023-01-06        2023-01-06        N
      9  AzDS6oXfHu 6yKFNmydPL  61   f         2023-01-01        2023-01-05        N
      10 h4yEtT6tej 7XeZaLTmhW  46   m         2023-01-04        2023-01-05        Y
      11 h4yEtT6tej sVUBVWYTLk  67   f         2023-01-01        2023-01-04        Y
      12 h4yEtT6tej hw9tYeb1el  86   m         2022-12-31        2023-01-03        Y
      13 7XeZaLTmhW czXnmE3U4H  71   m         2022-12-28        2023-01-05        N
      14 7XeZaLTmhW DzSVgVAWQi  51   f         2023-01-01        2023-01-04        N
      15 7XeZaLTmhW hvSfYVARDj  44   m         2023-01-02        2023-01-05        N
      16 sVUBVWYTLk Dafq8m2zbF  49   f         2023-01-02        2023-01-03        N
      17 hw9tYeb1el UJRewLYtBB  60   f         2022-12-30        2023-01-03        Y
      18 hw9tYeb1el lIdUTzmcTo  56   f         2023-01-06        2023-01-09        N
      19 hw9tYeb1el 9HLY9VZdzu  49   m         2023-01-01        2023-01-04        Y
      20 hw9tYeb1el uT3p6Kxucz  50   m         2023-01-01        2023-01-03        N
      21 UJRewLYtBB wJ3WvUcVV4   7   f         2023-01-01        2023-01-03        Y
                   status
      1              case
      2              case
      3    under_followup
      4              case
      5              case
      6    under_followup
      7              case
      8    under_followup
      9    under_followup
      10             case
      11             case
      12             case
      13   under_followup
      14 lost_to_followup
      15   under_followup
      16   under_followup
      17             case
      18          unknown
      19             case
      20 lost_to_followup
      21             case
      

# sim_outbreak works as expected with age-strat risks

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
      $linelist
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
      
      $contacts
                       from                     to age sex date_first_contact
      1  Ghaamid el-Ishmael       Faatih el-Kaiser  43   m         2022-12-30
      2  Ghaamid el-Ishmael       Brandon Galligan   1   m         2022-12-30
      3    Faatih el-Kaiser Carisa Flores-Gonzalez  29   f         2022-12-27
      4    Faatih el-Kaiser          Aiman el-Riaz  78   m         2022-12-29
      5    Brandon Galligan         Katelyn Catlin  22   f         2023-01-01
      6    Brandon Galligan        Wajdi al-Demian  70   m         2022-12-30
      7    Brandon Galligan           Lynsey Duron  28   f         2023-01-03
      8       Aiman el-Riaz        Amaani al-Gaber  37   f         2023-01-06
      9      Katelyn Catlin         Lilibeth Black  61   f         2023-01-01
      10       Lynsey Duron          Travis Foster  46   m         2023-01-04
      11       Lynsey Duron           Jacy Cousins  67   f         2023-01-01
      12       Lynsey Duron            Khoa Murray  86   m         2022-12-31
      13      Travis Foster          Raaid el-Diab  71   m         2022-12-28
      14      Travis Foster       Marquaja Johnson  51   f         2023-01-01
      15      Travis Foster      Mubarak el-Vaziri  44   m         2023-01-02
      16       Jacy Cousins            Kayla Tudor  49   f         2023-01-02
      17        Khoa Murray         Maria Eberhart  60   f         2022-12-30
      18        Khoa Murray            Katja Muetz  56   f         2023-01-06
      19        Khoa Murray            John Flores  49   m         2023-01-01
      20        Khoa Murray             Bryce Sena  50   m         2023-01-01
      21     Maria Eberhart            Erin Payson   7   f         2023-01-01
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
      

# sim_outbreak works as expected with age structure

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
      $linelist
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
      
      $contacts
                         from                        to age sex date_first_contact
      1         Bryce Cunniff      Ignacio Garcia Mayen  13   m         2022-12-30
      2         Bryce Cunniff          Dominic Martinez  22   m         2022-12-30
      3  Ignacio Garcia Mayen          Grayson Anderson   5   f         2022-12-27
      4  Ignacio Garcia Mayen        Sheldon Kacprowicz  85   m         2022-12-29
      5      Dominic Martinez      Caroline Hergenreter  41   f         2023-01-01
      6      Dominic Martinez        Khristopher Kelley   2   m         2022-12-30
      7      Dominic Martinez       Cassandra Whitworth  89   f         2023-01-03
      8    Sheldon Kacprowicz             Taylor Graves  86   f         2023-01-06
      9  Caroline Hergenreter             Carolyn Moore  82   f         2023-01-01
      10  Cassandra Whitworth             Tyler Carlson  69   m         2023-01-04
      11  Cassandra Whitworth         Harleigh Sayavong  23   f         2023-01-01
      12  Cassandra Whitworth             Cleatus Black   9   m         2022-12-31
      13        Tyler Carlson           Jackson Spencer  79   m         2022-12-28
      14        Tyler Carlson          Candace Lovelace  29   f         2023-01-01
      15        Tyler Carlson              David Abeyta   4   m         2023-01-02
      16    Harleigh Sayavong Chantelle Vazquez-Luevano  13   f         2023-01-02
      17        Cleatus Black                 Kendra To  62   f         2022-12-30
      18        Cleatus Black          Megan Riggenbach  24   f         2023-01-06
      19        Cleatus Black                 Jelani Le  52   m         2023-01-01
      20        Cleatus Black         Rushdi al-Chahine  74   m         2023-01-01
      21            Kendra To             Amanda Kaiser  76   f         2023-01-01
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-02        Y             case
      3         2023-01-03        N          unknown
      4         2023-01-02        Y             case
      5         2023-01-03        Y             case
      6         2023-01-02        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-06        N   under_followup
      9         2023-01-05        N   under_followup
      10        2023-01-05        Y             case
      11        2023-01-04        Y             case
      12        2023-01-03        Y             case
      13        2023-01-05        N   under_followup
      14        2023-01-04        N lost_to_followup
      15        2023-01-05        N   under_followup
      16        2023-01-03        N   under_followup
      17        2023-01-03        Y             case
      18        2023-01-09        N          unknown
      19        2023-01-04        Y             case
      20        2023-01-03        N   under_followup
      21        2023-01-03        Y             case
      

