# sim_contacts works as expected with defaults

    Code
      sim_contacts()
    Output
                       from                 to age sex date_first_contact
      1      Sarah Donnelly        Mariah Gray  58   f         2022-12-27
      2      Sarah Donnelly  Mickenzie Cunniff  29   f         2022-12-30
      3   Mickenzie Cunniff     Malinda Kelley  24   f         2023-01-12
      4   Mickenzie Cunniff      Ulises Garcia  42   m         2023-01-11
      5   Mickenzie Cunniff      Sarah Carlson  48   f         2023-01-09
      6      Malinda Kelley     Fallon Estrada  76   f         2023-01-11
      7      Malinda Kelley     Victor Carreon  39   m         2023-01-14
      8      Malinda Kelley Jesse Breckenridge  24   m         2023-01-12
      9      Fallon Estrada    Naqaa al-Sarwar  53   f         2023-01-20
      10 Jesse Breckenridge     Israa al-Bahri  86   f         2023-01-17
      11 Jesse Breckenridge    Bianca Gallegos  40   f         2023-01-16
      12     Israa al-Bahri        Jacob Hailu  83   m         2023-01-21
      13     Israa al-Bahri Amatullah el-Laham  90   f         2023-01-21
      14        Jacob Hailu     Austin Larabee  35   m         2023-01-28
      15     Austin Larabee   Reyesa Hernandez  43   f         2023-02-01
      16     Austin Larabee        Ha-Mi Zheng   1   f         2023-01-30
      17     Austin Larabee  Siraaj el-Massoud  29   m         2023-02-02
      18        Ha-Mi Zheng         Cade Jumbo  78   m         2023-02-03
      19        Ha-Mi Zheng   Kalyn Fredericks  22   f         2023-02-04
      20        Ha-Mi Zheng      Typhani Salas  70   f         2023-02-03
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
      1       Maleeha al-Bilal           Julian Waters  44   m         2022-12-29
      2       Maleeha al-Bilal           Sarah Redding  49   f         2022-12-27
      3          Sarah Redding           Lilliana Sisk  60   f         2022-12-29
      4          Sarah Redding           James Burukie  56   m         2022-12-29
      5          Sarah Redding       Carina Miramontes  49   f         2022-12-30
      6          Lilliana Sisk        Dhaakir el-Faris  50   m         2022-12-31
      7          Lilliana Sisk           Anthony Smith   7   m         2022-12-29
      8          Lilliana Sisk          Robert Fischer  20   m         2022-12-30
      9          Lilliana Sisk           Rebeca Tafoya  24   f         2022-12-29
      10         Lilliana Sisk         Haibaa el-Farah  51   f         2022-12-31
      11         Lilliana Sisk Barrington Merriweather  53   m         2022-12-31
      12         Anthony Smith             Ruby Torres  16   f         2022-12-25
      13         Anthony Smith          Richard Havlik  83   m         2022-12-30
      14       Haibaa el-Farah           Kennedy Allen   2   f         2022-12-31
      15       Haibaa el-Farah              Jamie Chun  48   f         2023-01-01
      16       Haibaa el-Farah   Natasha Coronado-Romo  65   f         2022-12-30
      17           Ruby Torres          Melinda Hamlin  44   f         2022-12-28
      18         Kennedy Allen            Shympia Dang  77   m         2022-12-31
      19         Kennedy Allen        Adrianna Ramirez  90   f         2022-12-27
      20         Kennedy Allen            Miguel Avena  66   m         2022-12-30
      21         Kennedy Allen              Andy Casem  19   m         2023-01-01
      22            Jamie Chun        Zaahira al-Rassi  17   f         2022-12-31
      23 Natasha Coronado-Romo             Daisy Perez  34   f         2023-01-02
      24 Natasha Coronado-Romo      Christina Ambrozic  75   f         2023-01-03
      25            Andy Casem            Ven Silevani  31   m         2022-12-30
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
                            from                      to age sex date_first_contact
      1            Gabriel Berry          Preston Larson  16   m         2022-12-28
      2            Gabriel Berry        Kaitlynne Rieger  40   f         2022-12-29
      3         Kaitlynne Rieger       Danika Shangreaux   9   f         2022-12-31
      4         Kaitlynne Rieger          Jackson Foster  50   m         2022-12-29
      5         Kaitlynne Rieger            Hope Johnson  24   f         2022-12-30
      6        Danika Shangreaux             Sam Summers  10   m         2022-12-29
      7        Danika Shangreaux             Kanani Hong  79   f         2022-12-31
      8        Danika Shangreaux           Walter Mcgill  32   m         2022-12-31
      9        Danika Shangreaux          Nirvana Sierra  39   f         2022-12-25
      10       Danika Shangreaux            Brandon Hall  37   m         2022-12-30
      11       Danika Shangreaux             Kelly Dalke  12   f         2022-12-31
      12             Kanani Hong      Alexandra Clements  14   f         2023-01-01
      13             Kanani Hong            Jose Sanchez  16   m         2022-12-30
      14            Brandon Hall         Cicely Anderson  15   f         2022-12-27
      15            Brandon Hall Marzooqa el-Abdelrahman   2   f         2022-12-30
      16            Brandon Hall             Gienry Sena  65   m         2022-12-26
      17      Alexandra Clements       Khaleel al-Demian  67   m         2022-12-30
      18         Cicely Anderson        Kaitlin Gonzalez  73   f         2023-01-01
      19         Cicely Anderson           Erika Segarra  17   f         2022-12-31
      20         Cicely Anderson         Raymond Kennedy  84   m         2023-01-02
      21         Cicely Anderson            Jakob Galvan   5   m         2023-01-03
      22 Marzooqa el-Abdelrahman           Jennifer Tran  41   f         2022-12-30
      23             Gienry Sena               Kyle Orio  31   m         2023-01-02
      24             Gienry Sena         Travis Chambers  72   m         2022-12-31
      25            Jakob Galvan           Alawi el-Diab  36   m         2022-12-31
         date_last_contact was_case           status
      1         2023-01-01    FALSE   under_followup
      2         2023-01-01     TRUE             case
      3         2023-01-02     TRUE             case
      4         2023-01-03    FALSE lost_to_followup
      5         2023-01-02    FALSE lost_to_followup
      6         2023-01-03    FALSE   under_followup
      7         2023-01-02     TRUE             case
      8         2023-01-02     TRUE             case
      9         2023-01-03    FALSE   under_followup
      10        2023-01-02     TRUE             case
      11        2023-01-02    FALSE   under_followup
      12        2023-01-03     TRUE             case
      13        2023-01-03    FALSE          unknown
      14        2023-01-03     TRUE             case
      15        2023-01-03     TRUE             case
      16        2023-01-02     TRUE             case
      17        2023-01-05    FALSE lost_to_followup
      18        2023-01-04    FALSE lost_to_followup
      19        2023-01-05    FALSE          unknown
      20        2023-01-04    FALSE          unknown
      21        2023-01-03     TRUE             case
      22        2023-01-04    FALSE   under_followup
      23        2023-01-03    FALSE   under_followup
      24        2023-01-06     TRUE             case
      25        2023-01-05    FALSE   under_followup

# sim_contacts works as expected with modified config parameters

    Code
      sim_contacts(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, config = create_config(last_contact_distribution = function(
          n) stats::rpois(n = n, lambda = 5)))
    Output
                          from                      to age sex date_first_contact
      1       Maleeha al-Bilal           Julian Waters  44   m         2022-12-29
      2       Maleeha al-Bilal           Sarah Redding  49   f         2022-12-27
      3          Sarah Redding           Lilliana Sisk  60   f         2022-12-29
      4          Sarah Redding           James Burukie  56   m         2022-12-29
      5          Sarah Redding       Carina Miramontes  49   f         2022-12-30
      6          Lilliana Sisk        Dhaakir el-Faris  50   m         2022-12-31
      7          Lilliana Sisk           Anthony Smith   7   m         2022-12-29
      8          Lilliana Sisk          Robert Fischer  20   m         2022-12-30
      9          Lilliana Sisk           Rebeca Tafoya  24   f         2022-12-29
      10         Lilliana Sisk         Haibaa el-Farah  51   f         2022-12-31
      11         Lilliana Sisk Barrington Merriweather  53   m         2022-12-31
      12         Anthony Smith             Ruby Torres  16   f         2022-12-25
      13         Anthony Smith          Richard Havlik  83   m         2022-12-30
      14       Haibaa el-Farah           Kennedy Allen   2   f         2022-12-31
      15       Haibaa el-Farah              Jamie Chun  48   f         2023-01-01
      16       Haibaa el-Farah   Natasha Coronado-Romo  65   f         2022-12-30
      17           Ruby Torres          Melinda Hamlin  44   f         2022-12-28
      18         Kennedy Allen            Shympia Dang  77   m         2022-12-31
      19         Kennedy Allen        Adrianna Ramirez  90   f         2022-12-27
      20         Kennedy Allen            Miguel Avena  66   m         2022-12-30
      21         Kennedy Allen              Andy Casem  19   m         2023-01-01
      22            Jamie Chun        Zaahira al-Rassi  17   f         2022-12-31
      23 Natasha Coronado-Romo             Daisy Perez  34   f         2023-01-02
      24 Natasha Coronado-Romo      Christina Ambrozic  75   f         2023-01-03
      25            Andy Casem            Ven Silevani  31   m         2022-12-30
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

