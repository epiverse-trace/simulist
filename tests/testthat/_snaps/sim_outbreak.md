# sim_outbreak works as expected

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
      $linelist
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
      
      $contacts
                              from                        to age sex
      1                Damion Hamm         Ignacio Hernandez  43   m
      2                Damion Hamm            Bryce Donnelly   1   m
      3          Ignacio Hernandez             Ashlan Krause  29   f
      4          Ignacio Hernandez             David Arrieta  78   m
      5             Bryce Donnelly Kristina Vazquez Pallares  22   f
      6             Bryce Donnelly         Morgan Vermillion  70   m
      7             Bryce Donnelly          Nusaiba el-Farah  28   f
      8              David Arrieta               Ryanna Hart  37   f
      9  Kristina Vazquez Pallares               Shan Klutke  61   f
      10          Nusaiba el-Farah    Dominic Kills In Sight  46   m
      11          Nusaiba el-Farah              Violet Watts  67   f
      12          Nusaiba el-Farah       Khristopher Cunniff  86   m
      13    Dominic Kills In Sight              Tyler Kelley  71   m
      14    Dominic Kills In Sight             Janayva Allen  51   f
      15    Dominic Kills In Sight          Sheldon Martinez  44   m
      16              Violet Watts             Lien Saldanha  49   f
      17       Khristopher Cunniff               Paige Reich  60   f
      18       Khristopher Cunniff           Brianna Pollard  56   f
      19       Khristopher Cunniff           Jackson Carlson  49   m
      20       Khristopher Cunniff      Raynaldo Santistevan  50   m
      21               Paige Reich           Cassandra Smith   7   f
         date_first_contact date_last_contact was_case           status
      1          2022-12-30        2023-01-05        Y             case
      2          2022-12-30        2023-01-02        Y             case
      3          2022-12-27        2023-01-03        N   under_followup
      4          2022-12-29        2023-01-02        Y             case
      5          2023-01-01        2023-01-03        Y             case
      6          2022-12-30        2023-01-02        N   under_followup
      7          2023-01-03        2023-01-04        Y             case
      8          2023-01-06        2023-01-06        N lost_to_followup
      9          2023-01-01        2023-01-05        N   under_followup
      10         2023-01-04        2023-01-05        Y             case
      11         2023-01-01        2023-01-04        Y             case
      12         2022-12-31        2023-01-03        Y             case
      13         2022-12-28        2023-01-05        N   under_followup
      14         2023-01-01        2023-01-04        N   under_followup
      15         2023-01-02        2023-01-05        N lost_to_followup
      16         2023-01-02        2023-01-03        N   under_followup
      17         2022-12-30        2023-01-03        Y             case
      18         2023-01-06        2023-01-09        N lost_to_followup
      19         2023-01-01        2023-01-04        Y             case
      20         2023-01-01        2023-01-03        N          unknown
      21         2023-01-01        2023-01-03        Y             case
      

# sim_outbreak works as expected with add_names = FALSE

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_names = FALSE)
    Output
      $linelist
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
      
      $contacts
                           from                        to age sex date_first_contact
      1            John Sheldon    Abdul Maalik al-Sarwar  43   m         2022-12-30
      2            John Sheldon                Jeffrey Le   1   m         2022-12-30
      3  Abdul Maalik al-Sarwar             Taylor Graves  29   f         2022-12-27
      4  Abdul Maalik al-Sarwar             Grayson Black  78   m         2022-12-29
      5              Jeffrey Le             Carolyn Moore  22   f         2023-01-01
      6              Jeffrey Le              Tyler Kelley  70   m         2022-12-30
      7              Jeffrey Le         Cheyenne Sayavong  28   f         2023-01-03
      8           Grayson Black         Mercedes Lovelace  37   f         2023-01-06
      9           Carolyn Moore Chantelle Vazquez-Luevano  61   f         2023-01-01
      10      Cheyenne Sayavong           Jackson Carlson  46   m         2023-01-04
      11      Cheyenne Sayavong                 Kendra To  67   f         2023-01-01
      12      Cheyenne Sayavong           Rushdi al-Bahri  86   m         2022-12-31
      13        Jackson Carlson          Bassaam el-Laham  71   m         2022-12-28
      14        Jackson Carlson               Megan Hayes  51   f         2023-01-01
      15        Jackson Carlson          John Khanthavong  44   m         2023-01-02
      16              Kendra To         Amanda Larochelle  49   f         2023-01-02
      17        Rushdi al-Bahri         Dominique Raymond  60   f         2022-12-30
      18        Rushdi al-Bahri            Natalie Newton  56   f         2023-01-06
      19        Rushdi al-Bahri          Qaaid al-Chahine  49   m         2023-01-01
      20        Rushdi al-Bahri     Abdul Kader el-Jabour  50   m         2023-01-01
      21      Dominique Raymond             Susana Varela   7   f         2023-01-01
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
      

# sim_outbreak works as expected with age-strat risks

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
      $linelist
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
      
      $contacts
                        from                    to age sex date_first_contact
      1   David Garcia Mayen   Rory Kills In Sight  43   m         2022-12-30
      2   David Garcia Mayen      Sheldon Martinez   1   m         2022-12-30
      3  Rory Kills In Sight       Violet Harrison  29   f         2022-12-27
      4  Rory Kills In Sight         Bryce Cunniff  78   m         2022-12-29
      5     Sheldon Martinez        Lien Whitworth  22   f         2023-01-01
      6     Sheldon Martinez    Khristopher Kelley  70   m         2022-12-30
      7     Sheldon Martinez         Tiffany Weiss  28   f         2023-01-03
      8        Bryce Cunniff  Caroline Hergenreter  37   f         2023-01-06
      9       Lien Whitworth    Cassandra Sayavong  61   f         2023-01-01
      10       Tiffany Weiss    Cleatus Kacprowicz  46   m         2023-01-04
      11       Tiffany Weiss          Taylor Moore  67   f         2023-01-01
      12       Tiffany Weiss         Tyler Carlson  86   m         2022-12-31
      13  Cleatus Kacprowicz       Raynaldo Abeyta  71   m         2022-12-28
      14  Cleatus Kacprowicz       Carolyn Raymond  51   f         2023-01-01
      15  Cleatus Kacprowicz        Jelani Sheldon  44   m         2023-01-02
      16        Taylor Moore           Harleigh To  49   f         2023-01-02
      17       Tyler Carlson      Grayson Lovelace  60   f         2022-12-30
      18       Tyler Carlson Angel Vazquez-Luevano  56   f         2023-01-06
      19       Tyler Carlson Abdul Maalik al-Ishak  49   m         2023-01-01
      20       Tyler Carlson             Joewid Le  50   m         2023-01-01
      21    Grayson Lovelace         Kendra Newton   7   f         2023-01-01
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-02        Y             case
      3         2023-01-03        N lost_to_followup
      4         2023-01-02        Y             case
      5         2023-01-03        Y             case
      6         2023-01-02        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-06        N lost_to_followup
      9         2023-01-05        N          unknown
      10        2023-01-05        Y             case
      11        2023-01-04        Y             case
      12        2023-01-03        Y             case
      13        2023-01-05        N   under_followup
      14        2023-01-04        N   under_followup
      15        2023-01-05        N   under_followup
      16        2023-01-03        N   under_followup
      17        2023-01-03        Y             case
      18        2023-01-09        N lost_to_followup
      19        2023-01-04        Y             case
      20        2023-01-03        N   under_followup
      21        2023-01-03        Y             case
      

# sim_outbreak works as expected with age structure

    Code
      sim_outbreak(contact_distribution = contact_distribution, infect_period = infect_period,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
      $linelist
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
      
      $contacts
                      from                to age sex date_first_contact
      1         Mark Beard   Brian Mccracken  13   m         2022-12-30
      2         Mark Beard     Jesus Garduno  22   m         2022-12-30
      3    Brian Mccracken    Alivia Estrada   5   f         2022-12-27
      4    Brian Mccracken   Taalib al-Naqvi  85   m         2022-12-29
      5      Jesus Garduno       Kelly Geist  41   f         2023-01-01
      6      Jesus Garduno      Umar al-Basa   2   m         2022-12-30
      7      Jesus Garduno    Madison Krause  89   f         2023-01-03
      8    Taalib al-Naqvi  Mawhiba al-Bilal  86   f         2023-01-06
      9        Kelly Geist    Destiny Bailey  82   f         2023-01-01
      10    Madison Krause   Jonathon Lujano  69   m         2023-01-04
      11    Madison Krause      Ashlan Allen  23   f         2023-01-01
      12    Madison Krause Dhaahir el-Hariri   9   m         2022-12-31
      13   Jonathon Lujano      Andres Garza  79   m         2022-12-28
      14   Jonathon Lujano     Nicole Wright  29   f         2023-01-01
      15   Jonathon Lujano         Raj Ament   4   m         2023-01-02
      16      Ashlan Allen    Turfa el-Farah  13   f         2023-01-02
      17 Dhaahir el-Hariri       Korren Hart  62   f         2022-12-30
      18 Dhaahir el-Hariri       Shan Klutke  24   f         2023-01-06
      19 Dhaahir el-Hariri        Isaac Huff  52   m         2023-01-01
      20 Dhaahir el-Hariri    Darienne Knost  74   m         2023-01-01
      21       Korren Hart      Ryanna Watts  76   f         2023-01-01
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-02        Y             case
      3         2023-01-03        N   under_followup
      4         2023-01-02        Y             case
      5         2023-01-03        Y             case
      6         2023-01-02        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-06        N lost_to_followup
      9         2023-01-05        N   under_followup
      10        2023-01-05        Y             case
      11        2023-01-04        Y             case
      12        2023-01-03        Y             case
      13        2023-01-05        N   under_followup
      14        2023-01-04        N   under_followup
      15        2023-01-05        N lost_to_followup
      16        2023-01-03        N   under_followup
      17        2023-01-03        Y             case
      18        2023-01-09        N lost_to_followup
      19        2023-01-04        Y             case
      20        2023-01-03        N          unknown
      21        2023-01-03        Y             case
      

