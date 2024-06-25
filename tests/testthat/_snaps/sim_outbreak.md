# sim_outbreak works as expected with defaults

    Code
      sim_outbreak()
    Output
      $linelist
           id                case_name case_type sex age date_onset date_admission
      1     1           Dylan Quintana confirmed   m  59 2023-01-01           <NA>
      2     2             Briana Owens confirmed   f  90 2023-01-01     2023-01-06
      3     3          Elaine Phillips  probable   f   4 2023-01-02     2023-01-08
      4     5            Justin Farley  probable   m  29 2023-01-04           <NA>
      5     6         Sadeeda el-Obeid suspected   f  14 2023-01-05           <NA>
      6     7           Mouneek Israel  probable   f  85 2023-01-06           <NA>
      7    10             Taylor Jones confirmed   m  25 2023-01-13           <NA>
      8    11             Theresa Wurm confirmed   f  34 2023-01-11           <NA>
      9    12 Brianna Villalobos Nunez  probable   f  89 2023-01-13           <NA>
      10   14         Ayyoob al-Younis confirmed   m  63 2023-01-11           <NA>
      11   18        Muneer al-Abdalla confirmed   m  74 2023-01-14     2023-01-19
      12   19            Sara Schwindt confirmed   f  34 2023-01-12           <NA>
      13   22           Katherine Phan confirmed   f  29 2023-01-12           <NA>
      14   24       Kimberly Valentine  probable   f  46 2023-01-13           <NA>
      15   27            Ty'Ese Porter  probable   f  24 2023-01-14           <NA>
      16   29           Courtnee Miles suspected   f  41 2023-01-21           <NA>
      17   30             Alexah Stott confirmed   f  72 2023-01-19           <NA>
      18   31         Labeeb el-Saadeh confirmed   m   6 2023-01-20           <NA>
      19   33        Gunther Rodriguez confirmed   m  61 2023-01-14           <NA>
      20   34           Aqeela el-Akel confirmed   f  44 2023-01-14           <NA>
      21   35              Mayra Vigil confirmed   f  71 2023-01-27           <NA>
      22   38              Shane Binol suspected   m  69 2023-01-23           <NA>
      23   39            Travis Atwood confirmed   m  61 2023-01-23           <NA>
      24   41              Monique Yoo  probable   f  64 2023-01-24           <NA>
      25   44             Joseph Bruce confirmed   m  61 2023-01-22           <NA>
      26   45        Khaira el-Ibrahim  probable   f  66 2023-01-22           <NA>
      27   47           Desmond Garnes confirmed   m  81 2023-01-28           <NA>
      28   50           Myles Wakasugi confirmed   m  53 2023-01-28           <NA>
      29   51            Joshua Moreno confirmed   m  45 2023-01-29           <NA>
      30   53    Normajeanne Walker Jr suspected   f  42 2023-02-02           <NA>
      31   54          Miles Cournoyer confirmed   m  78 2023-02-03           <NA>
      32   55   Alec Thompson-Brashear confirmed   m  35 2023-01-24           <NA>
      33   56        Zakiyya al-Meskin confirmed   f  54 2023-01-26           <NA>
      34   58              Joel Curtis confirmed   m  68 2023-01-25           <NA>
      35   59             Ryan Stolley  probable   m   3 2023-01-23           <NA>
      36   60             Misael Giron  probable   m  44 2023-01-29     2023-02-02
      37   63           Talaal al-Kazi confirmed   m  62 2023-01-31     2023-02-09
      38   64          Naazim el-Ishak confirmed   m  35 2023-01-29           <NA>
      39   65         Angelique Lobato suspected   f  90 2023-02-03           <NA>
      40   66        Carousel Franklin  probable   f  25 2023-02-01           <NA>
      41   71           Alvina Tunnell confirmed   f  46 2023-01-29           <NA>
      42   73          Zumruda el-Dada confirmed   f   8 2023-02-01     2023-02-05
      43   77          Trent Hernandez confirmed   m  63 2023-01-30           <NA>
      44   78          Shelby Marshall  probable   f  54 2023-01-29           <NA>
      45   80            Savanna Smith  probable   f  67 2023-02-03           <NA>
      46   85           Justin Vallejo confirmed   m  37 2023-02-02           <NA>
      47   88          Muneeb al-Latif confirmed   m  73 2023-01-30     2023-02-05
      48   89         Laquinn Sengdara suspected   m  13 2023-02-02     2023-02-07
      49   90        Vanessa Blackmore confirmed   f  72 2023-02-01     2023-02-03
      50   93    Robert Ruschmeyer III confirmed   m  61 2023-02-04     2023-02-10
      51   97               Atif Redai confirmed   m  22 2023-02-05           <NA>
      52   98         Alexandra Devere suspected   f  29 2023-02-04           <NA>
      53  101        Samuel Heinselman  probable   m  17 2023-02-07     2023-02-10
      54  108              Kelvin Soto confirmed   m  71 2023-02-14           <NA>
      55  111             Meghan Acker  probable   f  90 2023-02-09           <NA>
      56  113             Justin Brown confirmed   m  23 2023-02-12           <NA>
      57  114        Yasmeen Fields II  probable   f  35 2023-02-16     2023-02-19
      58  116            Matthew Crowe suspected   m  62 2023-02-24     2023-02-28
      59  119               Rosa Vigil  probable   f  57 2023-02-23           <NA>
      60  120            Justin Aldava suspected   f  44 2023-02-18           <NA>
      61  122         Rosalio Aguinaga suspected   m  57 2023-03-02           <NA>
      62  123       Aaron D Alessandro confirmed   m  63 2023-03-08           <NA>
      63  125       Chykeiljah Purdham confirmed   f  46 2023-02-28           <NA>
      64  126        Mamdooh el-Salame suspected   m  66 2023-02-26           <NA>
      65  130         Michael Robinson  probable   m  68 2023-03-07           <NA>
      66  131           Phillip Medina confirmed   m  12 2023-03-09           <NA>
      67  133            Natalia Phung confirmed   f  51 2023-03-18           <NA>
      68  138        Jocilynn Shumpert confirmed   f   2 2023-03-10           <NA>
      69  139            Troy Leighton confirmed   m  53 2023-03-09           <NA>
      70  142     Canteskuya Lestenkof  probable   f  76 2023-03-23           <NA>
      71  143          Isaac Rodriguez suspected   m  82 2023-03-21           <NA>
      72  145          Arnasya Wigfall suspected   f  25 2023-03-15     2023-03-17
      73  146       Brittany Alvizures  probable   f  76 2023-03-13           <NA>
      74  147      Shaelumiel Phillips suspected   m  14 2023-03-13     2023-03-17
      75  150             Kelsey Dille suspected   f  76 2023-03-11     2023-03-13
      76  153            Riley Piontek suspected   m  78 2023-03-15           <NA>
      77  154            Vanessa Rojas suspected   f  75 2023-03-24           <NA>
      78  155        Rasheeqa el-Abbas suspected   f  76 2023-03-24           <NA>
      79  157          Aarifa al-Nouri confirmed   f  80 2023-03-18     2023-03-24
      80  158          Kelsi Dominguez confirmed   f  41 2023-03-18           <NA>
      81  159    Maria Karlson-Pacheco confirmed   f  78 2023-03-19           <NA>
      82  163         Reymundo Herrera confirmed   m  28 2023-03-15           <NA>
      83  164             Mariah Black suspected   f   2 2023-03-21           <NA>
      84  166               Bella Boss confirmed   f  82 2023-03-26           <NA>
      85  171               David Moak suspected   m   5 2023-03-22     2023-03-25
      86  172          Jazmyn Gallegos suspected   f   1 2023-03-20           <NA>
      87  173          Carl Levi Sharp suspected   m  44 2023-03-19           <NA>
      88  174          Yusri al-Khatib confirmed   m  76 2023-03-16           <NA>
      89  175          Jeffrey Donegan confirmed   m   3 2023-03-29           <NA>
      90  176           William Delger suspected   m  15 2023-03-25           <NA>
      91  177               Dyami Polk  probable   m  19 2023-03-26           <NA>
      92  178        Samantha Lockhart confirmed   f  76 2023-03-25           <NA>
      93  182     Dominic Robinson III  probable   m  90 2023-03-27           <NA>
      94  186     Oscar Rodriguez Loya confirmed   m  64 2023-04-03           <NA>
      95  189          Widdad al-Jamal  probable   f  35 2023-03-29           <NA>
      96  195       Annaliese Freiburg confirmed   f  84 2023-03-27           <NA>
      97  196          Muhsin el-Irani  probable   m  18 2023-03-30           <NA>
      98  197            Briana Eshima  probable   f  79 2023-03-28           <NA>
      99  199               Elise Bugh confirmed   f  49 2023-04-07           <NA>
      100 200        Erin Riley Doudna suspected   f  56 2023-04-05           <NA>
      101 201            Brianna Price confirmed   f  76 2023-04-07           <NA>
      102 202       Manuel Archambault suspected   m  41 2023-04-03     2023-04-10
      103 205             Jaelyn Moore  probable   f  29 2023-04-01           <NA>
      104 209              Aaron Davis  probable   m  39 2023-04-05           <NA>
      105 210         Timothy Schwartz confirmed   m  32 2023-04-01           <NA>
      106 211               Eric Okoye suspected   m   9 2023-04-06     2023-04-09
      107 213              Cindy Cheng  probable   f  39 2023-04-11     2023-04-13
      108 214       Patrick Paton-Ilse  probable   m  12 2023-04-17           <NA>
      109 219          Christian Ingle  probable   m  52 2023-04-10     2023-04-13
      110 221           Kimberly Leung confirmed   f  22 2023-04-02           <NA>
      111 224             Jaliya Smith confirmed   f  68 2023-04-08           <NA>
      112 226            Tyler Garhart  probable   m  57 2023-04-06           <NA>
      113 229       Nabeel al-Mohammad confirmed   m   8 2023-04-12     2023-04-15
      114 230             Alicia Vigil suspected   f  28 2023-04-12     2023-04-22
      115 232               Aqil Davis  probable   m   2 2023-04-02           <NA>
      116 233         Zachary Mckenney  probable   m  84 2023-04-09           <NA>
      117 234             Angeline Kim suspected   f  52 2023-04-09           <NA>
      118 235            Pierce Parent confirmed   m  58 2023-04-12     2023-04-17
      119 236           Brenna Brockel confirmed   f  29 2023-04-10     2023-04-17
      120 238        Hasana el-Hussein  probable   f  30 2023-04-14           <NA>
      121 240            Donald Dunlap confirmed   m  71 2023-04-15           <NA>
      122 243             Jarnell Shah confirmed   m  43 2023-04-13     2023-04-15
      123 245            Elijah Reaves suspected   m  40 2023-04-15           <NA>
      124 250             Eric Gilmore suspected   m  46 2023-04-16           <NA>
      125 251          Arshad al-Sadri confirmed   m  69 2023-04-11           <NA>
      126 252          Rif'a al-Naderi confirmed   f  69 2023-04-20           <NA>
      127 253  Oswaldo Thomas Trujillo suspected   m  38 2023-04-20           <NA>
      128 254        Muntasir al-Sayed confirmed   m  28 2023-04-16     2023-04-20
      129 255          Sabri al-Ismail confirmed   m  82 2023-04-16           <NA>
      130 258               Tylee Vang suspected   f  19 2023-04-14           <NA>
      131 261            Sidqi el-Naim  probable   m  46 2023-04-26           <NA>
      132 262          Amber Autterson confirmed   f  71 2023-04-13           <NA>
      133 264        Alexandra Blalock  probable   f   4 2023-04-25     2023-04-27
      134 265             Joshua Jones confirmed   m  31 2023-04-25           <NA>
      135 267            Vanessa Lopez confirmed   f  16 2023-04-20           <NA>
      136 268        Christian Vaquera confirmed   m  53 2023-04-21           <NA>
      137 277               Ivan Perez confirmed   m  14 2023-05-01           <NA>
      138 278     Angelica Orta Zepeda suspected   f  48 2023-04-28           <NA>
      139 279              Raul Chavez  probable   m  89 2023-04-25     2023-05-01
      140 280           Germaine Ealom  probable   m  39 2023-04-26           <NA>
      141 282             Tyler Wilson confirmed   m  20 2023-04-21           <NA>
      142 284            Maris Manning confirmed   f   6 2023-05-03           <NA>
      143 285      Candace Plenty Wolf  probable   f  28 2023-05-05           <NA>
      144 291             Avery Nguyen confirmed   m  42 2023-05-01     2023-05-10
      145 292        Maariya el-Younis confirmed   f  71 2023-04-23           <NA>
      146 293           Heather Orlady suspected   f   9 2023-05-05           <NA>
      147 296      Brenda Molina-Brown suspected   f  61 2023-05-06           <NA>
      148 298         Tareef el-Naderi confirmed   m  53 2023-05-02           <NA>
      149 301                  Tina Le suspected   f  76 2023-04-23           <NA>
      150 302          Precious Malloy confirmed   f  69 2023-04-26           <NA>
      151 304           Elias Martinez confirmed   m  50 2023-05-07           <NA>
      152 307           Destiny Turner confirmed   f   7 2023-05-09           <NA>
      153 310        Brittney Morrison confirmed   f  45 2023-04-24           <NA>
      154 311           Nathaniel Lone confirmed   m  83 2023-04-25           <NA>
      155 313             Rachel Pruet  probable   f  41 2023-04-27           <NA>
      156 316               Amy Tandon confirmed   f  88 2023-05-10           <NA>
      157 320                Nico Shea suspected   m  79 2023-05-01           <NA>
      158 326           Brenden Hughes  probable   m  82 2023-05-08     2023-05-21
            outcome date_outcome date_first_contact date_last_contact ct_value
      1   recovered         <NA>               <NA>              <NA>     26.3
      2        died   2023-01-19         2022-12-31        2023-01-05     26.3
      3        died   2023-01-08         2022-12-30        2023-01-01       NA
      4   recovered         <NA>         2023-01-05        2023-01-05       NA
      5   recovered         <NA>         2023-01-07        2023-01-08       NA
      6        died   2023-01-15         2023-01-03        2023-01-06       NA
      7   recovered         <NA>         2023-01-06        2023-01-06     26.3
      8   recovered         <NA>         2023-01-01        2023-01-06     26.3
      9   recovered         <NA>         2023-01-06        2023-01-08       NA
      10  recovered         <NA>         2023-01-02        2023-01-08     26.3
      11  recovered         <NA>         2023-01-12        2023-01-17     26.3
      12       died   2023-03-02         2023-01-09        2023-01-11     26.3
      13  recovered         <NA>         2023-01-12        2023-01-14     26.3
      14  recovered         <NA>         2023-01-10        2023-01-16       NA
      15  recovered         <NA>         2023-01-11        2023-01-13       NA
      16  recovered         <NA>         2023-01-11        2023-01-15       NA
      17  recovered         <NA>         2023-01-14        2023-01-17     26.3
      18  recovered         <NA>         2023-01-14        2023-01-16     26.3
      19  recovered         <NA>         2023-01-12        2023-01-16     26.3
      20  recovered         <NA>         2023-01-13        2023-01-17     26.3
      21  recovered         <NA>         2023-01-22        2023-01-23     26.3
      22       died   2023-01-28         2023-01-20        2023-01-22       NA
      23  recovered         <NA>         2023-01-19        2023-01-23     26.3
      24  recovered         <NA>         2023-01-19        2023-01-22       NA
      25  recovered         <NA>         2023-01-23        2023-01-24     26.3
      26  recovered         <NA>         2023-01-23        2023-01-25       NA
      27  recovered         <NA>         2023-01-23        2023-01-28     26.3
      28  recovered         <NA>         2023-01-22        2023-01-24     26.3
      29  recovered         <NA>         2023-01-23        2023-01-28     26.3
      30  recovered         <NA>         2023-01-25        2023-01-26       NA
      31  recovered         <NA>         2023-01-24        2023-01-26     26.3
      32  recovered         <NA>         2023-01-23        2023-01-26     26.3
      33  recovered         <NA>         2023-01-18        2023-01-23     26.3
      34  recovered         <NA>         2023-01-19        2023-01-23     26.3
      35  recovered         <NA>         2023-01-22        2023-01-26       NA
      36       died   2023-02-14         2023-01-27        2023-01-27       NA
      37       died   2023-02-17         2023-01-26        2023-01-28     26.3
      38  recovered         <NA>         2023-01-25        2023-01-30     26.3
      39  recovered         <NA>         2023-01-27        2023-01-30       NA
      40  recovered         <NA>         2023-01-27        2023-01-31       NA
      41  recovered         <NA>         2023-01-30        2023-01-31     26.3
      42       died   2023-02-10         2023-02-01        2023-02-04     26.3
      43  recovered         <NA>         2023-01-28        2023-02-02     26.3
      44  recovered         <NA>         2023-01-27        2023-02-02       NA
      45  recovered         <NA>         2023-02-03        2023-02-04       NA
      46  recovered         <NA>         2023-02-01        2023-02-03     26.3
      47  recovered         <NA>         2023-01-31        2023-02-01     26.3
      48  recovered         <NA>         2023-01-30        2023-02-02       NA
      49  recovered         <NA>         2023-01-31        2023-01-31     26.3
      50  recovered         <NA>         2023-01-30        2023-02-04     26.3
      51       died   2023-02-18         2023-02-04        2023-02-06     26.3
      52  recovered         <NA>         2023-02-03        2023-02-05       NA
      53  recovered         <NA>         2023-01-30        2023-02-04       NA
      54  recovered         <NA>         2023-02-05        2023-02-08     26.3
      55  recovered         <NA>         2023-02-06        2023-02-08       NA
      56  recovered         <NA>         2023-02-10        2023-02-11     26.3
      57  recovered         <NA>         2023-02-14        2023-02-19       NA
      58       died   2023-03-28         2023-02-13        2023-02-16       NA
      59  recovered         <NA>         2023-02-10        2023-02-13       NA
      60  recovered         <NA>         2023-02-16        2023-02-18       NA
      61  recovered         <NA>         2023-03-02        2023-03-02       NA
      62  recovered         <NA>         2023-02-26        2023-03-03     26.3
      63  recovered         <NA>         2023-02-24        2023-02-26     26.3
      64  recovered         <NA>         2023-02-17        2023-02-23       NA
      65  recovered         <NA>         2023-03-06        2023-03-07       NA
      66  recovered         <NA>         2023-03-03        2023-03-04     26.3
      67  recovered         <NA>         2023-03-07        2023-03-09     26.3
      68  recovered         <NA>         2023-03-06        2023-03-11     26.3
      69  recovered         <NA>         2023-03-07        2023-03-11     26.3
      70  recovered         <NA>         2023-03-18        2023-03-23       NA
      71  recovered         <NA>         2023-03-20        2023-03-20       NA
      72       died   2023-03-28         2023-03-07        2023-03-12       NA
      73  recovered         <NA>         2023-03-10        2023-03-14       NA
      74       died   2023-04-11         2023-03-06        2023-03-11       NA
      75       died   2023-03-21         2023-03-10        2023-03-11       NA
      76  recovered         <NA>         2023-03-16        2023-03-21       NA
      77  recovered         <NA>         2023-03-16        2023-03-19       NA
      78  recovered         <NA>         2023-03-12        2023-03-19       NA
      79       died   2023-04-02         2023-03-13        2023-03-14     26.3
      80  recovered         <NA>         2023-03-12        2023-03-14     26.3
      81  recovered         <NA>         2023-03-12        2023-03-17     26.3
      82  recovered         <NA>         2023-03-12        2023-03-17     26.3
      83  recovered         <NA>         2023-03-15        2023-03-18       NA
      84  recovered         <NA>         2023-03-21        2023-03-25     26.3
      85       died   2023-03-30         2023-03-16        2023-03-20       NA
      86  recovered         <NA>         2023-03-18        2023-03-21       NA
      87  recovered         <NA>         2023-03-17        2023-03-18       NA
      88  recovered         <NA>         2023-03-20        2023-03-21     26.3
      89  recovered         <NA>         2023-03-26        2023-03-27     26.3
      90       died   2023-04-11         2023-03-24        2023-03-24       NA
      91  recovered         <NA>         2023-03-22        2023-03-24       NA
      92  recovered         <NA>         2023-03-19        2023-03-24     26.3
      93  recovered         <NA>         2023-03-20        2023-03-20       NA
      94  recovered         <NA>         2023-03-29        2023-04-01     26.3
      95  recovered         <NA>         2023-03-27        2023-03-28       NA
      96  recovered         <NA>         2023-03-23        2023-03-28     26.3
      97  recovered         <NA>         2023-03-25        2023-03-29       NA
      98       died   2023-04-06         2023-03-26        2023-03-28       NA
      99  recovered         <NA>         2023-04-02        2023-04-07     26.3
      100 recovered         <NA>         2023-04-03        2023-04-06       NA
      101 recovered         <NA>         2023-03-31        2023-04-03     26.3
      102      died   2023-05-01         2023-03-28        2023-04-01       NA
      103 recovered         <NA>         2023-03-24        2023-03-29       NA
      104 recovered         <NA>         2023-03-28        2023-04-01       NA
      105 recovered         <NA>         2023-03-30        2023-04-06     26.3
      106      died   2023-04-17         2023-04-03        2023-04-05       NA
      107      died   2023-05-03         2023-04-07        2023-04-08       NA
      108      died   2023-05-09         2023-04-08        2023-04-08       NA
      109 recovered         <NA>         2023-04-06        2023-04-06       NA
      110 recovered         <NA>         2023-04-01        2023-04-05     26.3
      111 recovered         <NA>         2023-04-03        2023-04-06     26.3
      112 recovered         <NA>         2023-04-01        2023-04-04       NA
      113 recovered         <NA>         2023-04-11        2023-04-16     26.3
      114 recovered         <NA>         2023-04-09        2023-04-12       NA
      115 recovered         <NA>         2023-04-05        2023-04-06       NA
      116 recovered         <NA>         2023-04-01        2023-04-03       NA
      117 recovered         <NA>         2023-04-01        2023-04-09       NA
      118 recovered         <NA>         2023-04-04        2023-04-08     26.3
      119      died   2023-04-24         2023-04-12        2023-04-13     26.3
      120      died   2023-05-02         2023-04-14        2023-04-17       NA
      121 recovered         <NA>         2023-04-03        2023-04-05     26.3
      122 recovered         <NA>         2023-04-09        2023-04-12     26.3
      123 recovered         <NA>         2023-04-10        2023-04-16       NA
      124 recovered         <NA>         2023-04-06        2023-04-11       NA
      125 recovered         <NA>         2023-04-07        2023-04-12     26.3
      126 recovered         <NA>         2023-04-04        2023-04-11     26.3
      127 recovered         <NA>         2023-04-10        2023-04-11       NA
      128 recovered         <NA>         2023-04-13        2023-04-16     26.3
      129 recovered         <NA>         2023-04-14        2023-04-18     26.3
      130 recovered         <NA>         2023-04-13        2023-04-14       NA
      131 recovered         <NA>         2023-04-15        2023-04-18       NA
      132 recovered         <NA>         2023-04-14        2023-04-14     26.3
      133 recovered         <NA>         2023-04-12        2023-04-21       NA
      134 recovered         <NA>         2023-04-16        2023-04-21     26.3
      135 recovered         <NA>         2023-04-19        2023-04-25     26.3
      136      died   2023-05-04         2023-04-23        2023-04-25     26.3
      137 recovered         <NA>         2023-04-11        2023-04-15     26.3
      138 recovered         <NA>         2023-04-23        2023-04-26       NA
      139      died   2023-05-07         2023-04-21        2023-04-22       NA
      140 recovered         <NA>         2023-04-18        2023-04-22       NA
      141 recovered         <NA>         2023-04-21        2023-04-25     26.3
      142 recovered         <NA>         2023-05-05        2023-05-06     26.3
      143 recovered         <NA>         2023-04-28        2023-04-29       NA
      144      died   2023-05-28         2023-04-19        2023-04-21     26.3
      145 recovered         <NA>         2023-04-21        2023-04-23     26.3
      146 recovered         <NA>         2023-05-03        2023-05-05       NA
      147 recovered         <NA>         2023-05-06        2023-05-08       NA
      148 recovered         <NA>         2023-05-01        2023-05-03     26.3
      149 recovered         <NA>         2023-04-25        2023-04-27       NA
      150 recovered         <NA>         2023-04-20        2023-04-25     26.3
      151 recovered         <NA>         2023-05-08        2023-05-10     26.3
      152 recovered         <NA>         2023-04-28        2023-05-04     26.3
      153 recovered         <NA>         2023-04-19        2023-04-25     26.3
      154 recovered         <NA>         2023-04-25        2023-04-26     26.3
      155 recovered         <NA>         2023-04-25        2023-04-29       NA
      156 recovered         <NA>         2023-05-05        2023-05-08     26.3
      157 recovered         <NA>         2023-04-22        2023-04-28       NA
      158      died   2023-05-22         2023-05-01        2023-05-03       NA
      
      $contacts
                              from                       to age sex
      1             Dylan Quintana             Briana Owens  90   f
      2             Dylan Quintana          Elaine Phillips   4   f
      3               Briana Owens           Noori el-Abbas  86   m
      4               Briana Owens            Justin Farley  29   m
      5            Elaine Phillips         Sadeeda el-Obeid  14   f
      6            Elaine Phillips           Mouneek Israel  85   f
      7            Elaine Phillips          Joseph Petersen  18   m
      8              Justin Farley               Steven Dye  59   m
      9           Sadeeda el-Obeid             Taylor Jones  25   m
      10          Sadeeda el-Obeid             Theresa Wurm  34   f
      11          Sadeeda el-Obeid Brianna Villalobos Nunez  89   f
      12          Sadeeda el-Obeid              Jahnee Ward   5   f
      13            Mouneek Israel         Ayyoob al-Younis  63   m
      14              Theresa Wurm             Michael Moon  50   m
      15              Theresa Wurm        Aaron Albershardt   5   m
      16              Theresa Wurm        Jennifer Muenchow  89   f
      17  Brianna Villalobos Nunez        Muneer al-Abdalla  74   m
      18          Ayyoob al-Younis            Sara Schwindt  34   f
      19          Ayyoob al-Younis     Dylan Mancinas Ramos  47   m
      20          Ayyoob al-Younis           Douglas Miller  85   m
      21          Ayyoob al-Younis           Katherine Phan  29   f
      22         Muneer al-Abdalla        Lawrence Mitchell  24   m
      23             Sara Schwindt       Kimberly Valentine  46   f
      24             Sara Schwindt        Denzel Washington  63   m
      25             Sara Schwindt            Awad al-Islam  19   m
      26             Sara Schwindt            Ty'Ese Porter  24   f
      27            Katherine Phan             Joshua Shire   9   m
      28            Katherine Phan           Courtnee Miles  41   f
      29            Katherine Phan             Alexah Stott  72   f
      30            Katherine Phan         Labeeb el-Saadeh   6   m
      31        Kimberly Valentine          Alondra Mendoza   9   f
      32             Ty'Ese Porter        Gunther Rodriguez  61   m
      33             Ty'Ese Porter           Aqeela el-Akel  44   f
      34            Courtnee Miles              Mayra Vigil  71   f
      35            Courtnee Miles             Travis Mckee  34   m
      36            Courtnee Miles              Daniel Chen  75   m
      37            Courtnee Miles              Shane Binol  69   m
      38            Courtnee Miles            Travis Atwood  61   m
      39            Courtnee Miles            Donovan Lopez  67   m
      40              Alexah Stott              Monique Yoo  64   f
      41              Alexah Stott              Alaina Moua  11   f
      42              Alexah Stott         Khawla al-Hannan  59   f
      43          Labeeb el-Saadeh             Joseph Bruce  61   m
      44          Labeeb el-Saadeh        Khaira el-Ibrahim  66   f
      45            Aqeela el-Akel              Zoe Garrett  16   f
      46               Mayra Vigil           Desmond Garnes  81   m
      47               Mayra Vigil           Isaac Cisneros  88   m
      48             Travis Atwood               Hogan Tong  53   m
      49             Travis Atwood           Myles Wakasugi  53   m
      50               Monique Yoo            Joshua Moreno  45   m
      51               Monique Yoo                Emily Lam  42   f
      52               Monique Yoo    Normajeanne Walker Jr  42   f
      53               Monique Yoo          Miles Cournoyer  78   m
      54              Joseph Bruce   Alec Thompson-Brashear  35   m
      55              Joseph Bruce        Zakiyya al-Meskin  54   f
      56              Joseph Bruce           Julianna Mazza  54   f
      57         Khaira el-Ibrahim              Joel Curtis  68   m
      58         Khaira el-Ibrahim             Ryan Stolley   3   m
      59         Khaira el-Ibrahim             Misael Giron  44   m
      60            Desmond Garnes      Mercedes Drinkwater  35   f
      61            Myles Wakasugi        Saalima al-Moradi  23   f
      62            Myles Wakasugi           Talaal al-Kazi  62   m
      63            Myles Wakasugi          Naazim el-Ishak  35   m
      64             Joshua Moreno         Angelique Lobato  90   f
      65             Joshua Moreno        Carousel Franklin  25   f
      66           Miles Cournoyer Attily Haywood-Morimitsu  41   f
      67         Zakiyya al-Meskin         Vianca Rodriguez  17   f
      68         Zakiyya al-Meskin               Sarah Ford  26   f
      69               Joel Curtis           Tyvonn Skinner  61   m
      70               Joel Curtis           Alvina Tunnell  46   f
      71              Ryan Stolley    Jamya Mosby-Beckworth  57   f
      72              Misael Giron          Zumruda el-Dada   8   f
      73              Misael Giron          Bryanna Kushner  11   f
      74            Talaal al-Kazi           Qais el-Nasser  56   m
      75           Naazim el-Ishak           Tanaree Nguyen  32   f
      76           Naazim el-Ishak          Trent Hernandez  63   m
      77           Naazim el-Ishak          Shelby Marshall  54   f
      78           Naazim el-Ishak         Demetrius Mcneal  22   m
      79         Carousel Franklin            Savanna Smith  67   f
      80         Carousel Franklin         Luqmaan el-Nasir  83   m
      81         Carousel Franklin           Alexa Buccieri  16   f
      82         Carousel Franklin          Haley Robertson  38   f
      83            Alvina Tunnell             Zaira Garcia  19   f
      84           Zumruda el-Dada           Justin Vallejo  37   m
      85           Zumruda el-Dada             Rayven Smith  46   f
      86           Zumruda el-Dada        Waheeda al-Farhat  64   f
      87           Trent Hernandez          Muneeb al-Latif  73   m
      88           Trent Hernandez         Laquinn Sengdara  13   m
      89           Shelby Marshall        Vanessa Blackmore  72   f
      90           Shelby Marshall            Emily Lechman  12   f
      91             Savanna Smith           Terhesa Litvak  52   f
      92             Savanna Smith    Robert Ruschmeyer III  61   m
      93             Savanna Smith           Jamileth Salas   9   f
      94             Savanna Smith         Estephania Pinon   9   f
      95             Savanna Smith          Brittany Nguyen  42   f
      96            Justin Vallejo               Atif Redai  22   m
      97           Muneeb al-Latif         Alexandra Devere  29   f
      98          Laquinn Sengdara            Kylyn Letzler  15   f
      99          Laquinn Sengdara           Jasmine Mathis  69   f
      100         Laquinn Sengdara        Samuel Heinselman  17   m
      101         Laquinn Sengdara          Abigail Johnson  21   f
      102         Laquinn Sengdara           Elizabeth Mora  54   f
      103         Laquinn Sengdara           Nataya Braxton  20   f
      104         Laquinn Sengdara          Jameel el-Nazar   9   m
      105    Robert Ruschmeyer III             Erin Crocker  26   f
      106    Robert Ruschmeyer III            Jessica Hoang  80   f
      107    Robert Ruschmeyer III              Kelvin Soto  71   m
      108    Robert Ruschmeyer III          Deaijah Threats  57   f
      109    Robert Ruschmeyer III                Emily Lim  77   f
      110         Alexandra Devere             Meghan Acker  90   f
      111        Samuel Heinselman              Sana Merlan  58   f
      112        Samuel Heinselman             Justin Brown  23   m
      113              Kelvin Soto        Yasmeen Fields II  35   f
      114             Meghan Acker         Danielle Cintora  66   f
      115             Justin Brown            Matthew Crowe  62   m
      116             Justin Brown           Tony Fernandez  62   m
      117             Justin Brown            Ronald Dalton  34   m
      118             Justin Brown               Rosa Vigil  57   f
      119        Yasmeen Fields II            Justin Aldava  44   f
      120        Yasmeen Fields II            Colton Rogers  22   m
      121            Matthew Crowe         Rosalio Aguinaga  57   m
      122            Matthew Crowe       Aaron D Alessandro  63   m
      123               Rosa Vigil         Samantha Hagerty   7   f
      124               Rosa Vigil       Chykeiljah Purdham  46   f
      125               Rosa Vigil        Mamdooh el-Salame  66   m
      126            Justin Aldava       Joshua Vera-Flores   4   m
      127            Justin Aldava          Scott Trousdale  10   m
      128         Rosalio Aguinaga        Dylan Stolzenburg  68   m
      129         Rosalio Aguinaga         Michael Robinson  68   m
      130         Rosalio Aguinaga           Phillip Medina  12   m
      131       Aaron D Alessandro            Israa el-Abdi  51   f
      132       Aaron D Alessandro            Natalia Phung  51   f
      133       Chykeiljah Purdham           Theodore Coons   8   m
      134        Mamdooh el-Salame         Brittany Briseno  55   f
      135         Michael Robinson            Cidney Miller  77   m
      136         Michael Robinson           Kurstin Hodapp  22   f
      137           Phillip Medina        Jocilynn Shumpert   2   f
      138           Phillip Medina            Troy Leighton  53   m
      139            Natalia Phung        Muzaina al-Baccus  31   f
      140            Natalia Phung         Sameeha al-Javid  77   f
      141            Natalia Phung     Canteskuya Lestenkof  76   f
      142            Natalia Phung          Isaac Rodriguez  82   m
      143            Natalia Phung               Brian Wang  12   m
      144        Jocilynn Shumpert          Arnasya Wigfall  25   f
      145        Jocilynn Shumpert       Brittany Alvizures  76   f
      146            Troy Leighton      Shaelumiel Phillips  14   m
      147            Troy Leighton         Karanveer Wilson  31   m
      148            Troy Leighton          Ahlaam al-Aslam  90   f
      149            Troy Leighton             Kelsey Dille  76   f
      150     Canteskuya Lestenkof             Samuel Sands  30   m
      151          Isaac Rodriguez             Bridgit Jobe  32   f
      152          Arnasya Wigfall            Riley Piontek  78   m
      153          Arnasya Wigfall            Vanessa Rojas  75   f
      154          Arnasya Wigfall        Rasheeqa el-Abbas  76   f
      155       Brittany Alvizures              Steven Lehi  88   m
      156      Shaelumiel Phillips          Aarifa al-Nouri  80   f
      157      Shaelumiel Phillips          Kelsi Dominguez  41   f
      158      Shaelumiel Phillips    Maria Karlson-Pacheco  78   f
      159      Shaelumiel Phillips                John Alam  11   m
      160      Shaelumiel Phillips          Aqeela al-Pasha  57   f
      161             Kelsey Dille Jonathan Knodel-Eldridge  79   m
      162            Riley Piontek         Reymundo Herrera  28   m
      163            Riley Piontek             Mariah Black   2   f
      164            Vanessa Rojas           Trenice Pender  16   f
      165        Rasheeqa el-Abbas               Bella Boss  82   f
      166          Aarifa al-Nouri          Griselda Garcia  51   f
      167          Aarifa al-Nouri            Reno Hoffmann  54   f
      168          Kelsi Dominguez              Molly Wells  76   f
      169          Kelsi Dominguez            Kayly Woehrel  56   f
      170          Kelsi Dominguez               David Moak   5   m
      171    Maria Karlson-Pacheco          Jazmyn Gallegos   1   f
      172         Reymundo Herrera          Carl Levi Sharp  44   m
      173         Reymundo Herrera          Yusri al-Khatib  76   m
      174               Bella Boss          Jeffrey Donegan   3   m
      175               David Moak           William Delger  15   m
      176               David Moak               Dyami Polk  19   m
      177               David Moak        Samantha Lockhart  76   f
      178          Jazmyn Gallegos              Kylee Kelly  12   f
      179          Yusri al-Khatib            Jose Escudero  43   m
      180          Yusri al-Khatib        Huraira el-Masood   9   m
      181          Yusri al-Khatib     Dominic Robinson III  90   m
      182          Yusri al-Khatib          Daleel al-Sahli   7   m
      183          Jeffrey Donegan    Badruddeen al-Bacchus  15   m
      184          Jeffrey Donegan          Suhaa al-Moussa  54   f
      185               Dyami Polk     Oscar Rodriguez Loya  64   m
      186               Dyami Polk       Shaddaad el-Firman  21   m
      187               Dyami Polk  Crystal Medina Castillo  37   f
      188               Dyami Polk          Widdad al-Jamal  35   f
      189               Dyami Polk            Lizeth Stapel  70   f
      190        Samantha Lockhart          Paul Watkins Jr  70   m
      191        Samantha Lockhart             Tione Dupont  59   f
      192        Samantha Lockhart        Giovanni Sterling  77   m
      193        Samantha Lockhart          Bandar al-Nouri  75   m
      194        Samantha Lockhart       Annaliese Freiburg  84   f
      195     Dominic Robinson III          Muhsin el-Irani  18   m
      196     Dominic Robinson III            Briana Eshima  79   f
      197     Oscar Rodriguez Loya       Aubreylin Deguzman  14   f
      198     Oscar Rodriguez Loya               Elise Bugh  49   f
      199     Oscar Rodriguez Loya        Erin Riley Doudna  56   f
      200     Oscar Rodriguez Loya            Brianna Price  76   f
      201          Widdad al-Jamal       Manuel Archambault  41   m
      202          Widdad al-Jamal           Sham'a el-Arif  16   f
      203          Widdad al-Jamal             Winston Pham   3   m
      204       Annaliese Freiburg             Jaelyn Moore  29   f
      205       Annaliese Freiburg         Trey-Logan Smith  89   m
      206       Annaliese Freiburg            Caleb Ramirez  24   m
      207       Annaliese Freiburg           Karen Sandoval  31   f
      208          Muhsin el-Irani              Aaron Davis  39   m
      209          Muhsin el-Irani         Timothy Schwartz  32   m
      210          Muhsin el-Irani               Eric Okoye   9   m
      211            Briana Eshima              Awf el-Rais  82   m
      212               Elise Bugh              Cindy Cheng  39   f
      213        Erin Riley Doudna       Patrick Paton-Ilse  12   m
      214            Brianna Price             Jocelyn Diaz  54   f
      215            Brianna Price          Elijah Anguiano  68   m
      216       Manuel Archambault     Alexandra Kanchanlal  73   f
      217       Manuel Archambault         Oghenemairo Ware  85   f
      218       Manuel Archambault          Christian Ingle  52   m
      219       Manuel Archambault          Timothy Seifert   3   m
      220             Jaelyn Moore           Kimberly Leung  22   f
      221             Jaelyn Moore           Kayla Isabelle   5   f
      222              Aaron Davis           Baylen Wheeler  66   m
      223              Aaron Davis             Jaliya Smith  68   f
      224         Timothy Schwartz            Jay Goodstein  38   m
      225         Timothy Schwartz            Tyler Garhart  57   m
      226         Timothy Schwartz            Kibori Cooper  48   m
      227               Eric Okoye           Farha el-Saidi  75   f
      228              Cindy Cheng       Nabeel al-Mohammad   8   m
      229          Christian Ingle             Alicia Vigil  28   f
      230          Christian Ingle        Annnees al-Elamin  21   m
      231           Kimberly Leung               Aqil Davis   2   m
      232           Kimberly Leung         Zachary Mckenney  84   m
      233             Jaliya Smith             Angeline Kim  52   f
      234             Jaliya Smith            Pierce Parent  58   m
      235             Jaliya Smith           Brenna Brockel  29   f
      236            Tyler Garhart         Dalton Dickerson   7   m
      237       Nabeel al-Mohammad        Hasana el-Hussein  30   f
      238       Nabeel al-Mohammad        Jameela al-Salaam  11   f
      239               Aqil Davis            Donald Dunlap  71   m
      240               Aqil Davis           Alisha Crocker  50   f
      241         Zachary Mckenney            Taylor Oblack  77   f
      242         Zachary Mckenney             Jarnell Shah  43   m
      243         Zachary Mckenney             Naomi Wilson  19   f
      244         Zachary Mckenney            Elijah Reaves  40   m
      245         Zachary Mckenney          Aasiya el-Malak  49   f
      246         Zachary Mckenney         Redmond Arellano  11   m
      247         Zachary Mckenney           Jawaad el-Sala  15   m
      248         Zachary Mckenney          Ikram el-Khalil  61   m
      249           Brenna Brockel             Eric Gilmore  46   m
      250           Brenna Brockel          Arshad al-Sadri  69   m
      251           Brenna Brockel          Rif'a al-Naderi  69   f
      252           Brenna Brockel  Oswaldo Thomas Trujillo  38   m
      253        Hasana el-Hussein        Muntasir al-Sayed  28   m
      254        Hasana el-Hussein          Sabri al-Ismail  82   m
      255            Donald Dunlap          Zaaid al-Jabbar  45   m
      256            Donald Dunlap               David Bell  47   m
      257             Jarnell Shah               Tylee Vang  19   f
      258            Elijah Reaves            Amanda Garcia  85   f
      259             Eric Gilmore          Margarita Terry  24   f
      260             Eric Gilmore            Sidqi el-Naim  46   m
      261          Arshad al-Sadri          Amber Autterson  71   f
      262          Arshad al-Sadri            Austin Mulder  69   m
      263          Rif'a al-Naderi        Alexandra Blalock   4   f
      264          Rif'a al-Naderi             Joshua Jones  31   m
      265  Oswaldo Thomas Trujillo           Mutee'a al-Aly  18   f
      266  Oswaldo Thomas Trujillo            Vanessa Lopez  16   f
      267  Oswaldo Thomas Trujillo        Christian Vaquera  53   m
      268        Muntasir al-Sayed               Syed Nagai  62   m
      269        Muntasir al-Sayed          Shelby Muhammad  87   m
      270          Sabri al-Ismail          Nu'ma al-Arafat  28   f
      271          Sabri al-Ismail        Shaheer al-Firman  42   m
      272               Tylee Vang            Samara Bryant  42   f
      273            Sidqi el-Naim             Linda Parker  84   f
      274            Sidqi el-Naim        Hilaal el-Abdella  29   m
      275          Amber Autterson         Kaleem al-Khalid  47   m
      276          Amber Autterson               Ivan Perez  14   m
      277        Alexandra Blalock     Angelica Orta Zepeda  48   f
      278            Vanessa Lopez              Raul Chavez  89   m
      279            Vanessa Lopez           Germaine Ealom  39   m
      280            Vanessa Lopez           Gabriella Pont  17   f
      281        Christian Vaquera             Tyler Wilson  20   m
      282        Christian Vaquera       Almaasa al-Mustafa  61   f
      283               Ivan Perez            Maris Manning   6   f
      284     Angelica Orta Zepeda      Candace Plenty Wolf  28   f
      285              Raul Chavez           Abiel Trujillo  83   m
      286              Raul Chavez             Latha Wasson  68   m
      287              Raul Chavez            Yadiel Malone  47   m
      288             Tyler Wilson            Korren Harper  73   f
      289             Tyler Wilson          Victoria Romero  24   f
      290             Tyler Wilson             Avery Nguyen  42   m
      291             Tyler Wilson        Maariya el-Younis  71   f
      292            Maris Manning           Heather Orlady   9   f
      293            Maris Manning         Giovana Monclova  78   f
      294      Candace Plenty Wolf               Laura Ball  24   f
      295      Candace Plenty Wolf      Brenda Molina-Brown  61   f
      296             Avery Nguyen            Megan Cushing  49   f
      297             Avery Nguyen         Tareef el-Naderi  53   m
      298             Avery Nguyen       Mushtaaqa el-Qadir  63   f
      299        Maariya el-Younis              Alana Weiss  29   f
      300        Maariya el-Younis                  Tina Le  76   f
      301        Maariya el-Younis          Precious Malloy  69   f
      302           Heather Orlady       Sabaaha el-Sultana  63   f
      303           Heather Orlady           Elias Martinez  50   m
      304           Heather Orlady                Ziru Cung  58   f
      305         Tareef el-Naderi      Tyrell Thomas-Moore  88   m
      306         Tareef el-Naderi           Destiny Turner   7   f
      307         Tareef el-Naderi           Kendrick Brown  51   m
      308                  Tina Le                 Andy Kim  47   m
      309                  Tina Le        Brittney Morrison  45   f
      310                  Tina Le           Nathaniel Lone  83   m
      311                  Tina Le            Brianna Nocon  30   f
      312          Precious Malloy             Rachel Pruet  41   f
      313           Elias Martinez            Matthew Trang  15   m
      314           Elias Martinez           Sharron Cooper  27   f
      315           Elias Martinez               Amy Tandon  88   f
      316           Destiny Turner          Genessis Chacon  74   f
      317        Brittney Morrison              Nakita Diaz   1   f
      318        Brittney Morrison         Wasmaaa el-Hares  84   f
      319           Nathaniel Lone                Nico Shea  79   m
      320             Rachel Pruet       Tayyiba el-Khawaja  54   f
      321             Rachel Pruet           Maurice Morgan  24   m
      322             Rachel Pruet    Joey Hernandez Correa  37   m
      323               Amy Tandon             Monica Glade   3   f
      324               Amy Tandon           Anthony Deleon  48   m
      325                Nico Shea           Brenden Hughes  82   m
      326           Brenden Hughes             Avani Ansari  30   f
          date_first_contact date_last_contact was_case           status
      1           2022-12-31        2023-01-05        Y             case
      2           2022-12-30        2023-01-01        Y             case
      3           2023-01-02        2023-01-04        N          unknown
      4           2023-01-05        2023-01-05        Y             case
      5           2023-01-07        2023-01-08        Y             case
      6           2023-01-03        2023-01-06        Y             case
      7           2023-01-02        2023-01-04        N   under_followup
      8           2023-01-02        2023-01-06        N   under_followup
      9           2023-01-06        2023-01-06        Y             case
      10          2023-01-01        2023-01-06        Y             case
      11          2023-01-06        2023-01-08        Y             case
      12          2023-01-05        2023-01-07        N   under_followup
      13          2023-01-02        2023-01-08        Y             case
      14          2023-01-14        2023-01-17        N lost_to_followup
      15          2023-01-10        2023-01-13        N          unknown
      16          2023-01-07        2023-01-13        N lost_to_followup
      17          2023-01-12        2023-01-17        Y             case
      18          2023-01-09        2023-01-11        Y             case
      19          2023-01-11        2023-01-15        N   under_followup
      20          2023-01-12        2023-01-15        N          unknown
      21          2023-01-12        2023-01-14        Y             case
      22          2023-01-12        2023-01-16        N   under_followup
      23          2023-01-10        2023-01-16        Y             case
      24          2023-01-12        2023-01-14        N   under_followup
      25          2023-01-13        2023-01-16        N   under_followup
      26          2023-01-11        2023-01-13        Y             case
      27          2023-01-15        2023-01-16        N          unknown
      28          2023-01-11        2023-01-15        Y             case
      29          2023-01-14        2023-01-17        Y             case
      30          2023-01-14        2023-01-16        Y             case
      31          2023-01-17        2023-01-18        N   under_followup
      32          2023-01-12        2023-01-16        Y             case
      33          2023-01-13        2023-01-17        Y             case
      34          2023-01-22        2023-01-23        Y             case
      35          2023-01-19        2023-01-23        N lost_to_followup
      36          2023-01-26        2023-01-26        N   under_followup
      37          2023-01-20        2023-01-22        Y             case
      38          2023-01-19        2023-01-23        Y             case
      39          2023-01-21        2023-01-23        N lost_to_followup
      40          2023-01-19        2023-01-22        Y             case
      41          2023-01-15        2023-01-20        N lost_to_followup
      42          2023-01-19        2023-01-21        N   under_followup
      43          2023-01-23        2023-01-24        Y             case
      44          2023-01-23        2023-01-25        Y             case
      45          2023-01-15        2023-01-16        N   under_followup
      46          2023-01-23        2023-01-28        Y             case
      47          2023-01-25        2023-01-29        N   under_followup
      48          2023-01-26        2023-01-27        N   under_followup
      49          2023-01-22        2023-01-24        Y             case
      50          2023-01-23        2023-01-28        Y             case
      51          2023-01-22        2023-01-27        N   under_followup
      52          2023-01-25        2023-01-26        Y             case
      53          2023-01-24        2023-01-26        Y             case
      54          2023-01-23        2023-01-26        Y             case
      55          2023-01-18        2023-01-23        Y             case
      56          2023-01-25        2023-01-27        N lost_to_followup
      57          2023-01-19        2023-01-23        Y             case
      58          2023-01-22        2023-01-26        Y             case
      59          2023-01-27        2023-01-27        Y             case
      60          2023-02-04        2023-02-04        N   under_followup
      61          2023-01-29        2023-01-30        N lost_to_followup
      62          2023-01-26        2023-01-28        Y             case
      63          2023-01-25        2023-01-30        Y             case
      64          2023-01-27        2023-01-30        Y             case
      65          2023-01-27        2023-01-31        Y             case
      66          2023-01-31        2023-02-04        N   under_followup
      67          2023-01-27        2023-01-28        N   under_followup
      68          2023-01-24        2023-01-29        N   under_followup
      69          2023-01-26        2023-01-27        N   under_followup
      70          2023-01-30        2023-01-31        Y             case
      71          2023-01-20        2023-01-25        N   under_followup
      72          2023-02-01        2023-02-04        Y             case
      73          2023-01-29        2023-01-31        N   under_followup
      74          2023-01-31        2023-02-04        N lost_to_followup
      75          2023-01-24        2023-01-30        N lost_to_followup
      76          2023-01-28        2023-02-02        Y             case
      77          2023-01-27        2023-02-02        Y             case
      78          2023-01-29        2023-02-01        N   under_followup
      79          2023-02-03        2023-02-04        Y             case
      80          2023-01-31        2023-02-05        N   under_followup
      81          2023-02-01        2023-02-02        N   under_followup
      82          2023-02-01        2023-02-04        N   under_followup
      83          2023-02-01        2023-02-02        N   under_followup
      84          2023-02-01        2023-02-03        Y             case
      85          2023-01-28        2023-02-01        N   under_followup
      86          2023-01-30        2023-02-03        N   under_followup
      87          2023-01-31        2023-02-01        Y             case
      88          2023-01-30        2023-02-02        Y             case
      89          2023-01-31        2023-01-31        Y             case
      90          2023-01-31        2023-02-04        N   under_followup
      91          2023-01-28        2023-02-04        N   under_followup
      92          2023-01-30        2023-02-04        Y             case
      93          2023-02-01        2023-02-06        N   under_followup
      94          2023-02-01        2023-02-03        N lost_to_followup
      95          2023-01-31        2023-02-04        N   under_followup
      96          2023-02-04        2023-02-06        Y             case
      97          2023-02-03        2023-02-05        Y             case
      98          2023-02-02        2023-02-04        N   under_followup
      99          2023-02-02        2023-02-05        N   under_followup
      100         2023-01-30        2023-02-04        Y             case
      101         2023-02-04        2023-02-08        N          unknown
      102         2023-01-31        2023-02-07        N   under_followup
      103         2023-02-05        2023-02-06        N   under_followup
      104         2023-01-30        2023-02-04        N lost_to_followup
      105         2023-02-01        2023-02-04        N   under_followup
      106         2023-02-01        2023-02-06        N   under_followup
      107         2023-02-05        2023-02-08        Y             case
      108         2023-02-04        2023-02-10        N   under_followup
      109         2023-02-02        2023-02-08        N   under_followup
      110         2023-02-06        2023-02-08        Y             case
      111         2023-02-08        2023-02-12        N   under_followup
      112         2023-02-10        2023-02-11        Y             case
      113         2023-02-14        2023-02-19        Y             case
      114         2023-02-11        2023-02-12        N   under_followup
      115         2023-02-13        2023-02-16        Y             case
      116         2023-02-10        2023-02-13        N   under_followup
      117         2023-02-15        2023-02-16        N lost_to_followup
      118         2023-02-10        2023-02-13        Y             case
      119         2023-02-16        2023-02-18        Y             case
      120         2023-02-18        2023-02-18        N   under_followup
      121         2023-03-02        2023-03-02        Y             case
      122         2023-02-26        2023-03-03        Y             case
      123         2023-02-18        2023-02-23        N   under_followup
      124         2023-02-24        2023-02-26        Y             case
      125         2023-02-17        2023-02-23        Y             case
      126         2023-02-18        2023-02-21        N   under_followup
      127         2023-02-16        2023-02-19        N   under_followup
      128         2023-03-01        2023-03-05        N   under_followup
      129         2023-03-06        2023-03-07        Y             case
      130         2023-03-03        2023-03-04        Y             case
      131         2023-03-04        2023-03-09        N   under_followup
      132         2023-03-07        2023-03-09        Y             case
      133         2023-02-27        2023-03-02        N lost_to_followup
      134         2023-03-02        2023-03-07        N   under_followup
      135         2023-03-08        2023-03-10        N   under_followup
      136         2023-03-02        2023-03-09        N lost_to_followup
      137         2023-03-06        2023-03-11        Y             case
      138         2023-03-07        2023-03-11        Y             case
      139         2023-03-16        2023-03-18        N   under_followup
      140         2023-03-14        2023-03-18        N lost_to_followup
      141         2023-03-18        2023-03-23        Y             case
      142         2023-03-20        2023-03-20        Y             case
      143         2023-03-19        2023-03-21        N   under_followup
      144         2023-03-07        2023-03-12        Y             case
      145         2023-03-10        2023-03-14        Y             case
      146         2023-03-06        2023-03-11        Y             case
      147         2023-03-08        2023-03-12        N   under_followup
      148         2023-03-07        2023-03-09        N   under_followup
      149         2023-03-10        2023-03-11        Y             case
      150         2023-03-26        2023-03-29        N          unknown
      151         2023-03-23        2023-03-27        N   under_followup
      152         2023-03-16        2023-03-21        Y             case
      153         2023-03-16        2023-03-19        Y             case
      154         2023-03-12        2023-03-19        Y             case
      155         2023-03-10        2023-03-14        N lost_to_followup
      156         2023-03-13        2023-03-14        Y             case
      157         2023-03-12        2023-03-14        Y             case
      158         2023-03-12        2023-03-17        Y             case
      159         2023-03-15        2023-03-18        N lost_to_followup
      160         2023-03-10        2023-03-15        N lost_to_followup
      161         2023-03-06        2023-03-12        N   under_followup
      162         2023-03-12        2023-03-17        Y             case
      163         2023-03-15        2023-03-18        Y             case
      164         2023-03-26        2023-03-29        N   under_followup
      165         2023-03-21        2023-03-25        Y             case
      166         2023-03-16        2023-03-19        N   under_followup
      167         2023-03-20        2023-03-22        N   under_followup
      168         2023-03-17        2023-03-20        N   under_followup
      169         2023-03-21        2023-03-22        N   under_followup
      170         2023-03-16        2023-03-20        Y             case
      171         2023-03-18        2023-03-21        Y             case
      172         2023-03-17        2023-03-18        Y             case
      173         2023-03-20        2023-03-21        Y             case
      174         2023-03-26        2023-03-27        Y             case
      175         2023-03-24        2023-03-24        Y             case
      176         2023-03-22        2023-03-24        Y             case
      177         2023-03-19        2023-03-24        Y             case
      178         2023-03-23        2023-03-24        N   under_followup
      179         2023-03-20        2023-03-21        N   under_followup
      180         2023-03-20        2023-03-20        N          unknown
      181         2023-03-20        2023-03-20        Y             case
      182         2023-03-11        2023-03-17        N   under_followup
      183         2023-03-28        2023-04-02        N   under_followup
      184         2023-04-01        2023-04-02        N   under_followup
      185         2023-03-29        2023-04-01        Y             case
      186         2023-03-24        2023-03-26        N   under_followup
      187         2023-03-27        2023-03-29        N   under_followup
      188         2023-03-27        2023-03-28        Y             case
      189         2023-03-27        2023-03-30        N lost_to_followup
      190         2023-03-25        2023-03-29        N   under_followup
      191         2023-03-25        2023-03-27        N   under_followup
      192         2023-03-23        2023-03-27        N          unknown
      193         2023-03-24        2023-03-29        N   under_followup
      194         2023-03-23        2023-03-28        Y             case
      195         2023-03-25        2023-03-29        Y             case
      196         2023-03-26        2023-03-28        Y             case
      197         2023-04-08        2023-04-08        N lost_to_followup
      198         2023-04-02        2023-04-07        Y             case
      199         2023-04-03        2023-04-06        Y             case
      200         2023-03-31        2023-04-03        Y             case
      201         2023-03-28        2023-04-01        Y             case
      202         2023-03-30        2023-03-31        N   under_followup
      203         2023-03-28        2023-04-01        N   under_followup
      204         2023-03-24        2023-03-29        Y             case
      205         2023-03-27        2023-03-27        N   under_followup
      206         2023-03-24        2023-03-30        N lost_to_followup
      207         2023-03-26        2023-03-28        N lost_to_followup
      208         2023-03-28        2023-04-01        Y             case
      209         2023-03-30        2023-04-06        Y             case
      210         2023-04-03        2023-04-05        Y             case
      211         2023-03-28        2023-04-01        N lost_to_followup
      212         2023-04-07        2023-04-08        Y             case
      213         2023-04-08        2023-04-08        Y             case
      214         2023-04-07        2023-04-10        N   under_followup
      215         2023-04-10        2023-04-10        N   under_followup
      216         2023-04-02        2023-04-03        N   under_followup
      217         2023-04-02        2023-04-06        N   under_followup
      218         2023-04-06        2023-04-06        Y             case
      219         2023-04-04        2023-04-07        N   under_followup
      220         2023-04-01        2023-04-05        Y             case
      221         2023-03-31        2023-04-05        N   under_followup
      222         2023-04-04        2023-04-06        N   under_followup
      223         2023-04-03        2023-04-06        Y             case
      224         2023-04-03        2023-04-05        N          unknown
      225         2023-04-01        2023-04-04        Y             case
      226         2023-04-02        2023-04-04        N          unknown
      227         2023-04-04        2023-04-07        N   under_followup
      228         2023-04-11        2023-04-16        Y             case
      229         2023-04-09        2023-04-12        Y             case
      230         2023-04-11        2023-04-12        N   under_followup
      231         2023-04-05        2023-04-06        Y             case
      232         2023-04-01        2023-04-03        Y             case
      233         2023-04-01        2023-04-09        Y             case
      234         2023-04-04        2023-04-08        Y             case
      235         2023-04-12        2023-04-13        Y             case
      236         2023-04-05        2023-04-08        N   under_followup
      237         2023-04-14        2023-04-17        Y             case
      238         2023-04-11        2023-04-13        N          unknown
      239         2023-04-03        2023-04-05        Y             case
      240         2023-04-03        2023-04-06        N          unknown
      241         2023-04-06        2023-04-12        N   under_followup
      242         2023-04-09        2023-04-12        Y             case
      243         2023-04-09        2023-04-14        N          unknown
      244         2023-04-10        2023-04-16        Y             case
      245         2023-04-09        2023-04-11        N   under_followup
      246         2023-04-07        2023-04-10        N   under_followup
      247         2023-04-07        2023-04-10        N   under_followup
      248         2023-04-12        2023-04-14        N   under_followup
      249         2023-04-06        2023-04-11        Y             case
      250         2023-04-07        2023-04-12        Y             case
      251         2023-04-04        2023-04-11        Y             case
      252         2023-04-10        2023-04-11        Y             case
      253         2023-04-13        2023-04-16        Y             case
      254         2023-04-14        2023-04-18        Y             case
      255         2023-04-17        2023-04-18        N lost_to_followup
      256         2023-04-11        2023-04-16        N   under_followup
      257         2023-04-13        2023-04-14        Y             case
      258         2023-04-15        2023-04-16        N   under_followup
      259         2023-04-11        2023-04-18        N   under_followup
      260         2023-04-15        2023-04-18        Y             case
      261         2023-04-14        2023-04-14        Y             case
      262         2023-04-09        2023-04-14        N lost_to_followup
      263         2023-04-12        2023-04-21        Y             case
      264         2023-04-16        2023-04-21        Y             case
      265         2023-04-24        2023-04-26        N   under_followup
      266         2023-04-19        2023-04-25        Y             case
      267         2023-04-23        2023-04-25        Y             case
      268         2023-04-10        2023-04-17        N   under_followup
      269         2023-04-13        2023-04-16        N   under_followup
      270         2023-04-16        2023-04-19        N          unknown
      271         2023-04-13        2023-04-18        N   under_followup
      272         2023-04-16        2023-04-17        N   under_followup
      273         2023-04-25        2023-04-28        N lost_to_followup
      274         2023-04-25        2023-04-27        N   under_followup
      275         2023-04-16        2023-04-16        N          unknown
      276         2023-04-11        2023-04-15        Y             case
      277         2023-04-23        2023-04-26        Y             case
      278         2023-04-21        2023-04-22        Y             case
      279         2023-04-18        2023-04-22        Y             case
      280         2023-04-21        2023-04-25        N          unknown
      281         2023-04-21        2023-04-25        Y             case
      282         2023-04-26        2023-04-27        N          unknown
      283         2023-05-05        2023-05-06        Y             case
      284         2023-04-28        2023-04-29        Y             case
      285         2023-04-28        2023-04-28        N lost_to_followup
      286         2023-04-27        2023-04-30        N lost_to_followup
      287         2023-04-26        2023-04-28        N   under_followup
      288         2023-04-22        2023-04-24        N   under_followup
      289         2023-04-22        2023-04-23        N   under_followup
      290         2023-04-19        2023-04-21        Y             case
      291         2023-04-21        2023-04-23        Y             case
      292         2023-05-03        2023-05-05        Y             case
      293         2023-05-07        2023-05-08        N   under_followup
      294         2023-05-03        2023-05-09        N   under_followup
      295         2023-05-06        2023-05-08        Y             case
      296         2023-05-03        2023-05-04        N   under_followup
      297         2023-05-01        2023-05-03        Y             case
      298         2023-04-28        2023-05-01        N lost_to_followup
      299         2023-04-25        2023-04-29        N   under_followup
      300         2023-04-25        2023-04-27        Y             case
      301         2023-04-20        2023-04-25        Y             case
      302         2023-04-30        2023-05-09        N   under_followup
      303         2023-05-08        2023-05-10        Y             case
      304         2023-05-04        2023-05-07        N   under_followup
      305         2023-05-04        2023-05-06        N   under_followup
      306         2023-04-28        2023-05-04        Y             case
      307         2023-05-03        2023-05-06        N          unknown
      308         2023-04-26        2023-04-30        N   under_followup
      309         2023-04-19        2023-04-25        Y             case
      310         2023-04-25        2023-04-26        Y             case
      311         2023-04-24        2023-04-27        N   under_followup
      312         2023-04-25        2023-04-29        Y             case
      313         2023-05-08        2023-05-08        N lost_to_followup
      314         2023-05-04        2023-05-08        N          unknown
      315         2023-05-05        2023-05-08        Y             case
      316         2023-05-07        2023-05-10        N   under_followup
      317         2023-04-23        2023-04-26        N   under_followup
      318         2023-04-25        2023-04-25        N          unknown
      319         2023-04-22        2023-04-28        Y             case
      320         2023-04-22        2023-04-29        N   under_followup
      321         2023-04-27        2023-04-30        N   under_followup
      322         2023-04-29        2023-05-02        N   under_followup
      323         2023-05-10        2023-05-12        N   under_followup
      324         2023-05-15        2023-05-16        N   under_followup
      325         2023-05-01        2023-05-03        Y             case
      326         2023-05-09        2023-05-14        N   under_followup
      

# sim_outbreak works as expected

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
      $linelist
         id        case_name case_type sex age date_onset date_admission   outcome
      1   1  Wajdi al-Demian  probable   m  35 2023-01-01           <NA> recovered
      2   2    Raaid el-Diab confirmed   m  43 2023-01-01     2023-01-07 recovered
      3   3   Nickolas Nault suspected   m   1 2023-01-01           <NA> recovered
      4   5      Hee Kennedy confirmed   m  78 2023-01-01     2023-01-03      died
      5   6      Hope Arshad suspected   f  22 2023-01-01     2023-01-28      died
      6   8   Shanta Holiday  probable   f  28 2023-01-01           <NA> recovered
      7  11 Raakaan al-Shams  probable   m  46 2023-01-01           <NA> recovered
      8  12   Chandra Kilian suspected   f  67 2023-01-01           <NA> recovered
      9  13  Ricardo Sanchez confirmed   m  86 2023-01-01           <NA> recovered
      10 18    Kanani Nguyen confirmed   f  60 2023-01-02           <NA> recovered
      11 20   Jared Chambers  probable   m  49 2023-01-02           <NA> recovered
      12 22     Annie Carter  probable   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05     24.1
      3          <NA>         2022-12-30        2023-01-02       NA
      4    2023-01-21         2022-12-29        2023-01-02     24.1
      5    2023-01-10         2023-01-01        2023-01-03       NA
      6          <NA>         2023-01-03        2023-01-04       NA
      7          <NA>         2023-01-04        2023-01-05       NA
      8          <NA>         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03     24.1
      10         <NA>         2022-12-30        2023-01-03     24.1
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03       NA
      
      $contacts
                     from                     to age sex date_first_contact
      1   Wajdi al-Demian          Raaid el-Diab  43   m         2022-12-30
      2   Wajdi al-Demian         Nickolas Nault   1   m         2022-12-30
      3     Raaid el-Diab            Durine Cobb  29   f         2022-12-27
      4     Raaid el-Diab            Hee Kennedy  78   m         2022-12-29
      5    Nickolas Nault            Hope Arshad  22   f         2023-01-01
      6    Nickolas Nault      Mubarak el-Vaziri  70   m         2022-12-30
      7    Nickolas Nault         Shanta Holiday  28   f         2023-01-03
      8       Hee Kennedy           Darian Guyon  37   f         2023-01-06
      9       Hope Arshad          Mackenzie Ahn  61   f         2023-01-01
      10   Shanta Holiday       Raakaan al-Shams  46   m         2023-01-04
      11   Shanta Holiday         Chandra Kilian  67   f         2023-01-01
      12   Shanta Holiday        Ricardo Sanchez  86   m         2022-12-31
      13 Raakaan al-Shams         Tae Woo Nguyen  71   m         2022-12-28
      14 Raakaan al-Shams       Mikhaila Carlson  51   f         2023-01-01
      15 Raakaan al-Shams         Alexander Orio  44   m         2023-01-02
      16   Chandra Kilian      Alexandra Johnson  49   f         2023-01-02
      17  Ricardo Sanchez          Kanani Nguyen  60   f         2022-12-30
      18  Ricardo Sanchez Nirvana Elizalde Villa  56   f         2023-01-06
      19  Ricardo Sanchez         Jared Chambers  49   m         2023-01-01
      20  Ricardo Sanchez         Thomas Morales  50   m         2023-01-01
      21    Kanani Nguyen           Annie Carter   7   f         2023-01-01
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-02        Y             case
      3         2023-01-03        N   under_followup
      4         2023-01-02        Y             case
      5         2023-01-03        Y             case
      6         2023-01-02        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-06        N   under_followup
      9         2023-01-05        N lost_to_followup
      10        2023-01-05        Y             case
      11        2023-01-04        Y             case
      12        2023-01-03        Y             case
      13        2023-01-05        N lost_to_followup
      14        2023-01-04        N   under_followup
      15        2023-01-05        N   under_followup
      16        2023-01-03        N   under_followup
      17        2023-01-03        Y             case
      18        2023-01-09        N          unknown
      19        2023-01-04        Y             case
      20        2023-01-03        N lost_to_followup
      21        2023-01-03        Y             case
      

# sim_outbreak works as expected with anonymised

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
      $linelist
         id  case_name case_type sex age date_onset date_admission   outcome
      1   1 qKY39Zyiuu  probable   m  35 2023-01-01           <NA> recovered
      2   2 oY8Kxng7Az confirmed   m  43 2023-01-01     2023-01-07 recovered
      3   3 DS6oXfHuaq  probable   m   1 2023-01-01           <NA> recovered
      4   5 yEtT6tejRt confirmed   m  78 2023-01-01     2023-01-03      died
      5   6 34oCba8e6y confirmed   f  22 2023-01-01     2023-01-28      died
      6   8 eZaLTmhWsV suspected   f  28 2023-01-01           <NA> recovered
      7  11 XnmE3U4HDz confirmed   m  46 2023-01-01           <NA> recovered
      8  12 SVgVAWQihv confirmed   f  67 2023-01-01           <NA> recovered
      9  13 SfYVARDjDa confirmed   m  86 2023-01-01           <NA> recovered
      10 18 3p6KxuczwJ  probable   f  60 2023-01-02           <NA> recovered
      11 20 6ZKaUKvu5A  probable   m  49 2023-01-02           <NA> recovered
      12 22 tN2GNkk2uu confirmed   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05     24.2
      3          <NA>         2022-12-30        2023-01-02       NA
      4    2023-01-21         2022-12-29        2023-01-02     24.2
      5    2023-01-10         2023-01-01        2023-01-03     24.2
      6          <NA>         2023-01-03        2023-01-04       NA
      7          <NA>         2023-01-04        2023-01-05     24.2
      8          <NA>         2023-01-01        2023-01-04     24.2
      9          <NA>         2022-12-31        2023-01-03     24.2
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     24.2
      
      $contacts
               from         to age sex date_first_contact date_last_contact was_case
      1  qKY39Zyiuu oY8Kxng7Az  43   m         2022-12-30        2023-01-05        Y
      2  qKY39Zyiuu DS6oXfHuaq   1   m         2022-12-30        2023-01-02        Y
      3  oY8Kxng7Az m1SzNbO5h4  29   f         2022-12-27        2023-01-03        N
      4  oY8Kxng7Az yEtT6tejRt  78   m         2022-12-29        2023-01-02        Y
      5  DS6oXfHuaq 34oCba8e6y  22   f         2023-01-01        2023-01-03        Y
      6  DS6oXfHuaq KFNmydPL7X  70   m         2022-12-30        2023-01-02        N
      7  DS6oXfHuaq eZaLTmhWsV  28   f         2023-01-03        2023-01-04        Y
      8  yEtT6tejRt UBVWYTLkhw  37   f         2023-01-06        2023-01-06        N
      9  34oCba8e6y 9tYeb1elcz  61   f         2023-01-01        2023-01-05        N
      10 eZaLTmhWsV XnmE3U4HDz  46   m         2023-01-04        2023-01-05        Y
      11 eZaLTmhWsV SVgVAWQihv  67   f         2023-01-01        2023-01-04        Y
      12 eZaLTmhWsV SfYVARDjDa  86   m         2022-12-31        2023-01-03        Y
      13 XnmE3U4HDz fq8m2zbFUJ  71   m         2022-12-28        2023-01-05        N
      14 XnmE3U4HDz RewLYtBBlI  51   f         2023-01-01        2023-01-04        N
      15 XnmE3U4HDz dUTzmcTo9H  44   m         2023-01-02        2023-01-05        N
      16 SVgVAWQihv LY9VZdzuuT  49   f         2023-01-02        2023-01-03        N
      17 SfYVARDjDa 3p6KxuczwJ  60   f         2022-12-30        2023-01-03        Y
      18 SfYVARDjDa 3WvUcVV4dJ  56   f         2023-01-06        2023-01-09        N
      19 SfYVARDjDa 6ZKaUKvu5A  49   m         2023-01-01        2023-01-04        Y
      20 SfYVARDjDa k6RZkfVJ5f  50   m         2023-01-01        2023-01-03        N
      21 3p6KxuczwJ tN2GNkk2uu   7   f         2023-01-01        2023-01-03        Y
                   status
      1              case
      2              case
      3    under_followup
      4              case
      5              case
      6  lost_to_followup
      7              case
      8    under_followup
      9    under_followup
      10             case
      11             case
      12             case
      13   under_followup
      14          unknown
      15   under_followup
      16   under_followup
      17             case
      18   under_followup
      19             case
      20   under_followup
      21             case
      

# sim_outbreak works as expected with age-strat risks

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
      $linelist
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1         Kyle Crane suspected   m  35 2023-01-01           <NA> recovered
      2   2 Ghaamid el-Ishmael confirmed   m  43 2023-01-01     2023-01-07 recovered
      3   3   Faatih el-Kaiser confirmed   m   1 2023-01-01           <NA> recovered
      4   5   Va'Aahi Galligan suspected   m  78 2023-01-01           <NA> recovered
      5   6     Katelyn Catlin confirmed   f  22 2023-01-01           <NA> recovered
      6   8       Lynsey Duron confirmed   f  28 2023-01-01           <NA> recovered
      7  11    Wajdi al-Demian confirmed   m  46 2023-01-01           <NA> recovered
      8  12       Jacy Cousins confirmed   f  67 2023-01-01           <NA> recovered
      9  13      Travis Foster confirmed   m  86 2023-01-01           <NA> recovered
      10 18     Maria Eberhart  probable   f  60 2023-01-02           <NA> recovered
      11 20  Mubarak el-Vaziri suspected   m  49 2023-01-02           <NA> recovered
      12 22        Erin Payson confirmed   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05     25.1
      3          <NA>         2022-12-30        2023-01-02     25.1
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03     25.1
      6          <NA>         2023-01-03        2023-01-04     25.1
      7          <NA>         2023-01-04        2023-01-05     25.1
      8          <NA>         2023-01-01        2023-01-04     25.1
      9          <NA>         2022-12-31        2023-01-03     25.1
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     25.1
      
      $contacts
                       from                     to age sex date_first_contact
      1          Kyle Crane     Ghaamid el-Ishmael  43   m         2022-12-30
      2          Kyle Crane       Faatih el-Kaiser   1   m         2022-12-30
      3  Ghaamid el-Ishmael Carisa Flores-Gonzalez  29   f         2022-12-27
      4  Ghaamid el-Ishmael       Va'Aahi Galligan  78   m         2022-12-29
      5    Faatih el-Kaiser         Katelyn Catlin  22   f         2023-01-01
      6    Faatih el-Kaiser          Aiman el-Riaz  70   m         2022-12-30
      7    Faatih el-Kaiser           Lynsey Duron  28   f         2023-01-03
      8    Va'Aahi Galligan        Amaani al-Gaber  37   f         2023-01-06
      9      Katelyn Catlin         Lilibeth Black  61   f         2023-01-01
      10       Lynsey Duron        Wajdi al-Demian  46   m         2023-01-04
      11       Lynsey Duron           Jacy Cousins  67   f         2023-01-01
      12       Lynsey Duron          Travis Foster  86   m         2022-12-31
      13    Wajdi al-Demian         Raymond Murray  71   m         2022-12-28
      14    Wajdi al-Demian       Marquaja Johnson  51   f         2023-01-01
      15    Wajdi al-Demian          Raaid el-Diab  44   m         2023-01-02
      16       Jacy Cousins            Kayla Tudor  49   f         2023-01-02
      17      Travis Foster         Maria Eberhart  60   f         2022-12-30
      18      Travis Foster            Katja Muetz  56   f         2023-01-06
      19      Travis Foster      Mubarak el-Vaziri  49   m         2023-01-01
      20      Travis Foster     Alexandre Guerrero  50   m         2023-01-01
      21     Maria Eberhart            Erin Payson   7   f         2023-01-01
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
      

# sim_outbreak works as expected with age structure

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
      $linelist
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1      Gabriel Black  probable   m  44 2023-01-01     2023-01-02 recovered
      2   2       Tyler Kelley confirmed   m  13 2023-01-01           <NA> recovered
      3   3       Cody Morales suspected   m  22 2023-01-01           <NA> recovered
      4   5          Joewid Le  probable   m  85 2023-01-01           <NA> recovered
      5   6      Carolyn Moore confirmed   f  41 2023-01-01           <NA> recovered
      6   8  Cheyenne Sayavong confirmed   f  89 2023-01-01           <NA> recovered
      7  11 Pierce Khanthavong confirmed   m  69 2023-01-01           <NA> recovered
      8  12          Kendra To suspected   f  23 2023-01-01           <NA> recovered
      9  13  Preston Barringer confirmed   m   9 2023-01-01           <NA> recovered
      10 18  Dominique Raymond confirmed   f  62 2023-01-02     2023-01-03      died
      11 20   Bassaam el-Majid  probable   m  52 2023-01-02           <NA> recovered
      12 22      Susana Varela  probable   f  76 2023-01-02     2023-01-05 recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05       24
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03       24
      6          <NA>         2023-01-03        2023-01-04       24
      7          <NA>         2023-01-04        2023-01-05       24
      8          <NA>         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03       24
      10   2023-01-21         2022-12-30        2023-01-03       24
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03       NA
      
      $contacts
                       from                        to age sex date_first_contact
      1       Gabriel Black              Tyler Kelley  13   m         2022-12-30
      2       Gabriel Black              Cody Morales  22   m         2022-12-30
      3        Tyler Kelley             Taylor Graves   5   f         2022-12-27
      4        Tyler Kelley                 Joewid Le  85   m         2022-12-29
      5        Cody Morales             Carolyn Moore  41   f         2023-01-01
      6        Cody Morales           Rushdi al-Ishak   2   m         2022-12-30
      7        Cody Morales         Cheyenne Sayavong  89   f         2023-01-03
      8           Joewid Le         Mercedes Lovelace  86   f         2023-01-06
      9       Carolyn Moore Chantelle Vazquez-Luevano  82   f         2023-01-01
      10  Cheyenne Sayavong        Pierce Khanthavong  69   m         2023-01-04
      11  Cheyenne Sayavong                 Kendra To  23   f         2023-01-01
      12  Cheyenne Sayavong         Preston Barringer   9   m         2022-12-31
      13 Pierce Khanthavong           Jackson Carlson  79   m         2022-12-28
      14 Pierce Khanthavong               Megan Hayes  29   f         2023-01-01
      15 Pierce Khanthavong               Sam Spencer   4   m         2023-01-02
      16          Kendra To         Amanda Larochelle  13   f         2023-01-02
      17  Preston Barringer         Dominique Raymond  62   f         2022-12-30
      18  Preston Barringer            Natalie Newton  24   f         2023-01-06
      19  Preston Barringer          Bassaam el-Majid  52   m         2023-01-01
      20  Preston Barringer           Qaaid al-Madani  74   m         2023-01-01
      21  Dominique Raymond             Susana Varela  76   f         2023-01-01
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-02        Y             case
      3         2023-01-03        N          unknown
      4         2023-01-02        Y             case
      5         2023-01-03        Y             case
      6         2023-01-02        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-06        N   under_followup
      9         2023-01-05        N   under_followup
      10        2023-01-05        Y             case
      11        2023-01-04        Y             case
      12        2023-01-03        Y             case
      13        2023-01-05        N   under_followup
      14        2023-01-04        N lost_to_followup
      15        2023-01-05        N   under_followup
      16        2023-01-03        N   under_followup
      17        2023-01-03        Y             case
      18        2023-01-09        N          unknown
      19        2023-01-04        Y             case
      20        2023-01-03        N   under_followup
      21        2023-01-03        Y             case
      

