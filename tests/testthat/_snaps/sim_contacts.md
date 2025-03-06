# sim_contacts works as expected with defaults

    Code
      sim_contacts()
    Output
                             from                     to age sex date_first_contact
      1  Louis Baltazar-Francisco        Masooma Sheldon  58   f         2022-12-27
      2  Louis Baltazar-Francisco      Rachel Fredericks  29   f         2022-12-30
      3         Rachel Fredericks          Makiah Thomas  24   f         2023-01-12
      4         Rachel Fredericks         Mersadez Swift  42   f         2023-01-11
      5         Rachel Fredericks      Mitchell Sandoval  48   m         2023-01-09
      6             Makiah Thomas       Saahira el-Laham  76   f         2023-01-11
      7             Makiah Thomas           Celsa Bellow  39   f         2023-01-14
      8             Makiah Thomas Stephanie Garcia Mayen  24   f         2023-01-12
      9          Saahira el-Laham        Laurel Lehmkuhl  53   f         2023-01-20
      10   Stephanie Garcia Mayen           Cade Amerson  86   m         2023-01-17
      11   Stephanie Garcia Mayen         Tristan Thomas  40   m         2023-01-16
      12             Cade Amerson Nohelia Kills In Sight  83   f         2023-01-21
      13             Cade Amerson       Sage Wachtendorf  90   m         2023-01-21
      14   Nohelia Kills In Sight        Faalih al-Saleh  35   m         2023-01-28
      15          Faalih al-Saleh            Nasteh Long  43   f         2023-02-01
      16          Faalih al-Saleh        Dominica Abeyta   1   f         2023-01-30
      17          Faalih al-Saleh         Patrick Martin  29   m         2023-02-02
      18          Dominica Abeyta          Bryant Taylor  78   m         2023-02-03
      19          Dominica Abeyta        Arkaan al-Faris  22   m         2023-02-04
      20          Dominica Abeyta          Olivia Carson  70   f         2023-02-03
         date_last_contact was_case           status
      1         2023-01-04        N   under_followup
      2         2023-01-06        Y             case
      3         2023-01-18        Y             case
      4         2023-01-18        N lost_to_followup
      5         2023-01-17        N   under_followup
      6         2023-01-18        Y             case
      7         2023-01-20        N lost_to_followup
      8         2023-01-19        Y             case
      9         2023-01-30        N   under_followup
      10        2023-01-22        Y             case
      11        2023-01-22        N   under_followup
      12        2023-01-31        Y             case
      13        2023-01-26        N   under_followup
      14        2023-02-03        Y             case
      15        2023-02-04        N lost_to_followup
      16        2023-02-06        Y             case
      17        2023-02-09        N   under_followup
      18        2023-02-08        N   under_followup
      19        2023-02-12        Y             case
      20        2023-02-09        N lost_to_followup

# sim_contacts works as expected

    Code
      sim_contacts(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5)
    Output
                     from                      to age sex date_first_contact
      1      Alivia Perez      Barrington Johnson  44   m         2022-12-29
      2      Alivia Perez          Madison Krause  49   f         2022-12-27
      3    Madison Krause            Ashlan Allen  60   f         2022-12-29
      4    Madison Krause          Turfa el-Farah  56   f         2022-12-29
      5    Madison Krause       Nykalous Shumpert  49   m         2022-12-30
      6      Ashlan Allen          Arshad al-Basa  50   m         2022-12-31
      7      Ashlan Allen            Destiny Hart   7   f         2022-12-29
      8      Ashlan Allen            Ronald Welch  20   m         2022-12-30
      9      Ashlan Allen           Simon Pickett  24   m         2022-12-29
      10     Ashlan Allen            Jeramy Fitch  51   m         2022-12-31
      11     Ashlan Allen          Joshua Ryckman  53   m         2022-12-31
      12     Destiny Hart        Janayva Ambrozic  16   f         2022-12-25
      13     Destiny Hart Nicole Vazquez Pallares  83   f         2022-12-30
      14     Jeramy Fitch        Nusaiba al-Rassi   2   f         2022-12-31
      15     Jeramy Fitch            Korren Watts  48   f         2023-01-01
      16     Jeramy Fitch           Shan Saldanha  65   f         2022-12-30
      17 Janayva Ambrozic             Adrian Wang  44   m         2022-12-28
      18 Nusaiba al-Rassi           Luis Quintana  77   m         2022-12-31
      19 Nusaiba al-Rassi       Jonathan Krishnan  90   m         2022-12-27
      20 Nusaiba al-Rassi        Ryanna Vialpando  66   f         2022-12-30
      21 Nusaiba al-Rassi         Alexander Brown  19   m         2023-01-01
      22     Korren Watts          Cruz Hernandez  17   m         2022-12-31
      23    Shan Saldanha        Breanna Crandall  34   f         2023-01-02
      24    Shan Saldanha           Preston Miles  75   m         2023-01-03
      25  Alexander Brown              Drue White  31   m         2022-12-30
         date_last_contact was_case           status
      1         2023-01-04        N   under_followup
      2         2023-01-04        Y             case
      3         2023-01-10        Y             case
      4         2023-01-05        N   under_followup
      5         2023-01-05        N   under_followup
      6         2023-01-03        N          unknown
      7         2023-01-06        Y             case
      8         2023-01-05        Y             case
      9         2023-01-05        N lost_to_followup
      10        2023-01-04        Y             case
      11        2023-01-04        N   under_followup
      12        2023-01-05        Y             case
      13        2023-01-05        N   under_followup
      14        2023-01-03        Y             case
      15        2023-01-02        Y             case
      16        2023-01-05        Y             case
      17        2023-01-09        N   under_followup
      18        2023-01-06        N   under_followup
      19        2023-01-06        N          unknown
      20        2023-01-06        N lost_to_followup
      21        2023-01-10        Y             case
      22        2023-01-06        N   under_followup
      23        2023-01-07        N   under_followup
      24        2023-01-06        Y             case
      25        2023-01-05        N   under_followup

# sim_contacts works as expected with modified config

    Code
      sim_contacts(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, config = create_config(last_contact_distribution = function(
          x) stats::rgeom(n = x, prob = 0.5)))
    Output
                            from                      to age sex date_first_contact
      1            Gabriel Berry          Preston Larson  16   m         2022-12-28
      2            Gabriel Berry        Kaitlynne Rieger  40   f         2022-12-29
      3         Kaitlynne Rieger          Jackson Foster   9   m         2022-12-31
      4         Kaitlynne Rieger       Danika Shangreaux  50   f         2022-12-29
      5         Kaitlynne Rieger            Hope Johnson  24   f         2022-12-30
      6           Jackson Foster             Kanani Hong  10   f         2022-12-29
      7           Jackson Foster             Sam Summers  79   m         2022-12-31
      8           Jackson Foster          Nirvana Sierra  32   f         2022-12-31
      9           Jackson Foster           Walter Mcgill  39   m         2022-12-25
      10          Jackson Foster            Brandon Hall  37   m         2022-12-30
      11          Jackson Foster             Kelly Dalke  12   f         2022-12-31
      12             Sam Summers      Alexandra Clements  14   f         2023-01-01
      13             Sam Summers            Jose Sanchez  16   m         2022-12-30
      14            Brandon Hall         Cicely Anderson  15   f         2022-12-27
      15            Brandon Hall Marzooqa el-Abdelrahman   2   f         2022-12-30
      16            Brandon Hall        Kaitlin Gonzalez  65   f         2022-12-26
      17      Alexandra Clements             Gienry Sena  67   m         2022-12-30
      18         Cicely Anderson       Khaleel al-Demian  73   m         2023-01-01
      19         Cicely Anderson           Erika Segarra  17   f         2022-12-31
      20         Cicely Anderson         Raymond Kennedy  84   m         2023-01-02
      21         Cicely Anderson            Jakob Galvan   5   m         2023-01-03
      22 Marzooqa el-Abdelrahman               Kyle Orio  41   m         2022-12-30
      23        Kaitlin Gonzalez         Travis Chambers  31   m         2023-01-02
      24        Kaitlin Gonzalez           Jennifer Tran  72   f         2022-12-31
      25            Jakob Galvan           Alawi el-Diab  36   m         2022-12-31
         date_last_contact was_case           status
      1         2023-01-01        N   under_followup
      2         2023-01-01        Y             case
      3         2023-01-02        Y             case
      4         2023-01-03        N lost_to_followup
      5         2023-01-02        N lost_to_followup
      6         2023-01-03        N   under_followup
      7         2023-01-02        Y             case
      8         2023-01-02        Y             case
      9         2023-01-03        N   under_followup
      10        2023-01-02        Y             case
      11        2023-01-02        N   under_followup
      12        2023-01-03        Y             case
      13        2023-01-03        N          unknown
      14        2023-01-03        Y             case
      15        2023-01-03        Y             case
      16        2023-01-02        Y             case
      17        2023-01-05        N lost_to_followup
      18        2023-01-04        N lost_to_followup
      19        2023-01-05        N          unknown
      20        2023-01-04        N          unknown
      21        2023-01-03        Y             case
      22        2023-01-04        N   under_followup
      23        2023-01-03        N   under_followup
      24        2023-01-06        Y             case
      25        2023-01-05        N   under_followup

# sim_contacts works as expected with modified config parameters

    Code
      sim_contacts(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, config = create_config(last_contact_distribution = function(
          x) stats::rpois(n = x, lambda = 5)))
    Output
                     from                      to age sex date_first_contact
      1      Alivia Perez      Barrington Johnson  44   m         2022-12-29
      2      Alivia Perez          Madison Krause  49   f         2022-12-27
      3    Madison Krause            Ashlan Allen  60   f         2022-12-29
      4    Madison Krause          Turfa el-Farah  56   f         2022-12-29
      5    Madison Krause       Nykalous Shumpert  49   m         2022-12-30
      6      Ashlan Allen          Arshad al-Basa  50   m         2022-12-31
      7      Ashlan Allen            Destiny Hart   7   f         2022-12-29
      8      Ashlan Allen            Ronald Welch  20   m         2022-12-30
      9      Ashlan Allen           Simon Pickett  24   m         2022-12-29
      10     Ashlan Allen            Jeramy Fitch  51   m         2022-12-31
      11     Ashlan Allen          Joshua Ryckman  53   m         2022-12-31
      12     Destiny Hart        Janayva Ambrozic  16   f         2022-12-25
      13     Destiny Hart Nicole Vazquez Pallares  83   f         2022-12-30
      14     Jeramy Fitch        Nusaiba al-Rassi   2   f         2022-12-31
      15     Jeramy Fitch            Korren Watts  48   f         2023-01-01
      16     Jeramy Fitch           Shan Saldanha  65   f         2022-12-30
      17 Janayva Ambrozic             Adrian Wang  44   m         2022-12-28
      18 Nusaiba al-Rassi           Luis Quintana  77   m         2022-12-31
      19 Nusaiba al-Rassi       Jonathan Krishnan  90   m         2022-12-27
      20 Nusaiba al-Rassi        Ryanna Vialpando  66   f         2022-12-30
      21 Nusaiba al-Rassi         Alexander Brown  19   m         2023-01-01
      22     Korren Watts          Cruz Hernandez  17   m         2022-12-31
      23    Shan Saldanha        Breanna Crandall  34   f         2023-01-02
      24    Shan Saldanha           Preston Miles  75   m         2023-01-03
      25  Alexander Brown              Drue White  31   m         2022-12-30
         date_last_contact was_case           status
      1         2023-01-06        N   under_followup
      2         2023-01-07        Y             case
      3         2023-01-13        Y             case
      4         2023-01-07        N   under_followup
      5         2023-01-07        N   under_followup
      6         2023-01-05        N          unknown
      7         2023-01-08        Y             case
      8         2023-01-07        Y             case
      9         2023-01-07        N lost_to_followup
      10        2023-01-05        Y             case
      11        2023-01-05        N   under_followup
      12        2023-01-07        Y             case
      13        2023-01-07        N   under_followup
      14        2023-01-04        Y             case
      15        2023-01-03        Y             case
      16        2023-01-08        Y             case
      17        2023-01-11        N   under_followup
      18        2023-01-08        N   under_followup
      19        2023-01-08        N          unknown
      20        2023-01-08        N lost_to_followup
      21        2023-01-13        Y             case
      22        2023-01-08        N   under_followup
      23        2023-01-09        N   under_followup
      24        2023-01-08        Y             case
      25        2023-01-06        N   under_followup

# sim_contacts works as expected with age structure

    Code
      sim_contacts(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, population_age = age_struct)
    Output
                      from                  to age sex date_first_contact
      1    Lilliana Urbina    Christian Havlik  51   m         2022-12-29
      2    Lilliana Urbina   Raihaana al-Samra  73   f         2022-12-27
      3  Raihaana al-Samra         Carina Baca  75   f         2022-12-29
      4  Raihaana al-Samra     Tiffanie Cahill  25   f         2022-12-29
      5  Raihaana al-Samra    Antonio Quintana  48   m         2022-12-30
      6        Carina Baca         Austin John  79   m         2022-12-31
      7        Carina Baca      Jamie Stilwell  52   f         2022-12-29
      8        Carina Baca      Luis Hernandez  63   m         2022-12-30
      9        Carina Baca       Hyungu Dorado  37   m         2022-12-29
      10       Carina Baca     Brentt Spangler  34   m         2022-12-31
      11       Carina Baca        Matthew Cree  88   m         2022-12-31
      12    Jamie Stilwell       Rebeca Chavez  80   f         2022-12-25
      13    Jamie Stilwell     Katelyn Harrier  78   f         2022-12-30
      14   Brentt Spangler         Ruby Gaspar  10   f         2022-12-31
      15   Brentt Spangler     Mufeeda el-Ozer  77   f         2023-01-01
      16   Brentt Spangler       Natasha Vigil  80   f         2022-12-30
      17     Rebeca Chavez         Neil Yousaf  18   m         2022-12-28
      18       Ruby Gaspar        Shympia Kwak  61   m         2022-12-31
      19       Ruby Gaspar        Julian Berry  33   m         2022-12-27
      20       Ruby Gaspar          Sara Young  42   f         2022-12-30
      21       Ruby Gaspar     Wallace Eriacho  60   m         2023-01-01
      22   Mufeeda el-Ozer            Andy Lee  25   m         2022-12-31
      23     Natasha Vigil     Adrianna Torres  81   f         2023-01-02
      24     Natasha Vigil James Wilson-Parson  66   m         2023-01-03
      25   Wallace Eriacho     Anthony Johnson  88   m         2022-12-30
         date_last_contact was_case         status
      1         2023-01-04        N under_followup
      2         2023-01-04        Y           case
      3         2023-01-10        Y           case
      4         2023-01-05        N under_followup
      5         2023-01-05        N under_followup
      6         2023-01-03        N under_followup
      7         2023-01-06        Y           case
      8         2023-01-05        Y           case
      9         2023-01-05        N under_followup
      10        2023-01-04        Y           case
      11        2023-01-04        N under_followup
      12        2023-01-05        Y           case
      13        2023-01-05        N under_followup
      14        2023-01-03        Y           case
      15        2023-01-02        Y           case
      16        2023-01-05        Y           case
      17        2023-01-09        N        unknown
      18        2023-01-06        N under_followup
      19        2023-01-06        N under_followup
      20        2023-01-06        N        unknown
      21        2023-01-10        Y           case
      22        2023-01-06        N under_followup
      23        2023-01-07        N under_followup
      24        2023-01-06        Y           case
      25        2023-01-05        N under_followup

