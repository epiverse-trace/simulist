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
      7      Faadil al-Toure        Elias Schell  28   m         2023-01-01
      8      Faadil al-Toure   Stephanie Quezada  78   f         2022-12-29
      9           Tami Hicar         Alison Pham  31   f         2023-01-04
      10          Tami Hicar        Joe Martinez  12   m         2023-01-02
      11          Tami Hicar    Muneera al-Nazir  80   f         2023-01-01
      12        Elias Schell         Alea Butler  44   f         2022-12-29
      13        Elias Schell          Neal Amery  74   m         2022-12-31
      14        Elias Schell          Luis Mejia  26   m         2023-01-06
      15        Elias Schell       Awad el-Amara  33   m         2023-01-03
      16        Elias Schell        Joseph Plutt   4   m         2022-12-30
      17         Alison Pham    Cleevens Thrower  53   m         2023-01-03
      18       Awad el-Amara      James Smith Jr  86   m         2023-01-03
      19      James Smith Jr        Kalia Truong  89   f         2023-01-02
      20      James Smith Jr         Mary Weaver  24   f         2023-01-04
      21      James Smith Jr      Sydney Aguilar  37   f         2023-01-03
      22      Sydney Aguilar       Mariah Garcia  15   f         2023-01-03
      23       Mariah Garcia        Cade Gilbert  14   m         2023-01-02
      24       Mariah Garcia          Travis Roy  81   m         2023-01-03
      25          Travis Roy            Marc Xue  82   m         2023-01-02
      26            Marc Xue     Mathew Mcintire  72   m         2023-01-03
      27            Marc Xue        Steven Smith  53   m         2023-01-03
      28            Marc Xue     Cleevens Taylor  56   m         2022-12-29
      29     Mathew Mcintire    Saisuriya Wilson  71   m         2023-01-04
      30     Mathew Mcintire     Alejandro Lopez  50   m         2023-01-01
      31     Mathew Mcintire       Dakota Harvie  73   m         2022-12-31
      32     Mathew Mcintire  Nabeela al-Rahmani  20   f         2023-01-01
      33    Saisuriya Wilson      Jerry Williams  75   m         2023-01-06
      34    Saisuriya Wilson Manaahil al-Ebrahim   2   f         2023-01-08
      35     Alejandro Lopez   Kelsey Mcclintock   3   f         2023-01-03
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-07        N   under_followup
      3         2023-01-08        N   under_followup
      4         2023-01-04        Y             case
      5         2023-01-04        Y             case
      6         2023-01-03        N   under_followup
      7         2023-01-03        Y             case
      8         2023-01-04        Y             case
      9         2023-01-07        Y             case
      10        2023-01-04        N   under_followup
      11        2023-01-03        N lost_to_followup
      12        2023-01-02        N   under_followup
      13        2023-01-04        N lost_to_followup
      14        2023-01-07        N   under_followup
      15        2023-01-04        Y             case
      16        2023-01-03        N lost_to_followup
      17        2023-01-06        N   under_followup
      18        2023-01-04        Y             case
      19        2023-01-03        N   under_followup
      20        2023-01-05        N lost_to_followup
      21        2023-01-05        Y             case
      22        2023-01-04        Y             case
      23        2023-01-04        N   under_followup
      24        2023-01-04        Y             case
      25        2023-01-04        Y             case
      26        2023-01-04        Y             case
      27        2023-01-06        N   under_followup
      28        2023-01-02        N   under_followup
      29        2023-01-04        Y             case
      30        2023-01-04        Y             case
      31        2023-01-05        N   under_followup
      32        2023-01-03        N   under_followup
      33        2023-01-06        N   under_followup
      34        2023-01-09        N   under_followup
      35        2023-01-05        Y             case

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
      7  Karie Phanthavongsa              Khanh Long  69   m         2022-12-30
      8  Karie Phanthavongsa              Aleia Pope  78   f         2022-12-30
      9    Laura Ann Daniels          Astitwa Czajka  37   m         2022-12-31
      10   Laura Ann Daniels               Sara Fish  43   f         2023-01-01
      11   Laura Ann Daniels              Jung Allen  81   m         2022-12-26
      12          Khanh Long           Xylonna Curry   1   f         2023-01-01
      13          Khanh Long               Joe Ortiz  90   m         2022-12-30
      14          Khanh Long           Danica Boykin  45   f         2022-12-31
      15          Khanh Long          Joshua Jackson  83   m         2022-12-31
      16          Khanh Long        Afeef al-Shaheen  90   m         2022-12-27
      17      Astitwa Czajka         Elijah Hartmann  23   m         2022-12-30
      18      Joshua Jackson      Nasreen al-Salameh  68   f         2022-12-27
      19  Nasreen al-Salameh      Menandez Tall Bull  80   m         2022-12-28
      20  Nasreen al-Salameh           Sarah Elliott  57   f         2022-12-29
      21  Nasreen al-Salameh          Sahar el-Hasan  52   f         2022-12-30
      22      Sahar el-Hasan        Mitchell Jackson  80   m         2022-12-29
      23    Mitchell Jackson        Ty' Esha Wilkins  34   f         2022-12-26
      24    Mitchell Jackson      Jazmine Watkins IV  35   f         2023-01-01
      25  Jazmine Watkins IV        Daleel al-Shahan  74   m         2022-12-31
      26    Daleel al-Shahan        Shabaan el-Pasha  70   m         2022-12-28
      27    Daleel al-Shahan            Steven Eagle  60   m         2022-12-31
      28    Daleel al-Shahan      Caleb Mbasi-Botuli  39   m         2022-12-31
      29    Shabaan el-Pasha          Melissa Ingham  49   f         2022-12-30
      30    Shabaan el-Pasha       Mahbooba al-Fadel  87   f         2023-01-05
      31    Shabaan el-Pasha      Mukarram al-Greiss  62   m         2022-12-31
      32    Shabaan el-Pasha        Leeann Lakkaraju  33   f         2022-12-26
      33      Melissa Ingham         Sadeeqa el-Aman  35   f         2022-12-29
      34      Melissa Ingham           Devante Owens  11   m         2023-01-04
      35   Mahbooba al-Fadel      Jordan Greene-King  13   m         2022-12-29
         date_last_contact was_case           status
      1         2023-01-01        Y             case
      2         2023-01-02        N   under_followup
      3         2023-01-02        N          unknown
      4         2023-01-02        Y             case
      5         2023-01-05        Y             case
      6         2023-01-02        N   under_followup
      7         2023-01-01        Y             case
      8         2023-01-02        Y             case
      9         2023-01-01        Y             case
      10        2023-01-03        N   under_followup
      11        2023-01-02        N   under_followup
      12        2023-01-04        N lost_to_followup
      13        2023-01-03        N   under_followup
      14        2023-01-02        N          unknown
      15        2023-01-02        Y             case
      16        2023-01-04        N          unknown
      17        2023-01-04        N lost_to_followup
      18        2023-01-02        Y             case
      19        2023-01-01        N lost_to_followup
      20        2023-01-02        N   under_followup
      21        2023-01-01        Y             case
      22        2023-01-02        Y             case
      23        2023-01-02        N lost_to_followup
      24        2023-01-03        Y             case
      25        2023-01-02        Y             case
      26        2023-01-01        Y             case
      27        2023-01-01        N   under_followup
      28        2023-01-02        N   under_followup
      29        2023-01-02        Y             case
      30        2023-01-06        Y             case
      31        2023-01-03        N   under_followup
      32        2023-01-02        N   under_followup
      33        2023-01-06        N   under_followup
      34        2023-01-05        N   under_followup
      35        2023-01-01        Y             case

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
      7      Faadil al-Toure        Elias Schell  28   m         2023-01-03
      8      Faadil al-Toure   Stephanie Quezada  78   f         2022-12-31
      9           Tami Hicar         Alison Pham  31   f         2023-01-06
      10          Tami Hicar        Joe Martinez  12   m         2023-01-04
      11          Tami Hicar    Muneera al-Nazir  80   f         2023-01-02
      12        Elias Schell         Alea Butler  44   f         2022-12-31
      13        Elias Schell          Neal Amery  74   m         2023-01-02
      14        Elias Schell          Luis Mejia  26   m         2023-01-08
      15        Elias Schell       Awad el-Amara  33   m         2023-01-05
      16        Elias Schell        Joseph Plutt   4   m         2023-01-01
      17         Alison Pham    Cleevens Thrower  53   m         2023-01-05
      18       Awad el-Amara      James Smith Jr  86   m         2023-01-06
      19      James Smith Jr        Kalia Truong  89   f         2023-01-04
      20      James Smith Jr         Mary Weaver  24   f         2023-01-06
      21      James Smith Jr      Sydney Aguilar  37   f         2023-01-05
      22      Sydney Aguilar       Mariah Garcia  15   f         2023-01-05
      23       Mariah Garcia        Cade Gilbert  14   m         2023-01-03
      24       Mariah Garcia          Travis Roy  81   m         2023-01-05
      25          Travis Roy            Marc Xue  82   m         2023-01-04
      26            Marc Xue     Mathew Mcintire  72   m         2023-01-05
      27            Marc Xue        Steven Smith  53   m         2023-01-06
      28            Marc Xue     Cleevens Taylor  56   m         2022-12-31
      29     Mathew Mcintire    Saisuriya Wilson  71   m         2023-01-06
      30     Mathew Mcintire     Alejandro Lopez  50   m         2023-01-02
      31     Mathew Mcintire       Dakota Harvie  73   m         2023-01-01
      32     Mathew Mcintire  Nabeela al-Rahmani  20   f         2023-01-03
      33    Saisuriya Wilson      Jerry Williams  75   m         2023-01-08
      34    Saisuriya Wilson Manaahil al-Ebrahim   2   f         2023-01-11
      35     Alejandro Lopez   Kelsey Mcclintock   3   f         2023-01-05
         date_last_contact was_case           status
      1         2023-01-07        Y             case
      2         2023-01-10        N   under_followup
      3         2023-01-11        N   under_followup
      4         2023-01-06        Y             case
      5         2023-01-05        Y             case
      6         2023-01-05        N   under_followup
      7         2023-01-05        Y             case
      8         2023-01-06        Y             case
      9         2023-01-09        Y             case
      10        2023-01-06        N   under_followup
      11        2023-01-04        N lost_to_followup
      12        2023-01-04        N   under_followup
      13        2023-01-06        N lost_to_followup
      14        2023-01-09        N   under_followup
      15        2023-01-06        Y             case
      16        2023-01-05        N lost_to_followup
      17        2023-01-08        N   under_followup
      18        2023-01-07        Y             case
      19        2023-01-05        N   under_followup
      20        2023-01-07        N lost_to_followup
      21        2023-01-07        Y             case
      22        2023-01-06        Y             case
      23        2023-01-05        N   under_followup
      24        2023-01-06        Y             case
      25        2023-01-06        Y             case
      26        2023-01-06        Y             case
      27        2023-01-09        N   under_followup
      28        2023-01-04        N   under_followup
      29        2023-01-06        Y             case
      30        2023-01-05        Y             case
      31        2023-01-06        N   under_followup
      32        2023-01-05        N   under_followup
      33        2023-01-08        N   under_followup
      34        2023-01-12        N   under_followup
      35        2023-01-07        Y             case

