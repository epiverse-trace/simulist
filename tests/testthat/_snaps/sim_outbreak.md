# sim_outbreak works as expected

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
      $linelist
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
      
      $contacts
                           from                       to age sex date_first_contact
      1         Dominic Sundara       Preston Montgomery  43   m         2022-12-30
      2         Dominic Sundara            Reece Chittum   1   m         2022-12-30
      3      Preston Montgomery               Kayla Hill  29   f         2022-12-27
      4      Preston Montgomery            Michael Cheek  78   m         2022-12-29
      5           Reece Chittum           Jennifer Smith  22   f         2023-01-01
      6           Reece Chittum            Jaylyn Childs  70   m         2022-12-30
      7           Reece Chittum           Erika Quintero  28   f         2023-01-03
      8           Michael Cheek        Kelly Fitzsimmons  37   f         2023-01-06
      9          Jennifer Smith          Audreon Starkey  61   f         2023-01-01
      10         Erika Quintero         Isaiah Patterson  46   m         2023-01-04
      11         Erika Quintero          Cicely Anderson  67   f         2023-01-01
      12         Erika Quintero             Michael John  86   m         2022-12-31
      13       Isaiah Patterson          Muneeb al-Jamil  71   m         2022-12-28
      14       Isaiah Patterson Juwairiya el-Abdelrahman  51   f         2023-01-01
      15       Isaiah Patterson         Bishr al-Youssef  44   m         2023-01-02
      16        Cicely Anderson        Samantha Gonzalez  49   f         2023-01-02
      17           Michael John   Giovana Magana Aguirre  60   f         2022-12-30
      18           Michael John           Michiyo Batara  56   f         2023-01-06
      19           Michael John         Mudrik al-Hallal  49   m         2023-01-01
      20           Michael John         Dominic Gonzales  50   m         2023-01-01
      21 Giovana Magana Aguirre            Tea Slaughter   7   f         2023-01-01
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
      

# sim_outbreak works as expected with add_names = FALSE

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_names = FALSE)
    Output
      $linelist
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
      
      $contacts
                        from                  to age sex date_first_contact
      1           Jonah Hord    Benjamin Flowers  43   m         2022-12-30
      2           Jonah Hord         Rito Cooper   1   m         2022-12-30
      3     Benjamin Flowers        Claire Hicks  29   f         2022-12-27
      4     Benjamin Flowers   Jeremy Loughridge  78   m         2022-12-29
      5          Rito Cooper         Ashwini Ali  22   f         2023-01-01
      6          Rito Cooper          Rory Jumbo  70   m         2022-12-30
      7          Rito Cooper       Danielle Kuhn  28   f         2023-01-03
      8    Jeremy Loughridge     Gicell Cisneros  37   f         2023-01-06
      9          Ashwini Ali       Lauren Nguyen  61   f         2023-01-01
      10       Danielle Kuhn    Thaamir al-Amini  46   m         2023-01-04
      11       Danielle Kuhn         Selena Chun  67   f         2023-01-01
      12       Danielle Kuhn Charles Stuart Rasi  86   m         2022-12-31
      13    Thaamir al-Amini        Jose Hurtado  71   m         2022-12-28
      14    Thaamir al-Amini      Brianne Shahid  51   f         2023-01-01
      15    Thaamir al-Amini        Efren Armijo  44   m         2023-01-02
      16         Selena Chun    Juanita Martinez  49   f         2023-01-02
      17 Charles Stuart Rasi       Hannah Bodnar  60   f         2022-12-30
      18 Charles Stuart Rasi    Kifaaya el-Ameen  56   f         2023-01-06
      19 Charles Stuart Rasi       Enrique Ponce  49   m         2023-01-01
      20 Charles Stuart Rasi Jaarallah al-Masood  50   m         2023-01-01
      21       Hannah Bodnar        Ashley Isaac   7   f         2023-01-01
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
      13        2023-01-05        N        unknown
      14        2023-01-04        N under_followup
      15        2023-01-05        N under_followup
      16        2023-01-03        N under_followup
      17        2023-01-03        Y           case
      18        2023-01-09        N under_followup
      19        2023-01-04        Y           case
      20        2023-01-03        N        unknown
      21        2023-01-03        Y           case
      

# sim_outbreak works as expected with age-strat risks

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
      $linelist
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
      
      $contacts
                     from                      to age sex date_first_contact
      1        Cass Duran        Mudrik al-Hallal  43   m         2022-12-30
      2        Cass Duran         Jareer al-Safar   1   m         2022-12-30
      3  Mudrik al-Hallal        Kaitlynne Rieger  29   f         2022-12-27
      4  Mudrik al-Hallal         Raashid el-Huda  78   m         2022-12-29
      5   Jareer al-Safar            Erika Sierra  22   f         2023-01-01
      6   Jareer al-Safar          Preston Huerta  70   m         2022-12-30
      7   Jareer al-Safar           Jennifer Hong  28   f         2023-01-03
      8   Raashid el-Huda        Kaitlin Gonzalez  37   f         2023-01-06
      9      Erika Sierra       Marissa Slaughter  61   f         2023-01-01
      10    Jennifer Hong           Donald Childs  46   m         2023-01-04
      11    Jennifer Hong           Kayla Johnson  67   f         2023-01-01
      12    Jennifer Hong          Avery Johnston  86   m         2022-12-31
      13    Donald Childs          Lorenzo Gaynor  71   m         2022-12-28
      14    Donald Childs            Michiyo Tran  51   f         2023-01-01
      15    Donald Childs             Ethan Black  44   m         2023-01-02
      16    Kayla Johnson Marzooqa el-Abdelrahman  49   f         2023-01-02
      17   Avery Johnston         Giovana Segarra  60   f         2022-12-30
      18   Avery Johnston       Kaylie Shangreaux  56   f         2023-01-06
      19   Avery Johnston             Donald Root  49   m         2023-01-01
      20   Avery Johnston          Hunter Simmons  50   m         2023-01-01
      21  Giovana Segarra             Kiona Dalke   7   f         2023-01-01
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
      
      $contacts
                       from                     to age sex date_first_contact
      1          Kyle Crane     Ghaamid el-Ishmael  13   m         2022-12-30
      2          Kyle Crane       Faatih el-Kaiser  22   m         2022-12-30
      3  Ghaamid el-Ishmael Carisa Flores-Gonzalez   5   f         2022-12-27
      4  Ghaamid el-Ishmael       Va'Aahi Galligan  85   m         2022-12-29
      5    Faatih el-Kaiser         Katelyn Catlin  41   f         2023-01-01
      6    Faatih el-Kaiser          Aiman el-Riaz   2   m         2022-12-30
      7    Faatih el-Kaiser           Lynsey Duron  89   f         2023-01-03
      8    Va'Aahi Galligan        Amaani al-Gaber  86   f         2023-01-06
      9      Katelyn Catlin         Lilibeth Black  82   f         2023-01-01
      10       Lynsey Duron        Wajdi al-Demian  69   m         2023-01-04
      11       Lynsey Duron           Jacy Cousins  23   f         2023-01-01
      12       Lynsey Duron          Travis Foster   9   m         2022-12-31
      13    Wajdi al-Demian         Raymond Murray  79   m         2022-12-28
      14    Wajdi al-Demian       Marquaja Johnson  29   f         2023-01-01
      15    Wajdi al-Demian          Raaid el-Diab   4   m         2023-01-02
      16       Jacy Cousins            Kayla Tudor  13   f         2023-01-02
      17      Travis Foster         Maria Eberhart  62   f         2022-12-30
      18      Travis Foster            Katja Muetz  24   f         2023-01-06
      19      Travis Foster      Mubarak el-Vaziri  52   m         2023-01-01
      20      Travis Foster     Alexandre Guerrero  74   m         2023-01-01
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
      

