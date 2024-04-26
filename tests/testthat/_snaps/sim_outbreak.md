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
      

# sim_outbreak works as expected with anonymised

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
      $linelist
         id  case_name case_type sex age date_onset date_admission   outcome
      1   1 ng7AzDS6oX confirmed   m  35 2023-01-01           <NA> recovered
      2   2 fHuaqm1SzN  probable   m  43 2023-01-01           <NA> recovered
      3   3 bO5h4yEtT6 confirmed   m   1 2023-01-01           <NA> recovered
      4   5 a8e6yKFNmy suspected   m  78 2023-01-01           <NA> recovered
      5   6 dPL7XeZaLT  probable   f  22 2023-01-01           <NA> recovered
      6   8 TLkhw9tYeb confirmed   f  28 2023-01-01           <NA> recovered
      7  11 WQihvSfYVA confirmed   m  46 2023-01-01     2023-01-13 recovered
      8  12 RDjDafq8m2 confirmed   f  67 2023-01-01           <NA> recovered
      9  13 zbFUJRewLY confirmed   m  86 2023-01-01     2023-01-01      died
      10 18 VV4dJ6ZKaU confirmed   f  60 2023-01-02           <NA> recovered
      11 20 fVJ5ftN2GN suspected   m  49 2023-01-02           <NA> recovered
      12 22 ERhwf5kY6K confirmed   f   7 2023-01-02     2023-01-02 recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>     25.8
      2          <NA>         2022-12-30        2023-01-05       NA
      3          <NA>         2022-12-30        2023-01-02     25.8
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03       NA
      6          <NA>         2023-01-03        2023-01-04     25.8
      7          <NA>         2023-01-04        2023-01-05     25.8
      8          <NA>         2023-01-01        2023-01-04     25.8
      9    2023-01-12         2022-12-31        2023-01-03     25.8
      10         <NA>         2022-12-30        2023-01-03     25.8
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     25.8
      
      $contacts
               from         to age sex date_first_contact date_last_contact was_case
      1  ng7AzDS6oX fHuaqm1SzN  43   m         2022-12-30        2023-01-05        Y
      2  ng7AzDS6oX bO5h4yEtT6   1   m         2022-12-30        2023-01-02        Y
      3  fHuaqm1SzN tejRt34oCb  29   f         2022-12-27        2023-01-03        N
      4  fHuaqm1SzN a8e6yKFNmy  78   m         2022-12-29        2023-01-02        Y
      5  bO5h4yEtT6 dPL7XeZaLT  22   f         2023-01-01        2023-01-03        Y
      6  bO5h4yEtT6 mhWsVUBVWY  70   m         2022-12-30        2023-01-02        N
      7  bO5h4yEtT6 TLkhw9tYeb  28   f         2023-01-03        2023-01-04        Y
      8  a8e6yKFNmy 1elczXnmE3  37   f         2023-01-06        2023-01-06        N
      9  dPL7XeZaLT U4HDzSVgVA  61   f         2023-01-01        2023-01-05        N
      10 TLkhw9tYeb WQihvSfYVA  46   m         2023-01-04        2023-01-05        Y
      11 TLkhw9tYeb RDjDafq8m2  67   f         2023-01-01        2023-01-04        Y
      12 TLkhw9tYeb zbFUJRewLY  86   m         2022-12-31        2023-01-03        Y
      13 WQihvSfYVA tBBlIdUTzm  71   m         2022-12-28        2023-01-05        N
      14 WQihvSfYVA cTo9HLY9VZ  51   f         2023-01-01        2023-01-04        N
      15 WQihvSfYVA dzuuT3p6Kx  44   m         2023-01-02        2023-01-05        N
      16 RDjDafq8m2 uczwJ3WvUc  49   f         2023-01-02        2023-01-03        N
      17 zbFUJRewLY VV4dJ6ZKaU  60   f         2022-12-30        2023-01-03        Y
      18 zbFUJRewLY Kvu5Ak6RZk  56   f         2023-01-06        2023-01-09        N
      19 zbFUJRewLY fVJ5ftN2GN  49   m         2023-01-01        2023-01-04        Y
      20 zbFUJRewLY kk2uuqi2rY  50   m         2023-01-01        2023-01-03        N
      21 VV4dJ6ZKaU ERhwf5kY6K   7   f         2023-01-01        2023-01-03        Y
                   status
      1              case
      2              case
      3  lost_to_followup
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
      15 lost_to_followup
      16 lost_to_followup
      17             case
      18   under_followup
      19             case
      20 lost_to_followup
      21             case
      

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
      

