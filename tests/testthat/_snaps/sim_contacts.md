# sim_contacts works as expected

    Code
      sim_contacts(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5)
    Output
                        from                  to age gender date_first_contact
      2  Thao Yokota-Stroman      Sammi Elizondo  62      f         2023-01-02
      3  Thao Yokota-Stroman       Audrey Ostrom  20      f         2023-01-04
      4       Sammi Elizondo Ghaamid al-Abdallah  29      m         2023-01-05
      5       Sammi Elizondo     Faadil al-Toure  42      m         2023-01-03
      6       Sammi Elizondo          Tami Hicar  60      f         2023-01-02
      7       Sammi Elizondo      Kristin Gentry  65      f         2022-12-31
      8      Faadil al-Toure        Elias Schell  28      m         2023-01-01
      9      Faadil al-Toure   Stephanie Quezada  78      f         2022-12-29
      10          Tami Hicar         Alison Pham  31      f         2023-01-04
      11          Tami Hicar        Joe Martinez  12      m         2023-01-02
      12          Tami Hicar    Muneera al-Nazir  80      f         2023-01-01
      13        Elias Schell         Alea Butler  44      f         2022-12-29
      14        Elias Schell          Neal Amery  74      m         2022-12-31
      15        Elias Schell          Luis Mejia  26      m         2023-01-06
      16        Elias Schell       Awad el-Amara  33      m         2023-01-03
      17        Elias Schell        Joseph Plutt   4      m         2022-12-30
      18         Alison Pham    Cleevens Thrower  53      m         2023-01-03
      19       Awad el-Amara      James Smith Jr  86      m         2023-01-03
      20      James Smith Jr        Kalia Truong  89      f         2023-01-02
      21      James Smith Jr         Mary Weaver  24      f         2023-01-04
      22      James Smith Jr      Sydney Aguilar  37      f         2023-01-03
      23      Sydney Aguilar       Mariah Garcia  15      f         2023-01-03
      24       Mariah Garcia        Cade Gilbert  14      m         2023-01-02
      25       Mariah Garcia          Travis Roy  81      m         2023-01-03
      26          Travis Roy            Marc Xue  82      m         2023-01-02
      27            Marc Xue     Mathew Mcintire  72      m         2023-01-03
      28            Marc Xue        Steven Smith  53      m         2023-01-03
      29            Marc Xue     Cleevens Taylor  56      m         2022-12-29
      30     Mathew Mcintire    Saisuriya Wilson  71      m         2023-01-04
      31     Mathew Mcintire     Alejandro Lopez  50      m         2023-01-01
      32     Mathew Mcintire       Dakota Harvie  73      m         2022-12-31
      33     Mathew Mcintire  Nabeela al-Rahmani  20      f         2023-01-01
      34    Saisuriya Wilson      Jerry Williams  75      m         2023-01-06
      35    Saisuriya Wilson Manaahil al-Ebrahim   2      f         2023-01-08
      36     Alejandro Lopez   Kelsey Mcclintock   3      f         2023-01-03
         date_last_contact was_case           status
      2         2023-01-05        Y             case
      3         2023-01-07        N   under_followup
      4         2023-01-08        N   under_followup
      5         2023-01-04        Y             case
      6         2023-01-04        Y             case
      7         2023-01-03        N   under_followup
      8         2023-01-03        Y             case
      9         2023-01-04        Y             case
      10        2023-01-07        Y             case
      11        2023-01-04        N   under_followup
      12        2023-01-03        N lost_to_followup
      13        2023-01-02        N   under_followup
      14        2023-01-04        N lost_to_followup
      15        2023-01-07        N   under_followup
      16        2023-01-04        Y             case
      17        2023-01-03        N lost_to_followup
      18        2023-01-06        N   under_followup
      19        2023-01-04        Y             case
      20        2023-01-03        N   under_followup
      21        2023-01-05        N lost_to_followup
      22        2023-01-05        Y             case
      23        2023-01-04        Y             case
      24        2023-01-04        N   under_followup
      25        2023-01-04        Y             case
      26        2023-01-04        Y             case
      27        2023-01-04        Y             case
      28        2023-01-06        N   under_followup
      29        2023-01-02        N   under_followup
      30        2023-01-04        Y             case
      31        2023-01-04        Y             case
      32        2023-01-05        N   under_followup
      33        2023-01-03        N   under_followup
      34        2023-01-06        N   under_followup
      35        2023-01-09        N   under_followup
      36        2023-01-05        Y             case

# sim_contacts works as expected with modified config

    Code
      sim_contacts(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, config = create_config(last_contact_distribution = "geom",
          last_contact_distribution_params = c(prob = 0.5)))
    Output
                        from                      to age gender date_first_contact
      2        Hannah Keeler       Sabeeka al-Mattar   2      f         2022-12-31
      3        Hannah Keeler           Andrew Eckman   3      m         2022-12-31
      4    Sabeeka al-Mattar         Josiah Williams  38      m         2023-01-01
      5    Sabeeka al-Mattar     Karie Phanthavongsa  15      f         2023-01-01
      6    Sabeeka al-Mattar       Laura Ann Daniels  28      f         2022-12-31
      7    Sabeeka al-Mattar Josue Aguilera-Aguilera  55      m         2022-12-29
      8  Karie Phanthavongsa              Khanh Long  69      m         2022-12-30
      9  Karie Phanthavongsa              Aleia Pope  78      f         2022-12-30
      10   Laura Ann Daniels          Astitwa Czajka  37      m         2022-12-31
      11   Laura Ann Daniels               Sara Fish  43      f         2023-01-01
      12   Laura Ann Daniels              Jung Allen  81      m         2022-12-26
      13          Khanh Long           Xylonna Curry   1      f         2023-01-01
      14          Khanh Long               Joe Ortiz  90      m         2022-12-30
      15          Khanh Long           Danica Boykin  45      f         2022-12-31
      16          Khanh Long          Joshua Jackson  83      m         2022-12-31
      17          Khanh Long        Afeef al-Shaheen  90      m         2022-12-27
      18      Astitwa Czajka         Elijah Hartmann  23      m         2022-12-30
      19      Joshua Jackson      Nasreen al-Salameh  68      f         2022-12-27
      20  Nasreen al-Salameh      Menandez Tall Bull  80      m         2022-12-28
      21  Nasreen al-Salameh           Sarah Elliott  57      f         2022-12-29
      22  Nasreen al-Salameh          Sahar el-Hasan  52      f         2022-12-30
      23      Sahar el-Hasan        Mitchell Jackson  80      m         2022-12-29
      24    Mitchell Jackson        Ty' Esha Wilkins  34      f         2022-12-26
      25    Mitchell Jackson      Jazmine Watkins IV  35      f         2023-01-01
      26  Jazmine Watkins IV        Daleel al-Shahan  74      m         2022-12-31
      27    Daleel al-Shahan        Shabaan el-Pasha  70      m         2022-12-28
      28    Daleel al-Shahan            Steven Eagle  60      m         2022-12-31
      29    Daleel al-Shahan      Caleb Mbasi-Botuli  39      m         2022-12-31
      30    Shabaan el-Pasha          Melissa Ingham  49      f         2022-12-30
      31    Shabaan el-Pasha       Mahbooba al-Fadel  87      f         2023-01-05
      32    Shabaan el-Pasha      Mukarram al-Greiss  62      m         2022-12-31
      33    Shabaan el-Pasha        Leeann Lakkaraju  33      f         2022-12-26
      34      Melissa Ingham         Sadeeqa el-Aman  35      f         2022-12-29
      35      Melissa Ingham           Devante Owens  11      m         2023-01-04
      36   Mahbooba al-Fadel      Jordan Greene-King  13      m         2022-12-29
         date_last_contact was_case           status
      2         2023-01-01        Y             case
      3         2023-01-02        N   under_followup
      4         2023-01-02        N          unknown
      5         2023-01-02        Y             case
      6         2023-01-05        Y             case
      7         2023-01-02        N   under_followup
      8         2023-01-01        Y             case
      9         2023-01-02        Y             case
      10        2023-01-01        Y             case
      11        2023-01-03        N   under_followup
      12        2023-01-02        N   under_followup
      13        2023-01-04        N lost_to_followup
      14        2023-01-03        N   under_followup
      15        2023-01-02        N          unknown
      16        2023-01-02        Y             case
      17        2023-01-04        N          unknown
      18        2023-01-04        N lost_to_followup
      19        2023-01-02        Y             case
      20        2023-01-01        N lost_to_followup
      21        2023-01-02        N   under_followup
      22        2023-01-01        Y             case
      23        2023-01-02        Y             case
      24        2023-01-02        N lost_to_followup
      25        2023-01-03        Y             case
      26        2023-01-02        Y             case
      27        2023-01-01        Y             case
      28        2023-01-01        N   under_followup
      29        2023-01-02        N   under_followup
      30        2023-01-02        Y             case
      31        2023-01-06        Y             case
      32        2023-01-03        N   under_followup
      33        2023-01-02        N   under_followup
      34        2023-01-06        N   under_followup
      35        2023-01-05        N   under_followup
      36        2023-01-01        Y             case

# sim_contacts works as expected with modified config parameters

    Code
      sim_contacts(contact_distribution = contact_distribution, contact_interval = contact_interval,
        prob_infect = 0.5, config = create_config(last_contact_distribution_params = c(
          lambda = 5)))
    Output
                        from                  to age gender date_first_contact
      2  Thao Yokota-Stroman      Sammi Elizondo  62      f         2023-01-04
      3  Thao Yokota-Stroman       Audrey Ostrom  20      f         2023-01-07
      4       Sammi Elizondo Ghaamid al-Abdallah  29      m         2023-01-08
      5       Sammi Elizondo     Faadil al-Toure  42      m         2023-01-05
      6       Sammi Elizondo          Tami Hicar  60      f         2023-01-03
      7       Sammi Elizondo      Kristin Gentry  65      f         2023-01-02
      8      Faadil al-Toure        Elias Schell  28      m         2023-01-03
      9      Faadil al-Toure   Stephanie Quezada  78      f         2022-12-31
      10          Tami Hicar         Alison Pham  31      f         2023-01-06
      11          Tami Hicar        Joe Martinez  12      m         2023-01-04
      12          Tami Hicar    Muneera al-Nazir  80      f         2023-01-02
      13        Elias Schell         Alea Butler  44      f         2022-12-31
      14        Elias Schell          Neal Amery  74      m         2023-01-02
      15        Elias Schell          Luis Mejia  26      m         2023-01-08
      16        Elias Schell       Awad el-Amara  33      m         2023-01-05
      17        Elias Schell        Joseph Plutt   4      m         2023-01-01
      18         Alison Pham    Cleevens Thrower  53      m         2023-01-05
      19       Awad el-Amara      James Smith Jr  86      m         2023-01-06
      20      James Smith Jr        Kalia Truong  89      f         2023-01-04
      21      James Smith Jr         Mary Weaver  24      f         2023-01-06
      22      James Smith Jr      Sydney Aguilar  37      f         2023-01-05
      23      Sydney Aguilar       Mariah Garcia  15      f         2023-01-05
      24       Mariah Garcia        Cade Gilbert  14      m         2023-01-03
      25       Mariah Garcia          Travis Roy  81      m         2023-01-05
      26          Travis Roy            Marc Xue  82      m         2023-01-04
      27            Marc Xue     Mathew Mcintire  72      m         2023-01-05
      28            Marc Xue        Steven Smith  53      m         2023-01-06
      29            Marc Xue     Cleevens Taylor  56      m         2022-12-31
      30     Mathew Mcintire    Saisuriya Wilson  71      m         2023-01-06
      31     Mathew Mcintire     Alejandro Lopez  50      m         2023-01-02
      32     Mathew Mcintire       Dakota Harvie  73      m         2023-01-01
      33     Mathew Mcintire  Nabeela al-Rahmani  20      f         2023-01-03
      34    Saisuriya Wilson      Jerry Williams  75      m         2023-01-08
      35    Saisuriya Wilson Manaahil al-Ebrahim   2      f         2023-01-11
      36     Alejandro Lopez   Kelsey Mcclintock   3      f         2023-01-05
         date_last_contact was_case           status
      2         2023-01-07        Y             case
      3         2023-01-10        N   under_followup
      4         2023-01-11        N   under_followup
      5         2023-01-06        Y             case
      6         2023-01-05        Y             case
      7         2023-01-05        N   under_followup
      8         2023-01-05        Y             case
      9         2023-01-06        Y             case
      10        2023-01-09        Y             case
      11        2023-01-06        N   under_followup
      12        2023-01-04        N lost_to_followup
      13        2023-01-04        N   under_followup
      14        2023-01-06        N lost_to_followup
      15        2023-01-09        N   under_followup
      16        2023-01-06        Y             case
      17        2023-01-05        N lost_to_followup
      18        2023-01-08        N   under_followup
      19        2023-01-07        Y             case
      20        2023-01-05        N   under_followup
      21        2023-01-07        N lost_to_followup
      22        2023-01-07        Y             case
      23        2023-01-06        Y             case
      24        2023-01-05        N   under_followup
      25        2023-01-06        Y             case
      26        2023-01-06        Y             case
      27        2023-01-06        Y             case
      28        2023-01-09        N   under_followup
      29        2023-01-04        N   under_followup
      30        2023-01-06        Y             case
      31        2023-01-05        Y             case
      32        2023-01-06        N   under_followup
      33        2023-01-05        N   under_followup
      34        2023-01-08        N   under_followup
      35        2023-01-12        N   under_followup
      36        2023-01-07        Y             case

