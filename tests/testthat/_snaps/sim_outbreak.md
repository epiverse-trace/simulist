# sim_outbreak works as expected

    Code
      sim_outbreak(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
      $linelist
         id           case_name case_type sex age date_onset date_admission
      1   1    Macella Moreland confirmed   f  28 2023-01-01           <NA>
      2   2      Kayla Ellerman confirmed   f  62 2023-01-02     2023-01-02
      3   5 Matthew Biggerstaff confirmed   m  42 2023-01-02           <NA>
      4   6   Vanessa Sihombing  probable   f  60 2023-01-03           <NA>
      5   8     Ross Mcclintock suspected   m  28 2023-01-03     2023-01-05
      6   9     Danielle Medero confirmed   f  78 2023-01-03           <NA>
      7  10      Suhaa el-Saidi suspected   f  31 2023-01-07     2023-01-19
      8  16       Jakeob Wisham suspected   m  33 2023-01-04           <NA>
      9  19   Shaahir el-Younis suspected   m  86 2023-01-04           <NA>
      10 22     Arianna Bellomy confirmed   f  37 2023-01-05           <NA>
      11 23     Angela Thompson  probable   f  15 2023-01-05           <NA>
      12 25       Irvin Quezada suspected   m  81 2023-01-07     2023-01-08
      13 26        Ronald Bliss  probable   m  82 2023-01-08           <NA>
      14 27       Andrew Truong  probable   m  72 2023-01-09           <NA>
      15 30       Dawson Wagner confirmed   m  71 2023-01-12           <NA>
      16 31          Jacky Chen confirmed   m  50 2023-01-10           <NA>
      17 36          Dewi Smith confirmed   f   3 2023-01-10           <NA>
         date_death date_first_contact date_last_contact ct_value
      1        <NA>               <NA>              <NA>     23.6
      2        <NA>         2023-01-02        2023-01-05     23.6
      3        <NA>         2023-01-03        2023-01-04     23.6
      4        <NA>         2023-01-02        2023-01-04       NA
      5        <NA>         2023-01-02        2023-01-04       NA
      6        <NA>         2022-12-30        2023-01-05     23.6
      7        <NA>         2023-01-06        2023-01-09       NA
      8        <NA>         2023-01-04        2023-01-05       NA
      9        <NA>         2023-01-06        2023-01-07       NA
      10 2023-01-23         2023-01-06        2023-01-08     23.6
      11       <NA>         2023-01-07        2023-01-08       NA
      12       <NA>         2023-01-07        2023-01-08       NA
      13       <NA>         2023-01-07        2023-01-09       NA
      14       <NA>         2023-01-10        2023-01-11       NA
      15       <NA>         2023-01-11        2023-01-11     23.6
      16       <NA>         2023-01-08        2023-01-11     23.6
      17       <NA>         2023-01-12        2023-01-14     23.6
      
      $contacts
                        from                      to age sex date_first_contact
      1     Macella Moreland          Kayla Ellerman  62   f         2023-01-02
      2     Macella Moreland       Juwairiya al-Saah  20   f         2023-01-04
      3       Kayla Ellerman          Ubaida el-Meer  29   m         2023-01-05
      4       Kayla Ellerman     Matthew Biggerstaff  42   m         2023-01-03
      5       Kayla Ellerman       Vanessa Sihombing  60   f         2023-01-02
      6       Kayla Ellerman            Joslyn Smith  65   f         2022-12-31
      7  Matthew Biggerstaff         Ross Mcclintock  28   m         2023-01-02
      8  Matthew Biggerstaff         Danielle Medero  78   f         2022-12-30
      9    Vanessa Sihombing          Suhaa el-Saidi  31   f         2023-01-06
      10   Vanessa Sihombing           Ethan Lapitan  12   m         2023-01-04
      11   Vanessa Sihombing              Amanda Day  80   f         2023-01-03
      12     Ross Mcclintock         Breianna Colson  44   f         2022-12-30
      13     Ross Mcclintock Benjamin Yokota-Stroman  74   m         2023-01-01
      14     Ross Mcclintock           Austin Wilson  26   m         2023-01-07
      15     Ross Mcclintock           Jakeob Wisham  33   m         2023-01-04
      16     Ross Mcclintock         Victor Elizondo   4   m         2022-12-31
      17      Suhaa el-Saidi       Gustavo Hernandez  53   m         2023-01-06
      18       Jakeob Wisham       Shaahir el-Younis  86   m         2023-01-06
      19   Shaahir el-Younis         Chelsea Phoenix  89   f         2023-01-05
      20   Shaahir el-Younis         Kalina Siddiqui  24   f         2023-01-07
      21   Shaahir el-Younis         Arianna Bellomy  37   f         2023-01-06
      22     Arianna Bellomy         Angela Thompson  15   f         2023-01-07
      23     Angela Thompson             Daniel Pham  14   m         2023-01-06
      24     Angela Thompson           Irvin Quezada  81   m         2023-01-07
      25       Irvin Quezada            Ronald Bliss  82   m         2023-01-07
      26        Ronald Bliss           Andrew Truong  72   m         2023-01-10
      27        Ronald Bliss          Dillan Aguilar  53   m         2023-01-10
      28        Ronald Bliss            Andres Garza  56   m         2023-01-05
      29       Andrew Truong           Dawson Wagner  71   m         2023-01-11
      30       Andrew Truong              Jacky Chen  50   m         2023-01-08
      31       Andrew Truong          Ignacio Gentry  73   m         2023-01-07
      32       Andrew Truong              Tessa Yang  20   f         2023-01-08
      33       Dawson Wagner             Jair Garcia  75   m         2023-01-15
      34       Dawson Wagner             Monique Lau   2   f         2023-01-17
      35          Jacky Chen              Dewi Smith   3   f         2023-01-12
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-07        N   under_followup
      3         2023-01-08        N   under_followup
      4         2023-01-04        Y             case
      5         2023-01-04        Y             case
      6         2023-01-03        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-05        Y             case
      9         2023-01-09        Y             case
      10        2023-01-06        N   under_followup
      11        2023-01-05        N   under_followup
      12        2023-01-03        N   under_followup
      13        2023-01-05        N lost_to_followup
      14        2023-01-08        N lost_to_followup
      15        2023-01-05        Y             case
      16        2023-01-04        N   under_followup
      17        2023-01-09        N   under_followup
      18        2023-01-07        Y             case
      19        2023-01-06        N   under_followup
      20        2023-01-08        N   under_followup
      21        2023-01-08        Y             case
      22        2023-01-08        Y             case
      23        2023-01-08        N   under_followup
      24        2023-01-08        Y             case
      25        2023-01-09        Y             case
      26        2023-01-11        Y             case
      27        2023-01-13        N   under_followup
      28        2023-01-09        N   under_followup
      29        2023-01-11        Y             case
      30        2023-01-11        Y             case
      31        2023-01-12        N   under_followup
      32        2023-01-10        N   under_followup
      33        2023-01-15        N lost_to_followup
      34        2023-01-18        N   under_followup
      35        2023-01-14        Y             case
      

# sim_outbreak works as expected with add_names = FALSE

    Code
      sim_outbreak(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_names = FALSE)
    Output
      $linelist
         id case_type sex age date_onset date_admission date_death date_first_contact
      1   1 confirmed   f  28 2023-01-01           <NA>       <NA>               <NA>
      2   2 confirmed   f  62 2023-01-02     2023-01-02       <NA>         2023-01-02
      3   5  probable   m  42 2023-01-02           <NA>       <NA>         2023-01-03
      4   6 confirmed   f  60 2023-01-03           <NA>       <NA>         2023-01-02
      5   8 suspected   m  28 2023-01-03     2023-01-05       <NA>         2023-01-02
      6   9  probable   f  78 2023-01-03           <NA>       <NA>         2022-12-30
      7  10 confirmed   f  31 2023-01-07     2023-01-19       <NA>         2023-01-06
      8  16 confirmed   m  33 2023-01-04           <NA>       <NA>         2023-01-04
      9  19 confirmed   m  86 2023-01-04           <NA>       <NA>         2023-01-06
      10 22 suspected   f  37 2023-01-05           <NA> 2023-01-23         2023-01-06
      11 23 confirmed   f  15 2023-01-05           <NA>       <NA>         2023-01-07
      12 25  probable   m  81 2023-01-07     2023-01-08       <NA>         2023-01-07
      13 26  probable   m  82 2023-01-08           <NA>       <NA>         2023-01-07
      14 27 suspected   m  72 2023-01-09           <NA>       <NA>         2023-01-10
      15 30  probable   m  71 2023-01-12           <NA>       <NA>         2023-01-11
      16 31 confirmed   m  50 2023-01-10           <NA>       <NA>         2023-01-08
      17 36 suspected   f   3 2023-01-10           <NA>       <NA>         2023-01-12
         date_last_contact ct_value
      1               <NA>     25.7
      2         2023-01-05     25.7
      3         2023-01-04       NA
      4         2023-01-04     25.7
      5         2023-01-04       NA
      6         2023-01-05       NA
      7         2023-01-09     25.7
      8         2023-01-05     25.7
      9         2023-01-07     25.7
      10        2023-01-08       NA
      11        2023-01-08     25.7
      12        2023-01-08       NA
      13        2023-01-09       NA
      14        2023-01-11       NA
      15        2023-01-11       NA
      16        2023-01-11     25.7
      17        2023-01-14       NA
      
      $contacts
                       from                 to age sex date_first_contact
      1      Janae Gallegos Fat'hiyaa al-Ishak  62   f         2023-01-02
      2      Janae Gallegos      Rorie Wallace  20   f         2023-01-04
      3  Fat'hiyaa al-Ishak     Jose Archuleta  29   m         2023-01-05
      4  Fat'hiyaa al-Ishak  Jordan Mcclintock  42   m         2023-01-03
      5  Fat'hiyaa al-Ishak    Xeandra Watkins  60   f         2023-01-02
      6  Fat'hiyaa al-Ishak        Jenae Berhe  65   f         2022-12-31
      7   Jordan Mcclintock        Ranny Bajwa  28   m         2023-01-02
      8   Jordan Mcclintock         Ceara Pham  78   f         2022-12-30
      9     Xeandra Watkins       Sara Baldwin  31   f         2023-01-06
      10    Xeandra Watkins    Derek Pensoneau  12   m         2023-01-04
      11    Xeandra Watkins        Nikki Begay  80   f         2023-01-03
      12        Ranny Bajwa         Dewi Huynh  44   f         2022-12-30
      13        Ranny Bajwa     Luis Gutierrez  74   m         2023-01-01
      14        Ranny Bajwa       Kelvin Bliss  26   m         2023-01-07
      15        Ranny Bajwa        Matthew Som  33   m         2023-01-04
      16        Ranny Bajwa           Ian Hill   4   m         2022-12-31
      17       Sara Baldwin      Dakota Wagner  53   m         2023-01-06
      18        Matthew Som     Sean Kapushion  86   m         2023-01-06
      19     Sean Kapushion  Saranya Wiedmaier  89   f         2023-01-05
      20     Sean Kapushion         Han Mi Ngu  24   f         2023-01-07
      21     Sean Kapushion   Tenazia Whitaker  37   f         2023-01-06
      22   Tenazia Whitaker   Madeeha el-Nasir  15   f         2023-01-07
      23   Madeeha el-Nasir        Joseph John  14   m         2023-01-06
      24   Madeeha el-Nasir       Jacob Montez  81   m         2023-01-07
      25       Jacob Montez        Jonathan Li  82   m         2023-01-07
      26        Jonathan Li     Hamood el-Meer  72   m         2023-01-10
      27        Jonathan Li     Giovanni Smith  53   m         2023-01-10
      28        Jonathan Li         Atif Huynh  56   m         2023-01-05
      29     Hamood el-Meer        Jonah Mahan  71   m         2023-01-11
      30     Hamood el-Meer     Chandler Gasca  50   m         2023-01-08
      31     Hamood el-Meer    Geoffrey Wisham  73   m         2023-01-07
      32     Hamood el-Meer      Jazmyn Pillow  20   f         2023-01-08
      33        Jonah Mahan   Rafeeq el-Younis  75   m         2023-01-15
      34        Jonah Mahan      Savannah Hawk   2   f         2023-01-17
      35     Chandler Gasca         Anna Chase   3   f         2023-01-12
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-07        N lost_to_followup
      3         2023-01-08        N   under_followup
      4         2023-01-04        Y             case
      5         2023-01-04        Y             case
      6         2023-01-03        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-05        Y             case
      9         2023-01-09        Y             case
      10        2023-01-06        N   under_followup
      11        2023-01-05        N   under_followup
      12        2023-01-03        N   under_followup
      13        2023-01-05        N   under_followup
      14        2023-01-08        N   under_followup
      15        2023-01-05        Y             case
      16        2023-01-04        N   under_followup
      17        2023-01-09        N   under_followup
      18        2023-01-07        Y             case
      19        2023-01-06        N lost_to_followup
      20        2023-01-08        N   under_followup
      21        2023-01-08        Y             case
      22        2023-01-08        Y             case
      23        2023-01-08        N   under_followup
      24        2023-01-08        Y             case
      25        2023-01-09        Y             case
      26        2023-01-11        Y             case
      27        2023-01-13        N   under_followup
      28        2023-01-09        N   under_followup
      29        2023-01-11        Y             case
      30        2023-01-11        Y             case
      31        2023-01-12        N   under_followup
      32        2023-01-10        N lost_to_followup
      33        2023-01-15        N lost_to_followup
      34        2023-01-18        N lost_to_followup
      35        2023-01-14        Y             case
      

# sim_outbreak works as expected with age-strat risks

    Code
      sim_outbreak(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
      $linelist
         id        case_name case_type sex age date_onset date_admission date_death
      1   1  Rachael Sneesby confirmed   f  28 2023-01-01           <NA>       <NA>
      2   2       Nadia Hill confirmed   f  62 2023-01-02     2023-01-02 2023-01-07
      3   5   Jonathan Huynh  probable   m  42 2023-01-02           <NA>       <NA>
      4   6  Tharwa al-Amber  probable   f  60 2023-01-03           <NA>       <NA>
      5   8      Ian Sanchez suspected   m  28 2023-01-03           <NA>       <NA>
      6   9       Sadie Ross confirmed   f  78 2023-01-03           <NA>       <NA>
      7  10 Jordan Marquardt suspected   f  31 2023-01-07           <NA>       <NA>
      8  16       Joseph Sky suspected   m  33 2023-01-04           <NA>       <NA>
      9  19    Geoffrey Boon confirmed   m  86 2023-01-04           <NA>       <NA>
      10 22    Juyoung Sands suspected   f  37 2023-01-05           <NA>       <NA>
      11 23         Mya Hunt suspected   f  15 2023-01-05           <NA>       <NA>
      12 25     Josef Fortes  probable   m  81 2023-01-07     2023-01-08 2023-01-29
      13 26   Badri el-Hoque confirmed   m  82 2023-01-08           <NA>       <NA>
      14 27    William Jones  probable   m  72 2023-01-09           <NA>       <NA>
      15 30     Luis Arreola confirmed   m  71 2023-01-12           <NA>       <NA>
      16 31   Zachary Abeyta  probable   m  50 2023-01-10           <NA>       <NA>
      17 36  Shawnesse Smith suspected   f   3 2023-01-10           <NA>       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>     24.3
      2          2023-01-02        2023-01-05     24.3
      3          2023-01-03        2023-01-04       NA
      4          2023-01-02        2023-01-04       NA
      5          2023-01-02        2023-01-04       NA
      6          2022-12-30        2023-01-05     24.3
      7          2023-01-06        2023-01-09       NA
      8          2023-01-04        2023-01-05       NA
      9          2023-01-06        2023-01-07     24.3
      10         2023-01-06        2023-01-08       NA
      11         2023-01-07        2023-01-08       NA
      12         2023-01-07        2023-01-08       NA
      13         2023-01-07        2023-01-09     24.3
      14         2023-01-10        2023-01-11       NA
      15         2023-01-11        2023-01-11     24.3
      16         2023-01-08        2023-01-11       NA
      17         2023-01-12        2023-01-14       NA
      
      $contacts
                     from                       to age sex date_first_contact
      1   Rachael Sneesby               Nadia Hill  62   f         2023-01-02
      2   Rachael Sneesby             Diane Slaugh  20   f         2023-01-04
      3        Nadia Hill          Kelvin Poveromo  29   m         2023-01-05
      4        Nadia Hill           Jonathan Huynh  42   m         2023-01-03
      5        Nadia Hill          Tharwa al-Amber  60   f         2023-01-02
      6        Nadia Hill        Taaliba el-Habibi  65   f         2022-12-31
      7    Jonathan Huynh              Ian Sanchez  28   m         2023-01-02
      8    Jonathan Huynh               Sadie Ross  78   f         2022-12-30
      9   Tharwa al-Amber         Jordan Marquardt  31   f         2023-01-06
      10  Tharwa al-Amber           Jacob Martinez  12   m         2023-01-04
      11  Tharwa al-Amber          Melissa Salazar  80   f         2023-01-03
      12      Ian Sanchez     Larissa Garcia Perez  44   f         2022-12-30
      13      Ian Sanchez            Dakota Kremke  74   m         2023-01-01
      14      Ian Sanchez                Atif Jung  26   m         2023-01-07
      15      Ian Sanchez               Joseph Sky  33   m         2023-01-04
      16      Ian Sanchez              Sean Powell   4   m         2022-12-31
      17 Jordan Marquardt              Jonah Smith  53   m         2023-01-06
      18       Joseph Sky            Geoffrey Boon  86   m         2023-01-06
      19    Geoffrey Boon       Husniyya al-Zamani  89   f         2023-01-05
      20    Geoffrey Boon             Leona Torres  24   f         2023-01-07
      21    Geoffrey Boon            Juyoung Sands  37   f         2023-01-06
      22    Juyoung Sands                 Mya Hunt  15   f         2023-01-07
      23         Mya Hunt Chandler Saldana-Martine  14   m         2023-01-06
      24         Mya Hunt             Josef Fortes  81   m         2023-01-07
      25     Josef Fortes           Badri el-Hoque  82   m         2023-01-07
      26   Badri el-Hoque            William Jones  72   m         2023-01-10
      27   Badri el-Hoque                Ka Lok Le  53   m         2023-01-10
      28   Badri el-Hoque           Bryan Goodwine  56   m         2023-01-05
      29    William Jones             Luis Arreola  71   m         2023-01-11
      30    William Jones           Zachary Abeyta  50   m         2023-01-08
      31    William Jones           Naasif al-Sani  73   m         2023-01-07
      32    William Jones          Danielle Morser  20   f         2023-01-08
      33     Luis Arreola          Maahir al-Jamal  75   m         2023-01-15
      34     Luis Arreola           Arielle Connor   2   f         2023-01-17
      35   Zachary Abeyta          Shawnesse Smith   3   f         2023-01-12
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-07        N lost_to_followup
      3         2023-01-08        N lost_to_followup
      4         2023-01-04        Y             case
      5         2023-01-04        Y             case
      6         2023-01-03        N          unknown
      7         2023-01-04        Y             case
      8         2023-01-05        Y             case
      9         2023-01-09        Y             case
      10        2023-01-06        N   under_followup
      11        2023-01-05        N lost_to_followup
      12        2023-01-03        N   under_followup
      13        2023-01-05        N   under_followup
      14        2023-01-08        N          unknown
      15        2023-01-05        Y             case
      16        2023-01-04        N   under_followup
      17        2023-01-09        N   under_followup
      18        2023-01-07        Y             case
      19        2023-01-06        N   under_followup
      20        2023-01-08        N   under_followup
      21        2023-01-08        Y             case
      22        2023-01-08        Y             case
      23        2023-01-08        N   under_followup
      24        2023-01-08        Y             case
      25        2023-01-09        Y             case
      26        2023-01-11        Y             case
      27        2023-01-13        N lost_to_followup
      28        2023-01-09        N          unknown
      29        2023-01-11        Y             case
      30        2023-01-11        Y             case
      31        2023-01-12        N lost_to_followup
      32        2023-01-10        N   under_followup
      33        2023-01-15        N   under_followup
      34        2023-01-18        N   under_followup
      35        2023-01-14        Y             case
      

# sim_outbreak works as expected with age structure

    Code
      sim_outbreak(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
      $linelist
         id            case_name case_type sex age date_onset date_admission
      1   1      Molly Archuleta confirmed   f   8 2023-01-01           <NA>
      2   2        Gracie Lorenz confirmed   f  76 2023-01-02     2023-01-03
      3   5         David Alexis confirmed   m   9 2023-01-02           <NA>
      4   6 Jazmyn Trotter-Brown confirmed   f  89 2023-01-03     2023-01-05
      5   8           Jack Byers confirmed   m  16 2023-01-03     2023-01-04
      6   9         Janet Cortez confirmed   f  82 2023-01-03           <NA>
      7  10         Angeling Das  probable   f  27 2023-01-07           <NA>
      8  16         Paul Collier  probable   m  47 2023-01-04           <NA>
      9  19  Shawn Bustos-Campos confirmed   m  85 2023-01-04     2023-01-10
      10 22      Fuaada al-Kanan suspected   f  57 2023-01-05           <NA>
      11 23       Caitlin Reeves  probable   f  89 2023-01-05           <NA>
      12 25       Samuel Thacker confirmed   m  90 2023-01-07           <NA>
      13 26      Kenneth Huggins suspected   m  48 2023-01-08           <NA>
      14 27        Alonzo Foster confirmed   m  62 2023-01-09           <NA>
      15 30      Wajeeb al-Jafri confirmed   m   9 2023-01-12           <NA>
      16 31        Kyron Pollard confirmed   m  29 2023-01-10           <NA>
      17 36       Quinasia Lewis  probable   f  79 2023-01-10           <NA>
         date_death date_first_contact date_last_contact ct_value
      1        <NA>               <NA>              <NA>     24.3
      2        <NA>         2023-01-02        2023-01-05     24.3
      3        <NA>         2023-01-03        2023-01-04     24.3
      4        <NA>         2023-01-02        2023-01-04     24.3
      5        <NA>         2023-01-02        2023-01-04     24.3
      6        <NA>         2022-12-30        2023-01-05     24.3
      7        <NA>         2023-01-06        2023-01-09       NA
      8        <NA>         2023-01-04        2023-01-05       NA
      9        <NA>         2023-01-06        2023-01-07     24.3
      10       <NA>         2023-01-06        2023-01-08       NA
      11       <NA>         2023-01-07        2023-01-08       NA
      12       <NA>         2023-01-07        2023-01-08     24.3
      13       <NA>         2023-01-07        2023-01-09       NA
      14       <NA>         2023-01-10        2023-01-11     24.3
      15       <NA>         2023-01-11        2023-01-11     24.3
      16       <NA>         2023-01-08        2023-01-11     24.3
      17       <NA>         2023-01-12        2023-01-14       NA
      
      $contacts
                         from                   to age sex date_first_contact
      1       Molly Archuleta        Gracie Lorenz  76   f         2023-01-02
      2       Molly Archuleta     Mas'ooda el-Azad  65   f         2023-01-04
      3         Gracie Lorenz      Jonathan Mccabe  35   m         2023-01-05
      4         Gracie Lorenz         David Alexis   9   m         2023-01-03
      5         Gracie Lorenz Jazmyn Trotter-Brown  89   f         2023-01-02
      6         Gracie Lorenz      Jenifer Sanchez  36   f         2022-12-31
      7          David Alexis           Jack Byers  16   m         2023-01-02
      8          David Alexis         Janet Cortez  82   f         2022-12-30
      9  Jazmyn Trotter-Brown         Angeling Das  27   f         2023-01-06
      10 Jazmyn Trotter-Brown   Thewodros Martinez  35   m         2023-01-04
      11 Jazmyn Trotter-Brown       Bianca Naranjo   2   f         2023-01-03
      12           Jack Byers   Alexandra Brostrom   6   f         2022-12-30
      13           Jack Byers   Timothy Rademacher  23   m         2023-01-01
      14           Jack Byers        Kail Fanshier  90   m         2023-01-07
      15           Jack Byers         Paul Collier  47   m         2023-01-04
      16           Jack Byers         Timothy Diaz  64   m         2022-12-31
      17         Angeling Das            Mark Soto  16   m         2023-01-06
      18         Paul Collier  Shawn Bustos-Campos  85   m         2023-01-06
      19  Shawn Bustos-Campos         Picabo Colin  42   f         2023-01-05
      20  Shawn Bustos-Campos           Ana Rinard  26   f         2023-01-07
      21  Shawn Bustos-Campos      Fuaada al-Kanan  57   f         2023-01-06
      22      Fuaada al-Kanan       Caitlin Reeves  89   f         2023-01-07
      23       Caitlin Reeves        Brendan Watts  21   m         2023-01-06
      24       Caitlin Reeves       Samuel Thacker  90   m         2023-01-07
      25       Samuel Thacker      Kenneth Huggins  48   m         2023-01-07
      26      Kenneth Huggins        Alonzo Foster  62   m         2023-01-10
      27      Kenneth Huggins        Hector Correa  20   m         2023-01-10
      28      Kenneth Huggins      Samuel Classick   4   m         2023-01-05
      29        Alonzo Foster      Wajeeb al-Jafri   9   m         2023-01-11
      30        Alonzo Foster        Kyron Pollard  29   m         2023-01-08
      31        Alonzo Foster          Lexie Meeks  32   m         2023-01-07
      32        Alonzo Foster       Ahanabah Smith  82   f         2023-01-08
      33      Wajeeb al-Jafri        Jordan Altman  75   m         2023-01-15
      34      Wajeeb al-Jafri   Kebremeskel Gaines   2   f         2023-01-17
      35        Kyron Pollard       Quinasia Lewis  79   f         2023-01-12
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-07        N   under_followup
      3         2023-01-08        N   under_followup
      4         2023-01-04        Y             case
      5         2023-01-04        Y             case
      6         2023-01-03        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-05        Y             case
      9         2023-01-09        Y             case
      10        2023-01-06        N   under_followup
      11        2023-01-05        N   under_followup
      12        2023-01-03        N   under_followup
      13        2023-01-05        N   under_followup
      14        2023-01-08        N   under_followup
      15        2023-01-05        Y             case
      16        2023-01-04        N lost_to_followup
      17        2023-01-09        N   under_followup
      18        2023-01-07        Y             case
      19        2023-01-06        N   under_followup
      20        2023-01-08        N          unknown
      21        2023-01-08        Y             case
      22        2023-01-08        Y             case
      23        2023-01-08        N lost_to_followup
      24        2023-01-08        Y             case
      25        2023-01-09        Y             case
      26        2023-01-11        Y             case
      27        2023-01-13        N   under_followup
      28        2023-01-09        N   under_followup
      29        2023-01-11        Y             case
      30        2023-01-11        Y             case
      31        2023-01-12        N   under_followup
      32        2023-01-10        N   under_followup
      33        2023-01-15        N   under_followup
      34        2023-01-18        N lost_to_followup
      35        2023-01-14        Y             case
      

