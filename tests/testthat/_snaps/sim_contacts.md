# sim_contacts works as expected

    Code
      sim_contacts(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5)
    Output
                        from                  to age sex date_first_contact
      1  Thao Yokota-Stroman      Sammi Elizondo  62   f         2023-01-02
      2  Thao Yokota-Stroman       Audrey Ostrom  20   f         2023-01-04
      3       Sammi Elizondo Ghaamid al-Abdallah  29   m         2023-01-05
      4       Sammi Elizondo     Faadil al-Toure  42   m         2023-01-03
      5       Sammi Elizondo          Tami Hicar  60   f         2023-01-02
      6       Sammi Elizondo      Kristin Gentry  65   f         2022-12-31
      7      Faadil al-Toure        Elias Schell  28   m         2023-01-02
      8      Faadil al-Toure   Stephanie Quezada  78   f         2022-12-30
      9           Tami Hicar         Alison Pham  31   f         2023-01-06
      10          Tami Hicar        Joe Martinez  12   m         2023-01-04
      11          Tami Hicar    Muneera al-Nazir  80   f         2023-01-03
      12        Elias Schell         Alea Butler  44   f         2022-12-30
      13        Elias Schell          Neal Amery  74   m         2023-01-01
      14        Elias Schell          Luis Mejia  26   m         2023-01-07
      15        Elias Schell       Awad el-Amara  33   m         2023-01-04
      16        Elias Schell        Joseph Plutt   4   m         2022-12-31
      17         Alison Pham    Cleevens Thrower  53   m         2023-01-06
      18       Awad el-Amara      James Smith Jr  86   m         2023-01-06
      19      James Smith Jr        Kalia Truong  89   f         2023-01-05
      20      James Smith Jr         Mary Weaver  24   f         2023-01-07
      21      James Smith Jr      Sydney Aguilar  37   f         2023-01-06
      22      Sydney Aguilar       Mariah Garcia  15   f         2023-01-07
      23       Mariah Garcia        Cade Gilbert  14   m         2023-01-06
      24       Mariah Garcia          Travis Roy  81   m         2023-01-07
      25          Travis Roy            Marc Xue  82   m         2023-01-07
      26            Marc Xue     Mathew Mcintire  72   m         2023-01-10
      27            Marc Xue        Steven Smith  53   m         2023-01-10
      28            Marc Xue     Cleevens Taylor  56   m         2023-01-05
      29     Mathew Mcintire    Saisuriya Wilson  71   m         2023-01-11
      30     Mathew Mcintire     Alejandro Lopez  50   m         2023-01-08
      31     Mathew Mcintire       Dakota Harvie  73   m         2023-01-07
      32     Mathew Mcintire  Nabeela al-Rahmani  20   f         2023-01-08
      33    Saisuriya Wilson      Jerry Williams  75   m         2023-01-15
      34    Saisuriya Wilson Manaahil al-Ebrahim   2   f         2023-01-17
      35     Alejandro Lopez   Kelsey Mcclintock   3   f         2023-01-12
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
      11        2023-01-05        N lost_to_followup
      12        2023-01-03        N   under_followup
      13        2023-01-05        N lost_to_followup
      14        2023-01-08        N   under_followup
      15        2023-01-05        Y             case
      16        2023-01-04        N lost_to_followup
      17        2023-01-09        N   under_followup
      18        2023-01-07        Y             case
      19        2023-01-06        N   under_followup
      20        2023-01-08        N lost_to_followup
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
      33        2023-01-15        N   under_followup
      34        2023-01-18        N   under_followup
      35        2023-01-14        Y             case

# sim_contacts works as expected with modified config

    Code
      sim_contacts(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, config = create_config(last_contact_distribution = "geom",
          last_contact_distribution_params = c(prob = 0.5)))
    Output
                        from                      to age sex date_first_contact
      1        Hannah Keeler       Sabeeka al-Mattar   2   f         2022-12-31
      2        Hannah Keeler           Andrew Eckman   3   m         2022-12-31
      3    Sabeeka al-Mattar         Josiah Williams  38   m         2023-01-01
      4    Sabeeka al-Mattar     Karie Phanthavongsa  15   f         2023-01-01
      5    Sabeeka al-Mattar       Laura Ann Daniels  28   f         2022-12-31
      6    Sabeeka al-Mattar Josue Aguilera-Aguilera  55   m         2022-12-29
      7  Karie Phanthavongsa              Khanh Long  69   m         2022-12-31
      8  Karie Phanthavongsa              Aleia Pope  78   f         2022-12-31
      9    Laura Ann Daniels          Astitwa Czajka  37   m         2023-01-02
      10   Laura Ann Daniels               Sara Fish  43   f         2023-01-03
      11   Laura Ann Daniels              Jung Allen  81   m         2022-12-28
      12          Khanh Long           Xylonna Curry   1   f         2023-01-02
      13          Khanh Long               Joe Ortiz  90   m         2022-12-31
      14          Khanh Long           Danica Boykin  45   f         2023-01-01
      15          Khanh Long          Joshua Jackson  83   m         2023-01-01
      16          Khanh Long        Afeef al-Shaheen  90   m         2022-12-28
      17      Astitwa Czajka         Elijah Hartmann  23   m         2023-01-02
      18      Joshua Jackson      Nasreen al-Salameh  68   f         2022-12-30
      19  Nasreen al-Salameh      Menandez Tall Bull  80   m         2022-12-31
      20  Nasreen al-Salameh           Sarah Elliott  57   f         2023-01-01
      21  Nasreen al-Salameh          Sahar el-Hasan  52   f         2023-01-02
      22      Sahar el-Hasan        Mitchell Jackson  80   m         2023-01-02
      23    Mitchell Jackson        Ty' Esha Wilkins  34   f         2022-12-30
      24    Mitchell Jackson      Jazmine Watkins IV  35   f         2023-01-05
      25  Jazmine Watkins IV        Daleel al-Shahan  74   m         2023-01-05
      26    Daleel al-Shahan        Shabaan el-Pasha  70   m         2023-01-04
      27    Daleel al-Shahan            Steven Eagle  60   m         2023-01-07
      28    Daleel al-Shahan      Caleb Mbasi-Botuli  39   m         2023-01-07
      29    Shabaan el-Pasha          Melissa Ingham  49   f         2023-01-06
      30    Shabaan el-Pasha       Mahbooba al-Fadel  87   f         2023-01-12
      31    Shabaan el-Pasha      Mukarram al-Greiss  62   m         2023-01-07
      32    Shabaan el-Pasha        Leeann Lakkaraju  33   f         2023-01-02
      33      Melissa Ingham         Sadeeqa el-Aman  35   f         2023-01-07
      34      Melissa Ingham           Devante Owens  11   m         2023-01-13
      35   Mahbooba al-Fadel      Jordan Greene-King  13   m         2023-01-07
         date_last_contact was_case           status
      1         2023-01-01        Y             case
      2         2023-01-02        N   under_followup
      3         2023-01-02        N          unknown
      4         2023-01-02        Y             case
      5         2023-01-05        Y             case
      6         2023-01-02        N   under_followup
      7         2023-01-02        Y             case
      8         2023-01-03        Y             case
      9         2023-01-03        Y             case
      10        2023-01-05        N   under_followup
      11        2023-01-04        N   under_followup
      12        2023-01-05        N lost_to_followup
      13        2023-01-04        N   under_followup
      14        2023-01-03        N          unknown
      15        2023-01-03        Y             case
      16        2023-01-05        N          unknown
      17        2023-01-07        N lost_to_followup
      18        2023-01-05        Y             case
      19        2023-01-04        N lost_to_followup
      20        2023-01-05        N   under_followup
      21        2023-01-04        Y             case
      22        2023-01-06        Y             case
      23        2023-01-06        N lost_to_followup
      24        2023-01-07        Y             case
      25        2023-01-07        Y             case
      26        2023-01-08        Y             case
      27        2023-01-08        N   under_followup
      28        2023-01-09        N   under_followup
      29        2023-01-09        Y             case
      30        2023-01-13        Y             case
      31        2023-01-10        N   under_followup
      32        2023-01-09        N   under_followup
      33        2023-01-15        N   under_followup
      34        2023-01-14        N   under_followup
      35        2023-01-10        Y             case

# sim_contacts works as expected with modified config parameters

    Code
      sim_contacts(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, config = create_config(last_contact_distribution_params = c(
          lambda = 5)))
    Output
                        from                  to age sex date_first_contact
      1  Thao Yokota-Stroman      Sammi Elizondo  62   f         2023-01-04
      2  Thao Yokota-Stroman       Audrey Ostrom  20   f         2023-01-07
      3       Sammi Elizondo Ghaamid al-Abdallah  29   m         2023-01-08
      4       Sammi Elizondo     Faadil al-Toure  42   m         2023-01-05
      5       Sammi Elizondo          Tami Hicar  60   f         2023-01-03
      6       Sammi Elizondo      Kristin Gentry  65   f         2023-01-02
      7      Faadil al-Toure        Elias Schell  28   m         2023-01-04
      8      Faadil al-Toure   Stephanie Quezada  78   f         2023-01-01
      9           Tami Hicar         Alison Pham  31   f         2023-01-08
      10          Tami Hicar        Joe Martinez  12   m         2023-01-06
      11          Tami Hicar    Muneera al-Nazir  80   f         2023-01-04
      12        Elias Schell         Alea Butler  44   f         2023-01-01
      13        Elias Schell          Neal Amery  74   m         2023-01-03
      14        Elias Schell          Luis Mejia  26   m         2023-01-09
      15        Elias Schell       Awad el-Amara  33   m         2023-01-06
      16        Elias Schell        Joseph Plutt   4   m         2023-01-02
      17         Alison Pham    Cleevens Thrower  53   m         2023-01-08
      18       Awad el-Amara      James Smith Jr  86   m         2023-01-09
      19      James Smith Jr        Kalia Truong  89   f         2023-01-07
      20      James Smith Jr         Mary Weaver  24   f         2023-01-09
      21      James Smith Jr      Sydney Aguilar  37   f         2023-01-08
      22      Sydney Aguilar       Mariah Garcia  15   f         2023-01-09
      23       Mariah Garcia        Cade Gilbert  14   m         2023-01-07
      24       Mariah Garcia          Travis Roy  81   m         2023-01-09
      25          Travis Roy            Marc Xue  82   m         2023-01-09
      26            Marc Xue     Mathew Mcintire  72   m         2023-01-12
      27            Marc Xue        Steven Smith  53   m         2023-01-13
      28            Marc Xue     Cleevens Taylor  56   m         2023-01-07
      29     Mathew Mcintire    Saisuriya Wilson  71   m         2023-01-13
      30     Mathew Mcintire     Alejandro Lopez  50   m         2023-01-09
      31     Mathew Mcintire       Dakota Harvie  73   m         2023-01-08
      32     Mathew Mcintire  Nabeela al-Rahmani  20   f         2023-01-10
      33    Saisuriya Wilson      Jerry Williams  75   m         2023-01-17
      34    Saisuriya Wilson Manaahil al-Ebrahim   2   f         2023-01-20
      35     Alejandro Lopez   Kelsey Mcclintock   3   f         2023-01-14
         date_last_contact was_case           status
      1         2023-01-07        Y             case
      2         2023-01-10        N   under_followup
      3         2023-01-11        N   under_followup
      4         2023-01-06        Y             case
      5         2023-01-05        Y             case
      6         2023-01-05        N   under_followup
      7         2023-01-06        Y             case
      8         2023-01-07        Y             case
      9         2023-01-11        Y             case
      10        2023-01-08        N   under_followup
      11        2023-01-06        N lost_to_followup
      12        2023-01-05        N   under_followup
      13        2023-01-07        N lost_to_followup
      14        2023-01-10        N   under_followup
      15        2023-01-07        Y             case
      16        2023-01-06        N lost_to_followup
      17        2023-01-11        N   under_followup
      18        2023-01-10        Y             case
      19        2023-01-08        N   under_followup
      20        2023-01-10        N lost_to_followup
      21        2023-01-10        Y             case
      22        2023-01-10        Y             case
      23        2023-01-09        N   under_followup
      24        2023-01-10        Y             case
      25        2023-01-11        Y             case
      26        2023-01-13        Y             case
      27        2023-01-16        N   under_followup
      28        2023-01-11        N   under_followup
      29        2023-01-13        Y             case
      30        2023-01-12        Y             case
      31        2023-01-13        N   under_followup
      32        2023-01-12        N   under_followup
      33        2023-01-17        N   under_followup
      34        2023-01-21        N   under_followup
      35        2023-01-16        Y             case

# sim_contacts works as expected with age structure

    Code
      sim_contacts(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, population_age = age_struct)
    Output
                        from                  to age sex date_first_contact
      1         Shelbi Vitry     Kathryn Lapitan  76   f         2023-01-02
      2         Shelbi Vitry      Larissa Wisham  65   f         2023-01-04
      3      Kathryn Lapitan      Preston Miller  35   m         2023-01-05
      4      Kathryn Lapitan          Derek Choi   9   m         2023-01-03
      5      Kathryn Lapitan Chloe Moreno-Ferrel  89   f         2023-01-02
      6      Kathryn Lapitan        Lisa Johnson  36   f         2022-12-31
      7           Derek Choi         Jacob Begay  16   m         2023-01-02
      8           Derek Choi  Mia Yokota-Stroman  82   f         2022-12-30
      9  Chloe Moreno-Ferrel       Deja Elizondo  27   f         2023-01-06
      10 Chloe Moreno-Ferrel         Jacob Glaub  35   m         2023-01-04
      11 Chloe Moreno-Ferrel      Shandre Ostrom   2   f         2023-01-03
      12         Jacob Begay         Kylie Hicar   6   f         2022-12-30
      13         Jacob Begay        Woo Bin Park  23   m         2023-01-01
      14         Jacob Begay       Jayson Brooks  90   m         2023-01-07
      15         Jacob Begay         Mario Jones  47   m         2023-01-04
      16         Jacob Begay             Tai Ali  64   m         2022-12-31
      17       Deja Elizondo    Ronald Burgdorff  16   m         2023-01-06
      18         Mario Jones        Rodrigo Leal  85   m         2023-01-06
      19        Rodrigo Leal        Kelia Gentry  42   f         2023-01-05
      20        Rodrigo Leal          Ana Romero  26   f         2023-01-07
      21        Rodrigo Leal           Thao Pham  57   f         2023-01-06
      22           Thao Pham    Nabeela al-Nazir  89   f         2023-01-07
      23    Nabeela al-Nazir        David Nguyen  21   m         2023-01-06
      24    Nabeela al-Nazir       Joshua Valeta  90   m         2023-01-07
      25       Joshua Valeta         Evan Browne  48   m         2023-01-07
      26         Evan Browne        Jordan Brown  62   m         2023-01-10
      27         Evan Browne       Leighton Chun  20   m         2023-01-10
      28         Evan Browne    Raymond Martinez   4   m         2023-01-05
      29        Jordan Brown       Jalen Thrower   9   m         2023-01-11
      30        Jordan Brown   Cleevens Smith Jr  29   m         2023-01-08
      31        Jordan Brown      Saleel el-Dada  32   m         2023-01-07
      32        Jordan Brown       Lashon Butler  82   f         2023-01-08
      33       Jalen Thrower  Suhail al-Abdallah  75   m         2023-01-15
      34       Jalen Thrower       Alison Truong   2   f         2023-01-17
      35   Cleevens Smith Jr         Emma Weaver  79   f         2023-01-12
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
      11        2023-01-05        N lost_to_followup
      12        2023-01-03        N   under_followup
      13        2023-01-05        N   under_followup
      14        2023-01-08        N          unknown
      15        2023-01-05        Y             case
      16        2023-01-04        N lost_to_followup
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
      31        2023-01-12        N lost_to_followup
      32        2023-01-10        N   under_followup
      33        2023-01-15        N lost_to_followup
      34        2023-01-18        N   under_followup
      35        2023-01-14        Y             case

