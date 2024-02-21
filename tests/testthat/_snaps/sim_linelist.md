# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
         id           case_name case_type sex age date_onset date_admission
      1   1    Macella Moreland confirmed   f  28 2023-01-01           <NA>
      2   2      Kayla Ellerman confirmed   f  62 2023-01-02     2023-01-02
      3   5 Matthew Biggerstaff confirmed   m  42 2023-01-01           <NA>
      4   6   Vanessa Sihombing  probable   f  60 2023-01-01           <NA>
      5   8     Ross Mcclintock suspected   m  28 2023-01-02     2023-01-03
      6   9     Danielle Medero confirmed   f  78 2023-01-01           <NA>
      7  10      Suhaa el-Saidi suspected   f  31 2023-01-04     2023-01-17
      8  16       Jakeob Wisham suspected   m  33 2023-01-01           <NA>
      9  19   Shaahir el-Younis suspected   m  86 2023-01-01           <NA>
      10 22     Arianna Bellomy confirmed   f  37 2023-01-01           <NA>
      11 23     Angela Thompson  probable   f  15 2023-01-01           <NA>
      12 25       Irvin Quezada suspected   m  81 2023-01-02     2023-01-03
      13 26        Ronald Bliss  probable   m  82 2023-01-01           <NA>
      14 27       Andrew Truong  probable   m  72 2023-01-02           <NA>
      15 30       Dawson Wagner confirmed   m  71 2023-01-03           <NA>
      16 31          Jacky Chen confirmed   m  50 2023-01-01           <NA>
      17 36          Dewi Smith confirmed   f   3 2023-01-01           <NA>
         date_death date_first_contact date_last_contact ct_value
      1        <NA>               <NA>              <NA>     23.6
      2        <NA>         2023-01-02        2023-01-05     23.6
      3        <NA>         2023-01-03        2023-01-04     23.6
      4        <NA>         2023-01-02        2023-01-04       NA
      5        <NA>         2023-01-01        2023-01-03       NA
      6        <NA>         2022-12-29        2023-01-04     23.6
      7        <NA>         2023-01-04        2023-01-07       NA
      8        <NA>         2023-01-03        2023-01-04       NA
      9        <NA>         2023-01-03        2023-01-04       NA
      10 2023-01-19         2023-01-03        2023-01-05     23.6
      11       <NA>         2023-01-03        2023-01-04       NA
      12       <NA>         2023-01-03        2023-01-04       NA
      13       <NA>         2023-01-02        2023-01-04       NA
      14       <NA>         2023-01-03        2023-01-04       NA
      15       <NA>         2023-01-04        2023-01-04     23.6
      16       <NA>         2023-01-01        2023-01-04     23.6
      17       <NA>         2023-01-03        2023-01-05     23.6

# sim_linelist works as expected with age-strat risks

    Code
      sim_linelist(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
         id        case_name case_type sex age date_onset date_admission date_death
      1   1  Rachael Sneesby confirmed   f  28 2023-01-01           <NA>       <NA>
      2   2       Nadia Hill confirmed   f  62 2023-01-02     2023-01-02 2023-01-07
      3   5   Jonathan Huynh  probable   m  42 2023-01-01           <NA>       <NA>
      4   6  Tharwa al-Amber  probable   f  60 2023-01-01           <NA>       <NA>
      5   8      Ian Sanchez suspected   m  28 2023-01-02           <NA>       <NA>
      6   9       Sadie Ross confirmed   f  78 2023-01-01           <NA>       <NA>
      7  10 Jordan Marquardt suspected   f  31 2023-01-04           <NA>       <NA>
      8  16       Joseph Sky suspected   m  33 2023-01-01           <NA>       <NA>
      9  19    Geoffrey Boon confirmed   m  86 2023-01-01           <NA>       <NA>
      10 22    Juyoung Sands suspected   f  37 2023-01-01           <NA>       <NA>
      11 23         Mya Hunt suspected   f  15 2023-01-01           <NA>       <NA>
      12 25     Josef Fortes  probable   m  81 2023-01-02     2023-01-03 2023-01-24
      13 26   Badri el-Hoque confirmed   m  82 2023-01-01           <NA>       <NA>
      14 27    William Jones  probable   m  72 2023-01-02           <NA>       <NA>
      15 30     Luis Arreola confirmed   m  71 2023-01-03           <NA>       <NA>
      16 31   Zachary Abeyta  probable   m  50 2023-01-01           <NA>       <NA>
      17 36  Shawnesse Smith suspected   f   3 2023-01-01           <NA>       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>     24.3
      2          2023-01-02        2023-01-05     24.3
      3          2023-01-03        2023-01-04       NA
      4          2023-01-02        2023-01-04       NA
      5          2023-01-01        2023-01-03       NA
      6          2022-12-29        2023-01-04     24.3
      7          2023-01-04        2023-01-07       NA
      8          2023-01-03        2023-01-04       NA
      9          2023-01-03        2023-01-04     24.3
      10         2023-01-03        2023-01-05       NA
      11         2023-01-03        2023-01-04       NA
      12         2023-01-03        2023-01-04       NA
      13         2023-01-02        2023-01-04     24.3
      14         2023-01-03        2023-01-04       NA
      15         2023-01-04        2023-01-04     24.3
      16         2023-01-01        2023-01-04       NA
      17         2023-01-03        2023-01-05       NA

# sim_linelist works as expected without Ct

    Code
      sim_linelist(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_ct = FALSE)
    Output
         id           case_name case_type sex age date_onset date_admission
      1   1    Macella Moreland confirmed   f  28 2023-01-01           <NA>
      2   2      Kayla Ellerman confirmed   f  62 2023-01-02     2023-01-02
      3   5 Matthew Biggerstaff confirmed   m  42 2023-01-01           <NA>
      4   6   Vanessa Sihombing  probable   f  60 2023-01-01           <NA>
      5   8     Ross Mcclintock suspected   m  28 2023-01-02     2023-01-03
      6   9     Danielle Medero confirmed   f  78 2023-01-01           <NA>
      7  10      Suhaa el-Saidi suspected   f  31 2023-01-04     2023-01-17
      8  16       Jakeob Wisham suspected   m  33 2023-01-01           <NA>
      9  19   Shaahir el-Younis suspected   m  86 2023-01-01           <NA>
      10 22     Arianna Bellomy confirmed   f  37 2023-01-01           <NA>
      11 23     Angela Thompson  probable   f  15 2023-01-01           <NA>
      12 25       Irvin Quezada suspected   m  81 2023-01-02     2023-01-03
      13 26        Ronald Bliss  probable   m  82 2023-01-01           <NA>
      14 27       Andrew Truong  probable   m  72 2023-01-02           <NA>
      15 30       Dawson Wagner confirmed   m  71 2023-01-03           <NA>
      16 31          Jacky Chen confirmed   m  50 2023-01-01           <NA>
      17 36          Dewi Smith confirmed   f   3 2023-01-01           <NA>
         date_death date_first_contact date_last_contact
      1        <NA>               <NA>              <NA>
      2        <NA>         2023-01-02        2023-01-05
      3        <NA>         2023-01-03        2023-01-04
      4        <NA>         2023-01-02        2023-01-04
      5        <NA>         2023-01-01        2023-01-03
      6        <NA>         2022-12-29        2023-01-04
      7        <NA>         2023-01-04        2023-01-07
      8        <NA>         2023-01-03        2023-01-04
      9        <NA>         2023-01-03        2023-01-04
      10 2023-01-19         2023-01-03        2023-01-05
      11       <NA>         2023-01-03        2023-01-04
      12       <NA>         2023-01-03        2023-01-04
      13       <NA>         2023-01-02        2023-01-04
      14       <NA>         2023-01-03        2023-01-04
      15       <NA>         2023-01-04        2023-01-04
      16       <NA>         2023-01-01        2023-01-04
      17       <NA>         2023-01-03        2023-01-05

# sim_linelist works as expected with anonymous

    Code
      sim_linelist(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        add_names = FALSE)
    Output
         id case_type sex age date_onset date_admission date_death date_first_contact
      1   1 confirmed   f  28 2023-01-01           <NA>       <NA>               <NA>
      2   2 confirmed   f  62 2023-01-02     2023-01-02       <NA>         2023-01-02
      3   5  probable   m  42 2023-01-01           <NA>       <NA>         2023-01-03
      4   6 confirmed   f  60 2023-01-01           <NA>       <NA>         2023-01-02
      5   8 suspected   m  28 2023-01-02     2023-01-03       <NA>         2023-01-01
      6   9  probable   f  78 2023-01-01           <NA>       <NA>         2022-12-29
      7  10 confirmed   f  31 2023-01-04     2023-01-17       <NA>         2023-01-04
      8  16 confirmed   m  33 2023-01-01           <NA>       <NA>         2023-01-03
      9  19 confirmed   m  86 2023-01-01           <NA>       <NA>         2023-01-03
      10 22 suspected   f  37 2023-01-01           <NA> 2023-01-19         2023-01-03
      11 23 confirmed   f  15 2023-01-01           <NA>       <NA>         2023-01-03
      12 25  probable   m  81 2023-01-02     2023-01-03       <NA>         2023-01-03
      13 26  probable   m  82 2023-01-01           <NA>       <NA>         2023-01-02
      14 27 suspected   m  72 2023-01-02           <NA>       <NA>         2023-01-03
      15 30  probable   m  71 2023-01-03           <NA>       <NA>         2023-01-04
      16 31 confirmed   m  50 2023-01-01           <NA>       <NA>         2023-01-01
      17 36 suspected   f   3 2023-01-01           <NA>       <NA>         2023-01-03
         date_last_contact ct_value
      1               <NA>     25.7
      2         2023-01-05     25.7
      3         2023-01-04       NA
      4         2023-01-04     25.7
      5         2023-01-03       NA
      6         2023-01-04       NA
      7         2023-01-07     25.7
      8         2023-01-04     25.7
      9         2023-01-04     25.7
      10        2023-01-05       NA
      11        2023-01-04     25.7
      12        2023-01-04       NA
      13        2023-01-04       NA
      14        2023-01-04       NA
      15        2023-01-04       NA
      16        2023-01-04     25.7
      17        2023-01-05       NA

# sim_linelist works as expected with age structure

    Code
      sim_linelist(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
         id            case_name case_type sex age date_onset date_admission
      1   1      Molly Archuleta confirmed   f   8 2023-01-01           <NA>
      2   2        Gracie Lorenz confirmed   f  76 2023-01-02     2023-01-03
      3   5         David Alexis confirmed   m   9 2023-01-01           <NA>
      4   6 Jazmyn Trotter-Brown confirmed   f  89 2023-01-01     2023-01-04
      5   8           Jack Byers confirmed   m  16 2023-01-02     2023-01-02
      6   9         Janet Cortez confirmed   f  82 2023-01-01           <NA>
      7  10         Angeling Das  probable   f  27 2023-01-04           <NA>
      8  16         Paul Collier  probable   m  47 2023-01-01           <NA>
      9  19  Shawn Bustos-Campos confirmed   m  85 2023-01-01     2023-01-07
      10 22      Fuaada al-Kanan suspected   f  57 2023-01-01           <NA>
      11 23       Caitlin Reeves  probable   f  89 2023-01-01           <NA>
      12 25       Samuel Thacker confirmed   m  90 2023-01-02           <NA>
      13 26      Kenneth Huggins suspected   m  48 2023-01-01           <NA>
      14 27        Alonzo Foster confirmed   m  62 2023-01-02           <NA>
      15 30      Wajeeb al-Jafri confirmed   m   9 2023-01-03           <NA>
      16 31        Kyron Pollard confirmed   m  29 2023-01-01           <NA>
      17 36       Quinasia Lewis  probable   f  79 2023-01-01           <NA>
         date_death date_first_contact date_last_contact ct_value
      1        <NA>               <NA>              <NA>     24.3
      2        <NA>         2023-01-02        2023-01-05     24.3
      3        <NA>         2023-01-03        2023-01-04     24.3
      4        <NA>         2023-01-02        2023-01-04     24.3
      5        <NA>         2023-01-01        2023-01-03     24.3
      6        <NA>         2022-12-29        2023-01-04     24.3
      7        <NA>         2023-01-04        2023-01-07       NA
      8        <NA>         2023-01-03        2023-01-04       NA
      9        <NA>         2023-01-03        2023-01-04     24.3
      10       <NA>         2023-01-03        2023-01-05       NA
      11       <NA>         2023-01-03        2023-01-04       NA
      12       <NA>         2023-01-03        2023-01-04     24.3
      13       <NA>         2023-01-02        2023-01-04       NA
      14       <NA>         2023-01-03        2023-01-04     24.3
      15       <NA>         2023-01-04        2023-01-04     24.3
      16       <NA>         2023-01-01        2023-01-04     24.3
      17       <NA>         2023-01-03        2023-01-05       NA

# sim_linelist works as expected with age-strat risks & age struct

    Code
      sim_linelist(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, population_age = age_struct)
    Output
         id          case_name case_type sex age date_onset date_admission date_death
      1   1  Elvia Ramos-Salas confirmed   f   8 2023-01-01           <NA>       <NA>
      2   2   Izza al-Muhammed confirmed   f  76 2023-01-02           <NA>       <NA>
      3   5    Nicholas Oliver  probable   m   9 2023-01-01           <NA>       <NA>
      4   6      Monique Payne  probable   f  89 2023-01-01           <NA>       <NA>
      5   8       Nathan Yatsu confirmed   m  16 2023-01-02           <NA>       <NA>
      6   9 Musheera al-Dajani confirmed   f  82 2023-01-01     2023-01-08       <NA>
      7  10     Cassidy Wilson suspected   f  27 2023-01-04           <NA>       <NA>
      8  16     Yinghan Sahani suspected   m  47 2023-01-01           <NA> 2023-01-13
      9  19         Zane Vitry confirmed   m  85 2023-01-01           <NA>       <NA>
      10 22      Sarah Fejeran confirmed   f  57 2023-01-01           <NA>       <NA>
      11 23       Susan Watson confirmed   f  89 2023-01-01           <NA>       <NA>
      12 25        Tyler Begay confirmed   m  90 2023-01-02           <NA>       <NA>
      13 26   Jonathan Johnson confirmed   m  48 2023-01-01           <NA>       <NA>
      14 27    Daif al-Ebrahim  probable   m  62 2023-01-02     2023-01-03       <NA>
      15 30        David Simok suspected   m   9 2023-01-03           <NA>       <NA>
      16 31        Khameron Vu confirmed   m  29 2023-01-01           <NA>       <NA>
      17 36   Brittany Tillman suspected   f  79 2023-01-01           <NA>       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>     26.8
      2          2023-01-02        2023-01-05     26.8
      3          2023-01-03        2023-01-04       NA
      4          2023-01-02        2023-01-04       NA
      5          2023-01-01        2023-01-03     26.8
      6          2022-12-29        2023-01-04     26.8
      7          2023-01-04        2023-01-07       NA
      8          2023-01-03        2023-01-04       NA
      9          2023-01-03        2023-01-04     26.8
      10         2023-01-03        2023-01-05     26.8
      11         2023-01-03        2023-01-04     26.8
      12         2023-01-03        2023-01-04     26.8
      13         2023-01-02        2023-01-04     26.8
      14         2023-01-03        2023-01-04       NA
      15         2023-01-04        2023-01-04       NA
      16         2023-01-01        2023-01-04     26.8
      17         2023-01-03        2023-01-05       NA

# sim_linelist works as expected with modified config

    Code
      sim_linelist(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution = "geom",
          last_contact_distribution_params = c(prob = 0.5)))
    Output
         id         case_name case_type sex age date_onset date_admission date_death
      1   1 Michelle Gonzales confirmed   f  75 2023-01-01           <NA>       <NA>
      2   2   Melanie Shaffer confirmed   f   2 2023-01-02           <NA>       <NA>
      3   5    Artrielle Webb confirmed   f  15 2023-01-01     2023-01-02       <NA>
      4   6      Casey Tucson suspected   f  28 2023-01-01     2023-01-16       <NA>
      5   8   John Yanushonis suspected   m  69 2023-01-02           <NA>       <NA>
      6   9    Carli Burciaga  probable   f  78 2023-01-01           <NA>       <NA>
      7  10   Saalih al-Islam suspected   m  37 2023-01-04           <NA>       <NA>
      8  16      Daif al-Awan  probable   m  83 2023-01-01           <NA>       <NA>
      9  19 Chanise Armstrong confirmed   f  68 2023-01-01     2023-01-06 2023-01-08
      10 22    Dalene Charlie suspected   f  52 2023-01-01           <NA>       <NA>
      11 23    Trent Atkinson confirmed   m  80 2023-01-01           <NA>       <NA>
      12 25    Shandel Shreve confirmed   f  35 2023-01-02     2023-01-02       <NA>
      13 26  Antonio Spradley confirmed   m  74 2023-01-01           <NA>       <NA>
      14 27     William Oster  probable   m  70 2023-01-02           <NA>       <NA>
      15 30      Hannah Hicks  probable   f  49 2023-01-03           <NA>       <NA>
      16 31     Sara Broomand suspected   f  87 2023-01-01           <NA>       <NA>
      17 36  Keith Henningsen confirmed   m  13 2023-01-01           <NA>       <NA>
         date_first_contact date_last_contact ct_value
      1                <NA>              <NA>       24
      2          2022-12-31        2023-01-01       24
      3          2023-01-01        2023-01-02       24
      4          2022-12-31        2023-01-05       NA
      5          2022-12-30        2023-01-01       NA
      6          2022-12-30        2023-01-02       NA
      7          2022-12-31        2023-01-01       NA
      8          2022-12-31        2023-01-02       NA
      9          2022-12-27        2023-01-02       24
      10         2022-12-30        2023-01-01       NA
      11         2022-12-29        2023-01-02       24
      12         2023-01-01        2023-01-03       24
      13         2022-12-31        2023-01-02       24
      14         2022-12-28        2023-01-01       NA
      15         2022-12-30        2023-01-02       NA
      16         2023-01-05        2023-01-06       NA
      17         2022-12-29        2023-01-01       24

# sim_linelist works as expected with modified config parameters

    Code
      sim_linelist(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution_params = c(lambda = 5)))
    Output
         id           case_name case_type sex age date_onset date_admission
      1   1    Macella Moreland confirmed   f  28 2023-01-01           <NA>
      2   2      Kayla Ellerman confirmed   f  62 2023-01-02     2023-01-02
      3   5 Matthew Biggerstaff confirmed   m  42 2023-01-01           <NA>
      4   6   Vanessa Sihombing  probable   f  60 2023-01-01           <NA>
      5   8     Ross Mcclintock suspected   m  28 2023-01-02     2023-01-03
      6   9     Danielle Medero confirmed   f  78 2023-01-01           <NA>
      7  10      Suhaa el-Saidi suspected   f  31 2023-01-04     2023-01-17
      8  16       Jakeob Wisham suspected   m  33 2023-01-01           <NA>
      9  19   Shaahir el-Younis suspected   m  86 2023-01-01           <NA>
      10 22     Arianna Bellomy confirmed   f  37 2023-01-01           <NA>
      11 23     Angela Thompson  probable   f  15 2023-01-01           <NA>
      12 25       Irvin Quezada suspected   m  81 2023-01-02     2023-01-03
      13 26        Ronald Bliss  probable   m  82 2023-01-01           <NA>
      14 27       Andrew Truong  probable   m  72 2023-01-02           <NA>
      15 30       Dawson Wagner confirmed   m  71 2023-01-03           <NA>
      16 31          Jacky Chen confirmed   m  50 2023-01-01           <NA>
      17 36          Dewi Smith confirmed   f   3 2023-01-01           <NA>
         date_death date_first_contact date_last_contact ct_value
      1        <NA>               <NA>              <NA>     23.6
      2        <NA>         2023-01-04        2023-01-07     23.6
      3        <NA>         2023-01-05        2023-01-06     23.6
      4        <NA>         2023-01-03        2023-01-05       NA
      5        <NA>         2023-01-03        2023-01-05       NA
      6        <NA>         2022-12-31        2023-01-06     23.6
      7        <NA>         2023-01-06        2023-01-09       NA
      8        <NA>         2023-01-05        2023-01-06       NA
      9        <NA>         2023-01-06        2023-01-07       NA
      10 2023-01-19         2023-01-05        2023-01-07     23.6
      11       <NA>         2023-01-05        2023-01-06       NA
      12       <NA>         2023-01-05        2023-01-06       NA
      13       <NA>         2023-01-04        2023-01-06       NA
      14       <NA>         2023-01-05        2023-01-06       NA
      15       <NA>         2023-01-06        2023-01-06     23.6
      16       <NA>         2023-01-02        2023-01-05     23.6
      17       <NA>         2023-01-05        2023-01-07     23.6

