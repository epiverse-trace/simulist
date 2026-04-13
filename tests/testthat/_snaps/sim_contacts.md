# sim_contacts works as expected with defaults

    Code
      sim_contacts()
    Output
                       from                 to age sex date_first_contact
      1      Sarah Donnelly        Mariah Gray  57   f         2022-12-27
      2      Sarah Donnelly  Mickenzie Cunniff  28   f         2022-12-30
      3   Mickenzie Cunniff     Malinda Kelley  23   f         2023-01-12
      4   Mickenzie Cunniff      Ulises Garcia  41   m         2023-01-11
      5   Mickenzie Cunniff      Sarah Carlson  47   f         2023-01-09
      6      Malinda Kelley     Fallon Estrada  75   f         2023-01-11
      7      Malinda Kelley     Victor Carreon  38   m         2023-01-14
      8      Malinda Kelley Jesse Breckenridge  23   m         2023-01-12
      9      Fallon Estrada    Naqaa al-Sarwar  52   f         2023-01-20
      10 Jesse Breckenridge     Israa al-Bahri  85   f         2023-01-17
      11 Jesse Breckenridge    Bianca Gallegos  39   f         2023-01-16
      12     Israa al-Bahri        Jacob Hailu  82   m         2023-01-21
      13     Israa al-Bahri Amatullah el-Laham  89   f         2023-01-21
      14        Jacob Hailu     Austin Larabee  34   m         2023-01-28
      15     Austin Larabee   Reyesa Hernandez  42   f         2023-02-01
      16     Austin Larabee        Ha-Mi Zheng   0   f         2023-01-30
      17     Austin Larabee  Siraaj el-Massoud  28   m         2023-02-02
      18        Ha-Mi Zheng         Cade Jumbo  77   m         2023-02-03
      19        Ha-Mi Zheng   Kalyn Fredericks  21   f         2023-02-04
      20        Ha-Mi Zheng      Typhani Salas  69   f         2023-02-03
         date_last_contact was_case           status
      1         2023-01-04    FALSE   under_followup
      2         2023-01-06     TRUE             case
      3         2023-01-18     TRUE             case
      4         2023-01-18    FALSE lost_to_followup
      5         2023-01-17    FALSE   under_followup
      6         2023-01-18     TRUE             case
      7         2023-01-20    FALSE   under_followup
      8         2023-01-19     TRUE             case
      9         2023-01-30    FALSE   under_followup
      10        2023-01-22     TRUE             case
      11        2023-01-22    FALSE lost_to_followup
      12        2023-01-31     TRUE             case
      13        2023-01-26    FALSE   under_followup
      14        2023-02-03     TRUE             case
      15        2023-02-04    FALSE   under_followup
      16        2023-02-06     TRUE             case
      17        2023-02-09    FALSE lost_to_followup
      18        2023-02-08    FALSE   under_followup
      19        2023-02-12     TRUE             case
      20        2023-02-09    FALSE lost_to_followup

# sim_contacts works as expected

    Code
      sim_contacts(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5)
    Output
                          from                      to age sex date_first_contact
      1       Maleeha al-Bilal           Julian Waters  43   m         2022-12-29
      2       Maleeha al-Bilal           Sarah Redding  48   f         2022-12-27
      3          Sarah Redding           Lilliana Sisk  59   f         2022-12-29
      4          Sarah Redding           James Burukie  55   m         2022-12-29
      5          Sarah Redding       Carina Miramontes  48   f         2022-12-30
      6          Lilliana Sisk        Dhaakir el-Faris  49   m         2022-12-31
      7          Lilliana Sisk           Anthony Smith  90   m         2022-12-29
      8          Lilliana Sisk          Robert Fischer   6   m         2022-12-30
      9          Lilliana Sisk           Rebeca Tafoya  19   f         2022-12-29
      10         Lilliana Sisk         Haibaa el-Farah  23   f         2022-12-31
      11         Lilliana Sisk Barrington Merriweather  50   m         2022-12-31
      12         Anthony Smith             Ruby Torres  52   f         2022-12-25
      13         Anthony Smith          Richard Havlik  15   m         2022-12-30
      14       Haibaa el-Farah           Kennedy Allen  82   f         2022-12-31
      15       Haibaa el-Farah              Jamie Chun   1   f         2023-01-01
      16       Haibaa el-Farah   Natasha Coronado-Romo  47   f         2022-12-30
      17           Ruby Torres          Melinda Hamlin  64   f         2022-12-28
      18         Kennedy Allen            Shympia Dang  43   m         2022-12-31
      19         Kennedy Allen        Adrianna Ramirez  76   f         2022-12-27
      20         Kennedy Allen            Miguel Avena  89   m         2022-12-30
      21         Kennedy Allen              Andy Casem  65   m         2023-01-01
      22            Jamie Chun        Zaahira al-Rassi  18   f         2022-12-31
      23 Natasha Coronado-Romo             Daisy Perez  16   f         2023-01-02
      24 Natasha Coronado-Romo      Christina Ambrozic  33   f         2023-01-03
      25            Andy Casem            Ven Silevani  74   m         2022-12-30
         date_last_contact was_case           status
      1         2023-01-04    FALSE   under_followup
      2         2023-01-04     TRUE             case
      3         2023-01-10     TRUE             case
      4         2023-01-05    FALSE   under_followup
      5         2023-01-05    FALSE   under_followup
      6         2023-01-03    FALSE          unknown
      7         2023-01-06     TRUE             case
      8         2023-01-05     TRUE             case
      9         2023-01-05    FALSE lost_to_followup
      10        2023-01-04     TRUE             case
      11        2023-01-04    FALSE   under_followup
      12        2023-01-05     TRUE             case
      13        2023-01-05    FALSE   under_followup
      14        2023-01-03     TRUE             case
      15        2023-01-02     TRUE             case
      16        2023-01-05     TRUE             case
      17        2023-01-09    FALSE   under_followup
      18        2023-01-06    FALSE   under_followup
      19        2023-01-06    FALSE          unknown
      20        2023-01-06    FALSE lost_to_followup
      21        2023-01-10     TRUE             case
      22        2023-01-06    FALSE   under_followup
      23        2023-01-07    FALSE   under_followup
      24        2023-01-06     TRUE             case
      25        2023-01-05    FALSE   under_followup

# sim_contacts works as expected with modified config

    Code
      sim_contacts(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, config = create_config(last_contact_distribution = function(
          n) stats::rgeom(n = n, prob = 0.5)))
    Output
                           from                     to age sex date_first_contact
      1             Cody Fierro        Cleatus Edwards  15   m         2022-12-28
      2             Cody Fierro           Amanda Guyon  39   f         2022-12-29
      3            Amanda Guyon       Mikhaila Carlson   8   f         2022-12-31
      4            Amanda Guyon          Gabriel Berry  49   m         2022-12-29
      5            Amanda Guyon          Kanani Nguyen  23   f         2022-12-30
      6        Mikhaila Carlson         Jackson Foster   9   m         2022-12-29
      7        Mikhaila Carlson         Chandra Kilian  78   f         2022-12-31
      8        Mikhaila Carlson            Sam Summers  31   m         2022-12-31
      9        Mikhaila Carlson           Annie Carter  38   f         2022-12-25
      10       Mikhaila Carlson         Preston Larson  36   m         2022-12-30
      11       Mikhaila Carlson            Hope Arshad  11   f         2022-12-31
      12         Chandra Kilian          Jennifer Hong  13   f         2023-01-01
      13         Chandra Kilian           Brandon Hall  15   m         2022-12-30
      14         Preston Larson Nirvana Elizalde Villa  14   f         2022-12-27
      15         Preston Larson       Kelly Shangreaux   1   f         2022-12-30
      16         Preston Larson          Diego Sanchez  64   m         2022-12-26
      17          Jennifer Hong          Pierce Murray  66   m         2022-12-30
      18 Nirvana Elizalde Villa      Alexandra Johnson  72   f         2023-01-01
      19 Nirvana Elizalde Villa           Cicely Dalke  16   f         2022-12-31
      20 Nirvana Elizalde Villa      Khaleel al-Demian  83   m         2023-01-02
      21 Nirvana Elizalde Villa              Ryan Sena   4   m         2023-01-03
      22       Kelly Shangreaux Firdaus el-Abdelrahman  40   f         2022-12-30
      23          Diego Sanchez          Walter Mcgill  90   m         2023-01-02
      24          Diego Sanchez              Kyle Orio  30   m         2022-12-31
      25              Ryan Sena        Travis Chambers  71   m         2022-12-31
         date_last_contact was_case           status
      1         2023-01-01    FALSE lost_to_followup
      2         2023-01-01     TRUE             case
      3         2023-01-02     TRUE             case
      4         2023-01-03    FALSE   under_followup
      5         2023-01-02    FALSE   under_followup
      6         2023-01-03    FALSE   under_followup
      7         2023-01-02     TRUE             case
      8         2023-01-02     TRUE             case
      9         2023-01-03    FALSE   under_followup
      10        2023-01-02     TRUE             case
      11        2023-01-02    FALSE   under_followup
      12        2023-01-03     TRUE             case
      13        2023-01-03    FALSE lost_to_followup
      14        2023-01-03     TRUE             case
      15        2023-01-03     TRUE             case
      16        2023-01-02     TRUE             case
      17        2023-01-05    FALSE lost_to_followup
      18        2023-01-04    FALSE   under_followup
      19        2023-01-05    FALSE   under_followup
      20        2023-01-04    FALSE   under_followup
      21        2023-01-03     TRUE             case
      22        2023-01-04    FALSE          unknown
      23        2023-01-03    FALSE lost_to_followup
      24        2023-01-06     TRUE             case
      25        2023-01-05    FALSE lost_to_followup

# sim_contacts works as expected with modified config parameters

    Code
      sim_contacts(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, config = create_config(last_contact_distribution = function(
          n) stats::rpois(n = n, lambda = 5)))
    Output
                          from                      to age sex date_first_contact
      1       Maleeha al-Bilal           Julian Waters  43   m         2022-12-29
      2       Maleeha al-Bilal           Sarah Redding  48   f         2022-12-27
      3          Sarah Redding           Lilliana Sisk  59   f         2022-12-29
      4          Sarah Redding           James Burukie  55   m         2022-12-29
      5          Sarah Redding       Carina Miramontes  48   f         2022-12-30
      6          Lilliana Sisk        Dhaakir el-Faris  49   m         2022-12-31
      7          Lilliana Sisk           Anthony Smith  90   m         2022-12-29
      8          Lilliana Sisk          Robert Fischer   6   m         2022-12-30
      9          Lilliana Sisk           Rebeca Tafoya  19   f         2022-12-29
      10         Lilliana Sisk         Haibaa el-Farah  23   f         2022-12-31
      11         Lilliana Sisk Barrington Merriweather  50   m         2022-12-31
      12         Anthony Smith             Ruby Torres  52   f         2022-12-25
      13         Anthony Smith          Richard Havlik  15   m         2022-12-30
      14       Haibaa el-Farah           Kennedy Allen  82   f         2022-12-31
      15       Haibaa el-Farah              Jamie Chun   1   f         2023-01-01
      16       Haibaa el-Farah   Natasha Coronado-Romo  47   f         2022-12-30
      17           Ruby Torres          Melinda Hamlin  64   f         2022-12-28
      18         Kennedy Allen            Shympia Dang  43   m         2022-12-31
      19         Kennedy Allen        Adrianna Ramirez  76   f         2022-12-27
      20         Kennedy Allen            Miguel Avena  89   m         2022-12-30
      21         Kennedy Allen              Andy Casem  65   m         2023-01-01
      22            Jamie Chun        Zaahira al-Rassi  18   f         2022-12-31
      23 Natasha Coronado-Romo             Daisy Perez  16   f         2023-01-02
      24 Natasha Coronado-Romo      Christina Ambrozic  33   f         2023-01-03
      25            Andy Casem            Ven Silevani  74   m         2022-12-30
         date_last_contact was_case           status
      1         2023-01-06    FALSE   under_followup
      2         2023-01-07     TRUE             case
      3         2023-01-13     TRUE             case
      4         2023-01-07    FALSE   under_followup
      5         2023-01-07    FALSE   under_followup
      6         2023-01-05    FALSE          unknown
      7         2023-01-08     TRUE             case
      8         2023-01-07     TRUE             case
      9         2023-01-07    FALSE lost_to_followup
      10        2023-01-05     TRUE             case
      11        2023-01-05    FALSE   under_followup
      12        2023-01-07     TRUE             case
      13        2023-01-07    FALSE   under_followup
      14        2023-01-04     TRUE             case
      15        2023-01-03     TRUE             case
      16        2023-01-08     TRUE             case
      17        2023-01-11    FALSE   under_followup
      18        2023-01-08    FALSE   under_followup
      19        2023-01-08    FALSE          unknown
      20        2023-01-08    FALSE lost_to_followup
      21        2023-01-13     TRUE             case
      22        2023-01-08    FALSE   under_followup
      23        2023-01-09    FALSE   under_followup
      24        2023-01-08     TRUE             case
      25        2023-01-06    FALSE   under_followup

# sim_contacts works as expected with age structure

    Code
      sim_contacts(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, population_age = age_struct)
    Output
                              from                        to age sex
      1              Brandy Galvan                Lucas Long  51   m
      2              Brandy Galvan             Natalie Vivas  73   f
      3              Natalie Vivas             Mckayla Marez  75   f
      4              Natalie Vivas              Justin Paiva  25   m
      5              Natalie Vivas           Monica Costigan  48   f
      6              Mckayla Marez       Brannon Shakespeare  79   m
      7              Mckayla Marez             Carlos Barela  52   m
      8              Mckayla Marez                 Tyler Cho  63   m
      9              Mckayla Marez      Erika Cavazos Castro  37   f
      10             Mckayla Marez           Ashley Quintana  34   f
      11             Mckayla Marez               Jerry Harpe  88   m
      12             Carlos Barela             Asashia Begay  80   f
      13             Carlos Barela       Merrick Houangvilay  78   m
      14           Ashley Quintana          Janeika Orlowske  10   f
      15           Ashley Quintana           Tanisha Lohrenz  77   f
      16           Ashley Quintana         Victoria Saunders  80   f
      17             Asashia Begay         Fateena al-Masood  18   f
      18          Janeika Orlowske             Nathan Nguyen  61   m
      19          Janeika Orlowske            Najwa el-Elbaz  33   f
      20          Janeika Orlowske                Luyen Manu  42   m
      21          Janeika Orlowske Dametrious Taylor Mcgowan  60   m
      22           Tanisha Lohrenz          Qamraaa al-Samra  25   f
      23         Victoria Saunders           Brittani Urbina  81   f
      24         Victoria Saunders              Tiandra Hill  66   f
      25 Dametrious Taylor Mcgowan       Christian Schenally  88   m
         date_first_contact date_last_contact was_case         status
      1          2022-12-29        2023-01-04    FALSE under_followup
      2          2022-12-27        2023-01-04     TRUE           case
      3          2022-12-29        2023-01-10     TRUE           case
      4          2022-12-29        2023-01-05    FALSE under_followup
      5          2022-12-30        2023-01-05    FALSE under_followup
      6          2022-12-31        2023-01-03    FALSE under_followup
      7          2022-12-29        2023-01-06     TRUE           case
      8          2022-12-30        2023-01-05     TRUE           case
      9          2022-12-29        2023-01-05    FALSE under_followup
      10         2022-12-31        2023-01-04     TRUE           case
      11         2022-12-31        2023-01-04    FALSE under_followup
      12         2022-12-25        2023-01-05     TRUE           case
      13         2022-12-30        2023-01-05    FALSE under_followup
      14         2022-12-31        2023-01-03     TRUE           case
      15         2023-01-01        2023-01-02     TRUE           case
      16         2022-12-30        2023-01-05     TRUE           case
      17         2022-12-28        2023-01-09    FALSE        unknown
      18         2022-12-31        2023-01-06    FALSE under_followup
      19         2022-12-27        2023-01-06    FALSE under_followup
      20         2022-12-30        2023-01-06    FALSE        unknown
      21         2023-01-01        2023-01-10     TRUE           case
      22         2022-12-31        2023-01-06    FALSE under_followup
      23         2023-01-02        2023-01-07    FALSE under_followup
      24         2023-01-03        2023-01-06     TRUE           case
      25         2022-12-30        2023-01-05    FALSE under_followup

