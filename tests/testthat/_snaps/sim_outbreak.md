# sim_outbreak works as expected

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
      $linelist
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
      
      $contacts
                       from                        to age sex date_first_contact
      1       Gabriel Black              Tyler Kelley  43   m         2022-12-30
      2       Gabriel Black              Cody Morales   1   m         2022-12-30
      3        Tyler Kelley             Taylor Graves  29   f         2022-12-27
      4        Tyler Kelley                 Joewid Le  78   m         2022-12-29
      5        Cody Morales             Carolyn Moore  22   f         2023-01-01
      6        Cody Morales           Rushdi al-Ishak  70   m         2022-12-30
      7        Cody Morales         Cheyenne Sayavong  28   f         2023-01-03
      8           Joewid Le         Mercedes Lovelace  37   f         2023-01-06
      9       Carolyn Moore Chantelle Vazquez-Luevano  61   f         2023-01-01
      10  Cheyenne Sayavong        Pierce Khanthavong  46   m         2023-01-04
      11  Cheyenne Sayavong                 Kendra To  67   f         2023-01-01
      12  Cheyenne Sayavong         Preston Barringer  86   m         2022-12-31
      13 Pierce Khanthavong           Jackson Carlson  71   m         2022-12-28
      14 Pierce Khanthavong               Megan Hayes  51   f         2023-01-01
      15 Pierce Khanthavong               Sam Spencer  44   m         2023-01-02
      16          Kendra To         Amanda Larochelle  49   f         2023-01-02
      17  Preston Barringer         Dominique Raymond  60   f         2022-12-30
      18  Preston Barringer            Natalie Newton  56   f         2023-01-06
      19  Preston Barringer          Bassaam el-Majid  49   m         2023-01-01
      20  Preston Barringer           Qaaid al-Madani  50   m         2023-01-01
      21  Dominique Raymond             Susana Varela   7   f         2023-01-01
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
      

# sim_outbreak works as expected with add_names = FALSE

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_names = FALSE)
    Output
      $linelist
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
      8         2023-01-06        N          unknown
      9         2023-01-05        N   under_followup
      10        2023-01-05        Y             case
      11        2023-01-04        Y             case
      12        2023-01-03        Y             case
      13        2023-01-05        N lost_to_followup
      14        2023-01-04        N lost_to_followup
      15        2023-01-05        N   under_followup
      16        2023-01-03        N lost_to_followup
      17        2023-01-03        Y             case
      18        2023-01-09        N   under_followup
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
      
      $contacts
                      from                     to age sex date_first_contact
      1  Micheal Smallwood            Kyle Foster  43   m         2022-12-30
      2  Micheal Smallwood      Ghaamid el-Kaiser   1   m         2022-12-30
      3        Kyle Foster            Durine Cobb  29   f         2022-12-27
      4        Kyle Foster         Faatih el-Riaz  78   m         2022-12-29
      5  Ghaamid el-Kaiser            Hope Arshad  22   f         2023-01-01
      6  Ghaamid el-Kaiser     Jonathan Takahashi  70   m         2022-12-30
      7  Ghaamid el-Kaiser         Shanta Holiday  28   f         2023-01-03
      8     Faatih el-Riaz           Darian Guyon  37   f         2023-01-06
      9        Hope Arshad          Mackenzie Ahn  61   f         2023-01-01
      10    Shanta Holiday        Aiman al-Demian  46   m         2023-01-04
      11    Shanta Holiday         Chandra Kilian  67   f         2023-01-01
      12    Shanta Holiday          Wajdi el-Diab  86   m         2022-12-31
      13   Aiman al-Demian         Travis Summers  71   m         2022-12-28
      14   Aiman al-Demian       Mikhaila Carlson  51   f         2023-01-01
      15   Aiman al-Demian          Cory Galligan  44   m         2023-01-02
      16    Chandra Kilian      Alexandra Johnson  49   f         2023-01-02
      17     Wajdi el-Diab          Kanani Nguyen  60   f         2022-12-30
      18     Wajdi el-Diab Nirvana Elizalde Villa  56   f         2023-01-06
      19     Wajdi el-Diab        Raaid el-Vaziri  49   m         2023-01-01
      20     Wajdi el-Diab       Mubarak al-Shams  50   m         2023-01-01
      21     Kanani Nguyen           Annie Carter   7   f         2023-01-01
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
      

# sim_outbreak works as expected with age structure

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
      $linelist
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
      
      $contacts
                     from                      to age sex date_first_contact
      1         Gene Than        Caleb Fredericks  13   m         2022-12-30
      2         Gene Than         Jaisean Venable  22   m         2022-12-30
      3  Caleb Fredericks        Mawhiba al-Mussa   5   f         2022-12-27
      4  Caleb Fredericks            Taylor Swift  85   m         2022-12-29
      5   Jaisean Venable           Korren Bailey  41   f         2023-01-01
      6   Jaisean Venable       Mustaba al-Sarwar   2   m         2022-12-30
      7   Jaisean Venable            Madison Zahn  89   f         2023-01-03
      8      Taylor Swift            Nicole Perez  86   f         2023-01-06
      9     Korren Bailey           Turfa el-Saab  82   f         2023-01-01
      10     Madison Zahn           Dustin Bellow  69   m         2023-01-04
      11     Madison Zahn             Ryanna Hart  23   f         2023-01-01
      12     Madison Zahn           Rafael Garcia   9   m         2022-12-31
      13    Dustin Bellow           Adrien Leduke  79   m         2022-12-28
      14    Dustin Bellow             Shan Klutke  29   f         2023-01-01
      15    Dustin Bellow Dennison Kills In Sight   4   m         2023-01-02
      16      Ryanna Hart            Violet Watts  13   f         2023-01-02
      17    Rafael Garcia           Ashlan Hendon  62   f         2022-12-30
      18    Rafael Garcia           Lien Saldanha  24   f         2023-01-06
      19    Rafael Garcia           Tieran Moorer  52   m         2023-01-01
      20    Rafael Garcia          Michael Chavez  74   m         2023-01-01
      21    Ashlan Hendon             Paige Reich  76   f         2023-01-01
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
      13        2023-01-05        N   under_followup
      14        2023-01-04        N   under_followup
      15        2023-01-05        N   under_followup
      16        2023-01-03        N lost_to_followup
      17        2023-01-03        Y             case
      18        2023-01-09        N   under_followup
      19        2023-01-04        Y             case
      20        2023-01-03        N   under_followup
      21        2023-01-03        Y             case
      

