# sim_linelist works as expected with defaults

    Code
      sim_linelist()
    Output
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

# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
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

# sim_linelist works as expected with age-strat risks

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
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

# sim_linelist works as expected with anonymous

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
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

# sim_linelist works as expected with age structure

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
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

# sim_linelist works as expected with age-strat risks & age struct

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, population_age = age_struct)
    Output
         id           case_name case_type sex age date_onset date_admission   outcome
      1   1        Bryce Kelley confirmed   m  44 2023-01-01           <NA> recovered
      2   2 Khristopher Carlson confirmed   m  13 2023-01-01           <NA> recovered
      3   3       Cleatus Black suspected   m  22 2023-01-01           <NA> recovered
      4   5       Tyler Spencer confirmed   m  85 2023-01-01           <NA> recovered
      5   6    Sajiyya el-Bahri confirmed   f  41 2023-01-01           <NA> recovered
      6   8   Shameema al-Fayad confirmed   f  89 2023-01-01           <NA> recovered
      7  11           Jelani Le confirmed   m  69 2023-01-01           <NA> recovered
      8  12    Ashley Depoyster confirmed   f  23 2023-01-01           <NA> recovered
      9  13     Rushdi el-Amara  probable   m   9 2023-01-01           <NA> recovered
      10 18      Sabrina Catlin suspected   f  62 2023-01-02           <NA> recovered
      11 20       Jackson Sheek confirmed   m  52 2023-01-02           <NA> recovered
      12 22       Talia Cousins  probable   f  76 2023-01-02     2023-01-05 recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>     25.5
      2          <NA>         2022-12-30        2023-01-05     25.5
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02     25.5
      5          <NA>         2023-01-01        2023-01-03     25.5
      6          <NA>         2023-01-03        2023-01-04     25.5
      7          <NA>         2023-01-04        2023-01-05     25.5
      8          <NA>         2023-01-01        2023-01-04     25.5
      9          <NA>         2022-12-31        2023-01-03       NA
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04     25.5
      12         <NA>         2023-01-01        2023-01-03       NA

# sim_linelist works as expected with modified config

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution = "geom",
          last_contact_distribution_params = c(prob = 0.5)))
    Output
         id           case_name case_type sex age date_onset date_admission   outcome
      1   1        Lily Camacho confirmed   f  20 2023-01-01           <NA> recovered
      2   2 Charles Stuart Rasi suspected   m  24 2023-01-01     2023-01-02      died
      3   3        Jonah Burden suspected   m  51 2023-01-01           <NA> recovered
      4   5          Craig Agee  probable   m  16 2023-01-01           <NA> recovered
      5   6 Christopher Lohrenz suspected   m  83 2023-01-01           <NA>      died
      6   8      Kevin Saunders suspected   m  48 2023-01-01           <NA> recovered
      7  11     Saabiq al-Samra  probable   m  77 2023-01-01     2023-01-15 recovered
      8  12      Kenneth Cahill confirmed   m  90 2023-01-01           <NA> recovered
      9  13    Halle Batchelder confirmed   f  66 2023-01-01           <NA> recovered
      10 18  Morgan Grant-Perry confirmed   f  31 2023-01-02           <NA> recovered
      11 20      Enrique Galvan confirmed   m  46 2023-01-02           <NA> recovered
      12 22     Robert Chaparro confirmed   m  75 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>     24.7
      2    2023-01-10         2022-12-30        2023-01-01       NA
      3          <NA>         2022-12-31        2023-01-02       NA
      4          <NA>         2022-12-30        2023-01-02       NA
      5    2023-01-16         2022-12-31        2023-01-01       NA
      6          <NA>         2022-12-31        2023-01-01       NA
      7          <NA>         2022-12-30        2023-01-02       NA
      8          <NA>         2022-12-30        2023-01-01     24.7
      9          <NA>         2022-12-29        2023-01-01     24.7
      10         <NA>         2022-12-30        2023-01-01     24.7
      11         <NA>         2022-12-30        2023-01-01     24.7
      12         <NA>         2022-12-30        2023-01-02     24.7

# sim_linelist works as expected with modified config parameters

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution_params = c(lambda = 5)))
    Output
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
      2          <NA>         2023-01-01        2023-01-07     24.1
      3          <NA>         2022-12-31        2023-01-03       NA
      4    2023-01-21         2022-12-31        2023-01-04     24.1
      5    2023-01-10         2023-01-02        2023-01-04       NA
      6          <NA>         2023-01-06        2023-01-07       NA
      7          <NA>         2023-01-07        2023-01-08       NA
      8          <NA>         2023-01-03        2023-01-06       NA
      9          <NA>         2023-01-02        2023-01-05     24.1
      10         <NA>         2023-01-01        2023-01-05     24.1
      11         <NA>         2023-01-04        2023-01-07       NA
      12         <NA>         2023-01-03        2023-01-05       NA

# sim_linelist works as expected with time-varying cfr

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(time_varying_death_risk = function(risk, time) risk *
          exp(-time)))
    Output
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

# sim_linelist works as expected with time-varying cfr & age-strat

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_death_risk = age_dep_hosp_death_risk, config = create_config(
          time_varying_death_risk = function(risk, time) risk * exp(-time)))
    Output
         id          case_name case_type sex age date_onset date_admission   outcome
      1   1         Kyle Crane suspected   m  35 2023-01-01           <NA> recovered
      2   2 Ghaamid el-Ishmael confirmed   m  43 2023-01-01     2023-01-07 recovered
      3   3   Faatih el-Kaiser confirmed   m   1 2023-01-01           <NA> recovered
      4   5   Va'Aahi Galligan suspected   m  78 2023-01-01     2023-01-03 recovered
      5   6     Katelyn Catlin confirmed   f  22 2023-01-01     2023-01-28 recovered
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

