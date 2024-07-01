# sim_outbreak works as expected

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
      $linelist
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
      
      $contacts
                     from                     to age sex date_first_contact
      1   Wajdi al-Demian          Raaid el-Diab  43   m         2022-12-30
      2   Wajdi al-Demian         Nickolas Nault   1   m         2022-12-30
      3     Raaid el-Diab            Durine Cobb  29   f         2022-12-27
      4     Raaid el-Diab            Hee Kennedy  78   m         2022-12-29
      5    Nickolas Nault            Hope Arshad  22   f         2023-01-01
      6    Nickolas Nault      Mubarak el-Vaziri  70   m         2022-12-30
      7    Nickolas Nault         Shanta Holiday  28   f         2023-01-03
      8       Hee Kennedy           Darian Guyon  37   f         2023-01-06
      9       Hope Arshad          Mackenzie Ahn  61   f         2023-01-01
      10   Shanta Holiday       Raakaan al-Shams  46   m         2023-01-04
      11   Shanta Holiday         Chandra Kilian  67   f         2023-01-01
      12   Shanta Holiday        Ricardo Sanchez  86   m         2022-12-31
      13 Raakaan al-Shams         Tae Woo Nguyen  71   m         2022-12-28
      14 Raakaan al-Shams       Mikhaila Carlson  51   f         2023-01-01
      15 Raakaan al-Shams         Alexander Orio  44   m         2023-01-02
      16   Chandra Kilian      Alexandra Johnson  49   f         2023-01-02
      17  Ricardo Sanchez          Kanani Nguyen  60   f         2022-12-30
      18  Ricardo Sanchez Nirvana Elizalde Villa  56   f         2023-01-06
      19  Ricardo Sanchez         Jared Chambers  49   m         2023-01-01
      20  Ricardo Sanchez         Thomas Morales  50   m         2023-01-01
      21    Kanani Nguyen           Annie Carter   7   f         2023-01-01
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-02        Y             case
      3         2023-01-03        N   under_followup
      4         2023-01-02        Y             case
      5         2023-01-03        Y             case
      6         2023-01-02        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-06        N   under_followup
      9         2023-01-05        N lost_to_followup
      10        2023-01-05        Y             case
      11        2023-01-04        Y             case
      12        2023-01-03        Y             case
      13        2023-01-05        N lost_to_followup
      14        2023-01-04        N   under_followup
      15        2023-01-05        N   under_followup
      16        2023-01-03        N   under_followup
      17        2023-01-03        Y             case
      18        2023-01-09        N          unknown
      19        2023-01-04        Y             case
      20        2023-01-03        N lost_to_followup
      21        2023-01-03        Y             case
      

# sim_outbreak works as expected with anonymised

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
      $linelist
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
      
      $contacts
               from         to age sex date_first_contact date_last_contact was_case
      1  qKY39Zyiuu oY8Kxng7Az  43   m         2022-12-30        2023-01-05        Y
      2  qKY39Zyiuu DS6oXfHuaq   1   m         2022-12-30        2023-01-02        Y
      3  oY8Kxng7Az m1SzNbO5h4  29   f         2022-12-27        2023-01-03        N
      4  oY8Kxng7Az yEtT6tejRt  78   m         2022-12-29        2023-01-02        Y
      5  DS6oXfHuaq 34oCba8e6y  22   f         2023-01-01        2023-01-03        Y
      6  DS6oXfHuaq KFNmydPL7X  70   m         2022-12-30        2023-01-02        N
      7  DS6oXfHuaq eZaLTmhWsV  28   f         2023-01-03        2023-01-04        Y
      8  yEtT6tejRt UBVWYTLkhw  37   f         2023-01-06        2023-01-06        N
      9  34oCba8e6y 9tYeb1elcz  61   f         2023-01-01        2023-01-05        N
      10 eZaLTmhWsV XnmE3U4HDz  46   m         2023-01-04        2023-01-05        Y
      11 eZaLTmhWsV SVgVAWQihv  67   f         2023-01-01        2023-01-04        Y
      12 eZaLTmhWsV SfYVARDjDa  86   m         2022-12-31        2023-01-03        Y
      13 XnmE3U4HDz fq8m2zbFUJ  71   m         2022-12-28        2023-01-05        N
      14 XnmE3U4HDz RewLYtBBlI  51   f         2023-01-01        2023-01-04        N
      15 XnmE3U4HDz dUTzmcTo9H  44   m         2023-01-02        2023-01-05        N
      16 SVgVAWQihv LY9VZdzuuT  49   f         2023-01-02        2023-01-03        N
      17 SfYVARDjDa 3p6KxuczwJ  60   f         2022-12-30        2023-01-03        Y
      18 SfYVARDjDa 3WvUcVV4dJ  56   f         2023-01-06        2023-01-09        N
      19 SfYVARDjDa 6ZKaUKvu5A  49   m         2023-01-01        2023-01-04        Y
      20 SfYVARDjDa k6RZkfVJ5f  50   m         2023-01-01        2023-01-03        N
      21 3p6KxuczwJ tN2GNkk2uu   7   f         2023-01-01        2023-01-03        Y
                   status
      1              case
      2              case
      3    under_followup
      4              case
      5              case
      6  lost_to_followup
      7              case
      8    under_followup
      9    under_followup
      10             case
      11             case
      12             case
      13   under_followup
      14          unknown
      15   under_followup
      16   under_followup
      17             case
      18   under_followup
      19             case
      20   under_followup
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
      
      $contacts
                       from                     to age sex date_first_contact
      1          Kyle Crane     Ghaamid el-Ishmael  43   m         2022-12-30
      2          Kyle Crane       Faatih el-Kaiser   1   m         2022-12-30
      3  Ghaamid el-Ishmael Carisa Flores-Gonzalez  29   f         2022-12-27
      4  Ghaamid el-Ishmael       Va'Aahi Galligan  78   m         2022-12-29
      5    Faatih el-Kaiser         Katelyn Catlin  22   f         2023-01-01
      6    Faatih el-Kaiser          Aiman el-Riaz  70   m         2022-12-30
      7    Faatih el-Kaiser           Lynsey Duron  28   f         2023-01-03
      8    Va'Aahi Galligan        Amaani al-Gaber  37   f         2023-01-06
      9      Katelyn Catlin         Lilibeth Black  61   f         2023-01-01
      10       Lynsey Duron        Wajdi al-Demian  46   m         2023-01-04
      11       Lynsey Duron           Jacy Cousins  67   f         2023-01-01
      12       Lynsey Duron          Travis Foster  86   m         2022-12-31
      13    Wajdi al-Demian         Raymond Murray  71   m         2022-12-28
      14    Wajdi al-Demian       Marquaja Johnson  51   f         2023-01-01
      15    Wajdi al-Demian          Raaid el-Diab  44   m         2023-01-02
      16       Jacy Cousins            Kayla Tudor  49   f         2023-01-02
      17      Travis Foster         Maria Eberhart  60   f         2022-12-30
      18      Travis Foster            Katja Muetz  56   f         2023-01-06
      19      Travis Foster      Mubarak el-Vaziri  49   m         2023-01-01
      20      Travis Foster     Alexandre Guerrero  50   m         2023-01-01
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
      
      $contacts
                       from                        to age sex date_first_contact
      1       Gabriel Black              Tyler Kelley  13   m         2022-12-30
      2       Gabriel Black              Cody Morales  22   m         2022-12-30
      3        Tyler Kelley             Taylor Graves   5   f         2022-12-27
      4        Tyler Kelley                 Joewid Le  85   m         2022-12-29
      5        Cody Morales             Carolyn Moore  41   f         2023-01-01
      6        Cody Morales           Rushdi al-Ishak   2   m         2022-12-30
      7        Cody Morales         Cheyenne Sayavong  89   f         2023-01-03
      8           Joewid Le         Mercedes Lovelace  86   f         2023-01-06
      9       Carolyn Moore Chantelle Vazquez-Luevano  82   f         2023-01-01
      10  Cheyenne Sayavong        Pierce Khanthavong  69   m         2023-01-04
      11  Cheyenne Sayavong                 Kendra To  23   f         2023-01-01
      12  Cheyenne Sayavong         Preston Barringer   9   m         2022-12-31
      13 Pierce Khanthavong           Jackson Carlson  79   m         2022-12-28
      14 Pierce Khanthavong               Megan Hayes  29   f         2023-01-01
      15 Pierce Khanthavong               Sam Spencer   4   m         2023-01-02
      16          Kendra To         Amanda Larochelle  13   f         2023-01-02
      17  Preston Barringer         Dominique Raymond  62   f         2022-12-30
      18  Preston Barringer            Natalie Newton  24   f         2023-01-06
      19  Preston Barringer          Bassaam el-Majid  52   m         2023-01-01
      20  Preston Barringer           Qaaid al-Madani  74   m         2023-01-01
      21  Dominique Raymond             Susana Varela  76   f         2023-01-01
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
      

