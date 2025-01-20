# sim_linelist works as expected with defaults

    Code
      sim_linelist()
    Output
           id                case_name case_type sex age date_onset date_admission
      1     1              James Manis suspected   m  59 2023-01-01     2023-01-09
      2     2            Anisa Hatcher confirmed   f  90 2023-01-01           <NA>
      3     3              Morgan Bohn confirmed   f   4 2023-01-02           <NA>
      4     5             David Welter confirmed   m  29 2023-01-04           <NA>
      5     6            Sade Phillips suspected   f  14 2023-01-05     2023-01-09
      6     7          Sameeha al-Zaki  probable   f  85 2023-01-06     2023-01-08
      7    10    Cornelius Stadelbauer  probable   m  25 2023-01-13           <NA>
      8    11          Hafsa al-Arshad confirmed   f  34 2023-01-11     2023-01-24
      9    12                Maiya Kim suspected   f  89 2023-01-13           <NA>
      10   14           Desmond Ibarra suspected   m  63 2023-01-11           <NA>
      11   18  Carlo Ceazar Strausburg confirmed   m  74 2023-01-14           <NA>
      12   19    Jennifer Vathanavarin  probable   f  34 2023-01-12           <NA>
      13   22              Deisha Wall confirmed   f  29 2023-01-12           <NA>
      14   24          Qamraaa el-Ally  probable   f  46 2023-01-13           <NA>
      15   27          Jaylynn Baldwin confirmed   f  24 2023-01-14     2023-01-19
      16   29       Nafeesa al-Massoud suspected   f  41 2023-01-21           <NA>
      17   30          Dalicia Wilkins confirmed   f  72 2023-01-19           <NA>
      18   31      Sulaimaan al-Farooq suspected   m   6 2023-01-20           <NA>
      19   33           James Colligan confirmed   m  61 2023-01-14           <NA>
      20   34         Crystal Sandoval confirmed   f  44 2023-01-14     2023-02-10
      21   35        Chandel Aviado II confirmed   f  71 2023-01-27           <NA>
      22   38          Utkarsh Hammond confirmed   m  69 2023-01-23           <NA>
      23   39           Orville Mosher  probable   m  61 2023-01-23           <NA>
      24   41        Nawwaara al-Rahim confirmed   f  64 2023-01-24           <NA>
      25   44           Shuaib al-Kaba suspected   m  61 2023-01-22           <NA>
      26   45         Lauren Caramillo  probable   f  66 2023-01-22           <NA>
      27   47          Jamaal el-Sarah confirmed   m  81 2023-01-28           <NA>
      28   50          Jameel Scurlock  probable   m  53 2023-01-28     2023-01-30
      29   51          Khongmong Ahmad confirmed   m  45 2023-01-29           <NA>
      30   53           Nichole Gilroy confirmed   f  42 2023-02-02     2023-02-11
      31   54     Collin Rangel Mendez  probable   m  78 2023-02-03           <NA>
      32   55          Ronnie Maryland confirmed   m  35 2023-01-24           <NA>
      33   56              Itzel Jiron  probable   f  54 2023-01-26           <NA>
      34   58         Brandon Trammell  probable   m  68 2023-01-25     2023-01-29
      35   59              Shane Huang  probable   m   3 2023-01-23           <NA>
      36   60       Mu,Aawiya al-Amiri confirmed   m  44 2023-01-29     2023-02-02
      37   63 Joshua Valencia Anchondo  probable   m  62 2023-01-31           <NA>
      38   64            Cairra Curtis confirmed   m  35 2023-01-29           <NA>
      39   65        Nadheera el-Pasha confirmed   f  90 2023-02-03     2023-02-08
      40   66        Sapphire Freeland confirmed   f  25 2023-02-01     2023-02-05
      41   71              Medhavi Kim suspected   f  46 2023-01-29           <NA>
      42   73        Madelyn Mcfarland confirmed   f   8 2023-02-01           <NA>
      43   77                Kevin Cha  probable   m  63 2023-01-30           <NA>
      44   78         Laraena Sturgeon  probable   f  54 2023-01-29           <NA>
      45   80            Taylor Nguyen  probable   f  67 2023-02-03           <NA>
      46   85         Markese Marchman confirmed   m  37 2023-02-02           <NA>
      47   88         Christian Molina confirmed   m  73 2023-01-30           <NA>
      48   89            Mark Espinosa  probable   m  13 2023-02-02           <NA>
      49   90          Cassandra Lange  probable   f  72 2023-02-01           <NA>
      50   93         Alexander Naylor confirmed   m  61 2023-02-04           <NA>
      51   97                Micah San confirmed   m  22 2023-02-05           <NA>
      52   98         Carmelita Huizar suspected   f  29 2023-02-04           <NA>
      53  101        Daniel Goodfellow  probable   m  17 2023-02-07           <NA>
      54  108           Samuel Johnson  probable   m  71 2023-02-14           <NA>
      55  111           Bertha Montoya confirmed   f  90 2023-02-09           <NA>
      56  113           Taaj al-Rahimi  probable   m  23 2023-02-12           <NA>
      57  114             Lafaith Bean  probable   f  35 2023-02-16           <NA>
      58  116              Joshua Khan  probable   m  62 2023-02-24           <NA>
      59  119             Billye Cohen  probable   f  57 2023-02-23           <NA>
      60  120         Madison Mcdonald confirmed   f  44 2023-02-18           <NA>
      61  122           Wen Kang Zheng confirmed   m  57 2023-03-02           <NA>
      62  123            Sidqi el-Reza  probable   m  63 2023-03-08     2023-03-11
      63  125           Rebekah Norman confirmed   f  46 2023-02-28           <NA>
      64  126              Ryan Fukuda  probable   m  66 2023-02-26           <NA>
      65  130         Jumail al-Salame confirmed   m  68 2023-03-07           <NA>
      66  131            Jez-Mas Woods confirmed   m  12 2023-03-09           <NA>
      67  133          Mikayla Hopkins confirmed   f  51 2023-03-18           <NA>
      68  138             Rosemary Lor suspected   f   2 2023-03-10           <NA>
      69  139       Mansoor al-Hussein confirmed   m  53 2023-03-09     2023-03-16
      70  142           Nawfa el-Ahmad suspected   f  76 2023-03-23           <NA>
      71  143              Raul Millan suspected   m  82 2023-03-21           <NA>
      72  145         Najlaa el-Yassin suspected   f  25 2023-03-15           <NA>
      73  146         Sakeena el-Anwar  probable   f  76 2023-03-13           <NA>
      74  147             Rida al-Ozer  probable   m  14 2023-03-13     2023-03-17
      75  150          Tanya Tollivoro confirmed   f  76 2023-03-11           <NA>
      76  153           Shawn Videtzky confirmed   m  78 2023-03-15           <NA>
      77  154         Kailey Scharnell  probable   f  75 2023-03-24     2023-03-31
      78  155            Orilea Medina  probable   f  76 2023-03-24           <NA>
      79  157            Unique Tinoco confirmed   f  80 2023-03-18           <NA>
      80  158         Raadiya al-Abdoo confirmed   f  41 2023-03-18           <NA>
      81  159              Janie Mohar suspected   f  78 2023-03-19           <NA>
      82  163        Keeman Stockinger confirmed   m  28 2023-03-15           <NA>
      83  164         Frankie Griffith confirmed   f   2 2023-03-21           <NA>
      84  166           Sharon Harding confirmed   f  82 2023-03-26           <NA>
      85  171          Alvaro Vikingur confirmed   m   5 2023-03-22           <NA>
      86  172       Nadheera al-Jafari confirmed   f   1 2023-03-20           <NA>
      87  173     Lane Martinez-Deleon suspected   m  44 2023-03-19     2023-03-22
      88  174                 Ka Ahsan confirmed   m  76 2023-03-16           <NA>
      89  175          Munsif el-Salem confirmed   m   3 2023-03-29           <NA>
      90  176  Abdur Rasheed al-Akbari suspected   m  15 2023-03-25           <NA>
      91  177   Abdul Kareem al-Firman confirmed   m  19 2023-03-26           <NA>
      92  178            Yesenia Diego  probable   f  76 2023-03-25           <NA>
      93  182   Abdul Ghafoor el-Aslam  probable   m  90 2023-03-27           <NA>
      94  186           Raul Rodriguez confirmed   m  64 2023-04-03           <NA>
      95  189             T'Koia Myers confirmed   f  35 2023-03-29           <NA>
      96  195             Ashley Coles suspected   f  84 2023-03-27           <NA>
      97  196            Mason Mcgrier suspected   m  18 2023-03-30     2023-04-03
      98  197                Cam Tu Vu  probable   f  79 2023-03-28     2023-04-03
      99  199          Bao-Tran Suetos confirmed   f  49 2023-04-07           <NA>
      100 200         Sandra Ouellette confirmed   f  56 2023-04-05           <NA>
      101 201           Gina Dalrymple confirmed   f  76 2023-04-07     2023-04-12
      102 202          Razeen el-Karam confirmed   m  41 2023-04-03           <NA>
      103 205         Ashley Armstrong confirmed   f  29 2023-04-01           <NA>
      104 209      Damian Murillo-Soto confirmed   m  39 2023-04-05     2023-04-12
      105 210           Yahya al-Saidi confirmed   m  32 2023-04-01           <NA>
      106 211               Rusty Asad suspected   m   9 2023-04-06           <NA>
      107 213         Manaara el-Bilal suspected   f  39 2023-04-11     2023-04-13
      108 214              Fisayo Rice  probable   m  12 2023-04-17     2023-04-20
      109 219            Jacob Barrett confirmed   m  52 2023-04-10           <NA>
      110 221          Jordan Redhorse confirmed   f  22 2023-04-02           <NA>
      111 224         Laaiqa al-Farrah suspected   f  68 2023-04-08           <NA>
      112 226          Ameen al-Semaan suspected   m  57 2023-04-06           <NA>
      113 229         Azmi el-Abdallah confirmed   m   8 2023-04-12           <NA>
      114 230           Khyleah Dotson suspected   f  28 2023-04-12           <NA>
      115 232            Khampane Behr confirmed   m   2 2023-04-02           <NA>
      116 233        Jose Delgado Diaz confirmed   m  84 2023-04-09           <NA>
      117 234            Eliora Braden confirmed   f  52 2023-04-09     2023-04-13
      118 235               Kevin Tran confirmed   m  58 2023-04-12           <NA>
      119 236         Haakima el-Azizi  probable   f  29 2023-04-10           <NA>
      120 238              Amanda Dodd confirmed   f  30 2023-04-14           <NA>
      121 240     Alex Zaragoza-Madrid confirmed   m  71 2023-04-15           <NA>
      122 243            Marques Cross confirmed   m  43 2023-04-13           <NA>
      123 245           Andrew Lefholz suspected   m  40 2023-04-15           <NA>
      124 250             Roy Williams confirmed   m  46 2023-04-16           <NA>
      125 251              Jason Hoyle confirmed   m  69 2023-04-11           <NA>
      126 252       Yeun Jung Hasegawa confirmed   f  69 2023-04-20           <NA>
      127 253              Yeeleng Sun suspected   m  38 2023-04-20           <NA>
      128 254             Isaac Stuart confirmed   m  28 2023-04-16           <NA>
      129 255         Lawrence Jenkins confirmed   m  82 2023-04-16           <NA>
      130 258            Jasmine Jones suspected   f  19 2023-04-14           <NA>
      131 261                Jose Maez confirmed   m  46 2023-04-26           <NA>
      132 262          Bryanna Herrera suspected   f  71 2023-04-13     2023-04-18
      133 264               Lael Vigil suspected   f   4 2023-04-25     2023-04-27
      134 265         Gericko Martinez suspected   m  31 2023-04-25           <NA>
      135 267           Asiah Marshall  probable   f  16 2023-04-20     2023-04-24
      136 268             Javon Reeves  probable   m  53 2023-04-21     2023-04-29
      137 277            Zachary Major confirmed   m  14 2023-05-01           <NA>
      138 278             Jane Solberg confirmed   f  48 2023-04-28     2023-05-01
      139 279          Razeen al-Shaer confirmed   m  89 2023-04-25           <NA>
      140 280            Ismad al-Azad confirmed   m  39 2023-04-26           <NA>
      141 282             Marcus Ellis confirmed   m  20 2023-04-21     2023-04-26
      142 284        Firdaus el-Satter confirmed   f   6 2023-05-03           <NA>
      143 285  Haley Iron Cloud-Gresko  probable   f  28 2023-05-05           <NA>
      144 291        Justin Cunningham confirmed   m  42 2023-05-01           <NA>
      145 292               Judy David confirmed   f  71 2023-04-23           <NA>
      146 293          Sanaaa el-Farha confirmed   f   9 2023-05-05           <NA>
      147 296        Alexandra Medrano confirmed   f  61 2023-05-06           <NA>
      148 298          Andrew Kelemeni suspected   m  53 2023-05-02           <NA>
      149 301      Alexzandria Holguin  probable   f  76 2023-04-23           <NA>
      150 302             Jazmyn Evans  probable   f  69 2023-04-26           <NA>
      151 304             Ty Gutierrez  probable   m  50 2023-05-07     2023-05-11
      152 307        Jennifer Valverde suspected   f   7 2023-05-09           <NA>
      153 310         Naseera el-Saidi confirmed   f  45 2023-04-24           <NA>
      154 311              Luis Taylor  probable   m  83 2023-04-25           <NA>
      155 313              Kylie Berry suspected   f  41 2023-04-27           <NA>
      156 316            Laneece Ahuna confirmed   f  88 2023-05-10           <NA>
      157 320     John Gonzalez Vargas confirmed   m  79 2023-05-01           <NA>
      158 326            Stephon White confirmed   m  82 2023-05-08     2023-05-21
            outcome date_outcome date_first_contact date_last_contact ct_value
      1        died   2023-01-13               <NA>              <NA>       NA
      2   recovered         <NA>         2022-12-31        2023-01-05     22.3
      3   recovered         <NA>         2022-12-30        2023-01-01     24.5
      4   recovered         <NA>         2023-01-05        2023-01-05     24.8
      5        died   2023-01-23         2023-01-07        2023-01-08       NA
      6   recovered         <NA>         2023-01-03        2023-01-06       NA
      7   recovered         <NA>         2023-01-06        2023-01-06       NA
      8        died   2023-01-27         2023-01-01        2023-01-06     25.4
      9   recovered         <NA>         2023-01-06        2023-01-08       NA
      10  recovered         <NA>         2023-01-02        2023-01-08       NA
      11  recovered         <NA>         2023-01-12        2023-01-17     24.5
      12  recovered         <NA>         2023-01-09        2023-01-11       NA
      13  recovered         <NA>         2023-01-12        2023-01-14     24.8
      14  recovered         <NA>         2023-01-10        2023-01-16       NA
      15       died   2023-01-27         2023-01-11        2023-01-13     24.6
      16  recovered         <NA>         2023-01-11        2023-01-15       NA
      17  recovered         <NA>         2023-01-14        2023-01-17     26.5
      18  recovered         <NA>         2023-01-14        2023-01-16       NA
      19  recovered         <NA>         2023-01-12        2023-01-16     24.7
      20  recovered         <NA>         2023-01-13        2023-01-17     24.5
      21       died   2023-02-05         2023-01-22        2023-01-23     21.7
      22  recovered         <NA>         2023-01-20        2023-01-22     21.5
      23  recovered         <NA>         2023-01-19        2023-01-23       NA
      24  recovered         <NA>         2023-01-19        2023-01-22     24.2
      25  recovered         <NA>         2023-01-23        2023-01-24       NA
      26  recovered         <NA>         2023-01-23        2023-01-25       NA
      27  recovered         <NA>         2023-01-23        2023-01-28     23.1
      28       died   2023-02-16         2023-01-22        2023-01-24       NA
      29  recovered         <NA>         2023-01-23        2023-01-28     21.5
      30  recovered         <NA>         2023-01-25        2023-01-26     21.5
      31  recovered         <NA>         2023-01-24        2023-01-26       NA
      32  recovered         <NA>         2023-01-23        2023-01-26     26.4
      33       died   2023-02-14         2023-01-18        2023-01-23       NA
      34  recovered         <NA>         2023-01-19        2023-01-23       NA
      35  recovered         <NA>         2023-01-22        2023-01-26       NA
      36       died   2023-02-09         2023-01-27        2023-01-27     25.2
      37  recovered         <NA>         2023-01-26        2023-01-28       NA
      38  recovered         <NA>         2023-01-25        2023-01-30     25.8
      39       died   2023-02-21         2023-01-27        2023-01-30     21.7
      40  recovered         <NA>         2023-01-27        2023-01-31     23.7
      41  recovered         <NA>         2023-01-30        2023-01-31       NA
      42       died   2023-02-15         2023-02-01        2023-02-04     24.8
      43  recovered         <NA>         2023-01-28        2023-02-02       NA
      44  recovered         <NA>         2023-01-27        2023-02-02       NA
      45  recovered         <NA>         2023-02-03        2023-02-04       NA
      46  recovered         <NA>         2023-02-01        2023-02-03     23.6
      47  recovered         <NA>         2023-01-31        2023-02-01     25.3
      48  recovered         <NA>         2023-01-30        2023-02-02       NA
      49  recovered         <NA>         2023-01-31        2023-01-31       NA
      50  recovered         <NA>         2023-01-30        2023-02-04     23.9
      51       died   2023-02-14         2023-02-04        2023-02-06     27.8
      52       died   2023-02-13         2023-02-03        2023-02-05       NA
      53  recovered         <NA>         2023-01-30        2023-02-04       NA
      54       died   2023-02-28         2023-02-05        2023-02-08       NA
      55  recovered         <NA>         2023-02-06        2023-02-08     26.1
      56  recovered         <NA>         2023-02-10        2023-02-11       NA
      57  recovered         <NA>         2023-02-14        2023-02-19       NA
      58  recovered         <NA>         2023-02-13        2023-02-16       NA
      59  recovered         <NA>         2023-02-10        2023-02-13       NA
      60  recovered         <NA>         2023-02-16        2023-02-18     24.3
      61  recovered         <NA>         2023-03-02        2023-03-02     25.9
      62       died   2023-03-25         2023-02-26        2023-03-03       NA
      63  recovered         <NA>         2023-02-24        2023-02-26     24.2
      64  recovered         <NA>         2023-02-17        2023-02-23       NA
      65  recovered         <NA>         2023-03-06        2023-03-07     27.1
      66  recovered         <NA>         2023-03-03        2023-03-04     27.1
      67  recovered         <NA>         2023-03-07        2023-03-09     24.3
      68  recovered         <NA>         2023-03-06        2023-03-11       NA
      69       died   2023-03-22         2023-03-07        2023-03-11     24.5
      70  recovered         <NA>         2023-03-18        2023-03-23       NA
      71  recovered         <NA>         2023-03-20        2023-03-20       NA
      72  recovered         <NA>         2023-03-07        2023-03-12       NA
      73  recovered         <NA>         2023-03-10        2023-03-14       NA
      74  recovered         <NA>         2023-03-06        2023-03-11       NA
      75  recovered         <NA>         2023-03-10        2023-03-11     30.3
      76  recovered         <NA>         2023-03-16        2023-03-21     25.2
      77  recovered         <NA>         2023-03-16        2023-03-19       NA
      78  recovered         <NA>         2023-03-12        2023-03-19       NA
      79  recovered         <NA>         2023-03-13        2023-03-14     23.0
      80  recovered         <NA>         2023-03-12        2023-03-14     25.7
      81  recovered         <NA>         2023-03-12        2023-03-17       NA
      82  recovered         <NA>         2023-03-12        2023-03-17     25.1
      83  recovered         <NA>         2023-03-15        2023-03-18     20.0
      84  recovered         <NA>         2023-03-21        2023-03-25     25.7
      85  recovered         <NA>         2023-03-16        2023-03-20     27.2
      86  recovered         <NA>         2023-03-18        2023-03-21     24.2
      87       died   2023-04-03         2023-03-17        2023-03-18       NA
      88  recovered         <NA>         2023-03-20        2023-03-21     27.5
      89  recovered         <NA>         2023-03-26        2023-03-27     25.3
      90  recovered         <NA>         2023-03-24        2023-03-24       NA
      91  recovered         <NA>         2023-03-22        2023-03-24     27.2
      92  recovered         <NA>         2023-03-19        2023-03-24       NA
      93  recovered         <NA>         2023-03-20        2023-03-20       NA
      94       died   2023-04-12         2023-03-29        2023-04-01     24.9
      95       died   2023-04-20         2023-03-27        2023-03-28     25.2
      96  recovered         <NA>         2023-03-23        2023-03-28       NA
      97  recovered         <NA>         2023-03-25        2023-03-29       NA
      98  recovered         <NA>         2023-03-26        2023-03-28       NA
      99  recovered         <NA>         2023-04-02        2023-04-07     24.0
      100 recovered         <NA>         2023-04-03        2023-04-06     26.8
      101 recovered         <NA>         2023-03-31        2023-04-03     24.2
      102 recovered         <NA>         2023-03-28        2023-04-01     29.1
      103 recovered         <NA>         2023-03-24        2023-03-29     24.1
      104 recovered         <NA>         2023-03-28        2023-04-01     23.7
      105 recovered         <NA>         2023-03-30        2023-04-06     23.4
      106 recovered         <NA>         2023-04-03        2023-04-05       NA
      107      died   2023-04-14         2023-04-07        2023-04-08       NA
      108      died   2023-04-28         2023-04-08        2023-04-08       NA
      109 recovered         <NA>         2023-04-06        2023-04-06     25.2
      110 recovered         <NA>         2023-04-01        2023-04-05     26.7
      111      died   2023-04-19         2023-04-03        2023-04-06       NA
      112 recovered         <NA>         2023-04-01        2023-04-04       NA
      113 recovered         <NA>         2023-04-11        2023-04-16     27.8
      114 recovered         <NA>         2023-04-09        2023-04-12       NA
      115 recovered         <NA>         2023-04-05        2023-04-06     26.4
      116 recovered         <NA>         2023-04-01        2023-04-03     20.5
      117      died   2023-04-18         2023-04-01        2023-04-09     26.4
      118 recovered         <NA>         2023-04-04        2023-04-08     28.1
      119 recovered         <NA>         2023-04-12        2023-04-13       NA
      120 recovered         <NA>         2023-04-14        2023-04-17     25.6
      121 recovered         <NA>         2023-04-03        2023-04-05     18.6
      122 recovered         <NA>         2023-04-09        2023-04-12     25.9
      123 recovered         <NA>         2023-04-10        2023-04-16       NA
      124 recovered         <NA>         2023-04-06        2023-04-11     23.8
      125 recovered         <NA>         2023-04-07        2023-04-12     24.9
      126 recovered         <NA>         2023-04-04        2023-04-11     23.2
      127 recovered         <NA>         2023-04-10        2023-04-11       NA
      128      died   2023-04-25         2023-04-13        2023-04-16     24.0
      129 recovered         <NA>         2023-04-14        2023-04-18     25.3
      130 recovered         <NA>         2023-04-13        2023-04-14       NA
      131 recovered         <NA>         2023-04-15        2023-04-18     22.3
      132      died   2023-05-02         2023-04-14        2023-04-14       NA
      133 recovered         <NA>         2023-04-12        2023-04-21       NA
      134 recovered         <NA>         2023-04-16        2023-04-21       NA
      135 recovered         <NA>         2023-04-19        2023-04-25       NA
      136      died   2023-05-05         2023-04-23        2023-04-25       NA
      137 recovered         <NA>         2023-04-11        2023-04-15     25.3
      138 recovered         <NA>         2023-04-23        2023-04-26     23.9
      139 recovered         <NA>         2023-04-21        2023-04-22     25.8
      140 recovered         <NA>         2023-04-18        2023-04-22     22.5
      141 recovered         <NA>         2023-04-21        2023-04-25     27.2
      142 recovered         <NA>         2023-05-05        2023-05-06     25.1
      143 recovered         <NA>         2023-04-28        2023-04-29       NA
      144 recovered         <NA>         2023-04-19        2023-04-21     18.6
      145 recovered         <NA>         2023-04-21        2023-04-23     23.1
      146 recovered         <NA>         2023-05-03        2023-05-05     24.6
      147 recovered         <NA>         2023-05-06        2023-05-08     25.7
      148 recovered         <NA>         2023-05-01        2023-05-03       NA
      149 recovered         <NA>         2023-04-25        2023-04-27       NA
      150 recovered         <NA>         2023-04-20        2023-04-25       NA
      151 recovered         <NA>         2023-05-08        2023-05-10       NA
      152 recovered         <NA>         2023-04-28        2023-05-04       NA
      153 recovered         <NA>         2023-04-19        2023-04-25     26.2
      154 recovered         <NA>         2023-04-25        2023-04-26       NA
      155 recovered         <NA>         2023-04-25        2023-04-29       NA
      156 recovered         <NA>         2023-05-05        2023-05-08     28.1
      157 recovered         <NA>         2023-04-22        2023-04-28     23.7
      158      died   2023-05-22         2023-05-01        2023-05-03     26.7

# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
         id        case_name case_type sex age date_onset date_admission   outcome
      1   1     Kevin Pullen suspected   m  35 2023-01-01           <NA> recovered
      2   2 Maazin el-Othman confirmed   m  43 2023-01-01     2023-01-07 recovered
      3   3 Faisal el-Vaziri confirmed   m   1 2023-01-01           <NA> recovered
      4   5     Jorge Marten suspected   m  78 2023-01-01     2023-01-03      died
      5   6   Katelyn Catlin confirmed   f  22 2023-01-01     2023-01-28      died
      6   8     Lynsey Duron confirmed   f  28 2023-01-01           <NA> recovered
      7  11   Collin Stimack confirmed   m  46 2023-01-01           <NA> recovered
      8  12     Jacy Cousins confirmed   f  67 2023-01-01           <NA> recovered
      9  13  Nicholas Orgill confirmed   m  86 2023-01-01           <NA> recovered
      10 18   Maria Eberhart  probable   f  60 2023-01-02           <NA> recovered
      11 20       Kevin Waid suspected   m  49 2023-01-02           <NA> recovered
      12 22      Erin Payson confirmed   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05     25.3
      3          <NA>         2022-12-30        2023-01-02     25.8
      4    2023-01-21         2022-12-29        2023-01-02       NA
      5    2023-02-09         2023-01-01        2023-01-03     24.9
      6          <NA>         2023-01-03        2023-01-04     24.5
      7          <NA>         2023-01-04        2023-01-05     26.4
      8          <NA>         2023-01-01        2023-01-04     27.3
      9          <NA>         2022-12-31        2023-01-03     20.2
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     26.1

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
      2          <NA>         2022-12-30        2023-01-05     25.3
      3          <NA>         2022-12-30        2023-01-02     25.8
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03     24.9
      6          <NA>         2023-01-03        2023-01-04     24.5
      7          <NA>         2023-01-04        2023-01-05     26.4
      8          <NA>         2023-01-01        2023-01-04     27.3
      9          <NA>         2022-12-31        2023-01-03     20.2
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     26.1

# sim_linelist works as expected with anonymous

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
         id  case_name case_type sex age date_onset date_admission   outcome
      1   1 OvsRrRMCAJ confirmed   m  35 2023-01-01           <NA> recovered
      2   2 FEY3qKY39Z  probable   m  43 2023-01-01     2023-01-07 recovered
      3   3 yiuuoY8Kxn confirmed   m   1 2023-01-01           <NA> recovered
      4   5 Huaqm1SzNb  probable   m  78 2023-01-01     2023-01-03      died
      5   6 O5h4yEtT6t suspected   f  22 2023-01-01     2023-01-28      died
      6   8 8e6yKFNmyd  probable   f  28 2023-01-01           <NA> recovered
      7  11 Lkhw9tYeb1 confirmed   m  46 2023-01-01           <NA> recovered
      8  12 elczXnmE3U suspected   f  67 2023-01-01           <NA> recovered
      9  13 4HDzSVgVAW confirmed   m  86 2023-01-01           <NA> recovered
      10 18 To9HLY9VZd  probable   f  60 2023-01-02           <NA> recovered
      11 20 czwJ3WvUcV confirmed   m  49 2023-01-02           <NA> recovered
      12 22 vu5Ak6RZkf confirmed   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>     26.2
      2          <NA>         2022-12-30        2023-01-05       NA
      3          <NA>         2022-12-30        2023-01-02     26.4
      4    2023-01-21         2022-12-29        2023-01-02       NA
      5    2023-02-09         2023-01-01        2023-01-03       NA
      6          <NA>         2023-01-03        2023-01-04       NA
      7          <NA>         2023-01-04        2023-01-05     26.1
      8          <NA>         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03     23.9
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04     22.3
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
      2          <NA>         2022-12-30        2023-01-05     23.0
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03     28.2
      6          <NA>         2023-01-03        2023-01-04     25.0
      7          <NA>         2023-01-04        2023-01-05     19.2
      8          <NA>         2023-01-01        2023-01-04       NA
      9          <NA>         2022-12-31        2023-01-03     22.8
      10   2023-01-21         2022-12-30        2023-01-03     28.1
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
      1          <NA>               <NA>              <NA>     26.0
      2          <NA>         2022-12-30        2023-01-05     25.8
      3          <NA>         2022-12-30        2023-01-02       NA
      4          <NA>         2022-12-29        2023-01-02     28.7
      5          <NA>         2023-01-01        2023-01-03     27.1
      6          <NA>         2023-01-03        2023-01-04     25.2
      7          <NA>         2023-01-04        2023-01-05     24.8
      8          <NA>         2023-01-01        2023-01-04     26.2
      9          <NA>         2022-12-31        2023-01-03       NA
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04     23.2
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
      1          <NA>               <NA>              <NA>     24.3
      2    2023-01-10         2022-12-30        2023-01-01       NA
      3          <NA>         2022-12-31        2023-01-02       NA
      4          <NA>         2022-12-30        2023-01-02       NA
      5    2023-01-16         2022-12-31        2023-01-01       NA
      6          <NA>         2022-12-31        2023-01-01       NA
      7          <NA>         2022-12-30        2023-01-02       NA
      8          <NA>         2022-12-30        2023-01-01     23.1
      9          <NA>         2022-12-29        2023-01-01     24.5
      10         <NA>         2022-12-30        2023-01-01     25.8
      11         <NA>         2022-12-30        2023-01-01     23.3
      12         <NA>         2022-12-30        2023-01-02     30.3

# sim_linelist works as expected with modified config parameters

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution_params = c(lambda = 5)))
    Output
         id        case_name case_type sex age date_onset date_admission   outcome
      1   1     Kevin Pullen suspected   m  35 2023-01-01           <NA> recovered
      2   2 Maazin el-Othman confirmed   m  43 2023-01-01     2023-01-07 recovered
      3   3 Faisal el-Vaziri confirmed   m   1 2023-01-01           <NA> recovered
      4   5     Jorge Marten suspected   m  78 2023-01-01     2023-01-03      died
      5   6   Katelyn Catlin confirmed   f  22 2023-01-01     2023-01-28      died
      6   8     Lynsey Duron confirmed   f  28 2023-01-01           <NA> recovered
      7  11   Collin Stimack confirmed   m  46 2023-01-01           <NA> recovered
      8  12     Jacy Cousins confirmed   f  67 2023-01-01           <NA> recovered
      9  13  Nicholas Orgill confirmed   m  86 2023-01-01           <NA> recovered
      10 18   Maria Eberhart  probable   f  60 2023-01-02           <NA> recovered
      11 20       Kevin Waid suspected   m  49 2023-01-02           <NA> recovered
      12 22      Erin Payson confirmed   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2023-01-01        2023-01-07     25.3
      3          <NA>         2022-12-31        2023-01-03     25.8
      4    2023-01-21         2022-12-31        2023-01-04       NA
      5    2023-02-09         2023-01-02        2023-01-04     24.9
      6          <NA>         2023-01-06        2023-01-07     24.5
      7          <NA>         2023-01-07        2023-01-08     26.4
      8          <NA>         2023-01-03        2023-01-06     27.3
      9          <NA>         2023-01-02        2023-01-05     20.2
      10         <NA>         2023-01-01        2023-01-05       NA
      11         <NA>         2023-01-04        2023-01-07       NA
      12         <NA>         2023-01-03        2023-01-05     26.1

# sim_linelist works as expected with time-varying cfr

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(time_varying_death_risk = function(risk, time) risk *
          exp(-time)))
    Output
         id        case_name case_type sex age date_onset date_admission   outcome
      1   1     Kevin Pullen suspected   m  35 2023-01-01           <NA> recovered
      2   2 Maazin el-Othman confirmed   m  43 2023-01-01     2023-01-07 recovered
      3   3 Faisal el-Vaziri confirmed   m   1 2023-01-01           <NA> recovered
      4   5     Jorge Marten suspected   m  78 2023-01-01     2023-01-03      died
      5   6   Katelyn Catlin confirmed   f  22 2023-01-01     2023-01-28      died
      6   8     Lynsey Duron confirmed   f  28 2023-01-01           <NA> recovered
      7  11   Collin Stimack confirmed   m  46 2023-01-01           <NA> recovered
      8  12     Jacy Cousins confirmed   f  67 2023-01-01           <NA> recovered
      9  13  Nicholas Orgill confirmed   m  86 2023-01-01           <NA> recovered
      10 18   Maria Eberhart  probable   f  60 2023-01-02           <NA> recovered
      11 20       Kevin Waid suspected   m  49 2023-01-02           <NA> recovered
      12 22      Erin Payson confirmed   f   7 2023-01-02           <NA> recovered
         date_outcome date_first_contact date_last_contact ct_value
      1          <NA>               <NA>              <NA>       NA
      2          <NA>         2022-12-30        2023-01-05     25.3
      3          <NA>         2022-12-30        2023-01-02     25.8
      4    2023-01-21         2022-12-29        2023-01-02       NA
      5    2023-02-09         2023-01-01        2023-01-03     24.9
      6          <NA>         2023-01-03        2023-01-04     24.5
      7          <NA>         2023-01-04        2023-01-05     26.4
      8          <NA>         2023-01-01        2023-01-04     27.3
      9          <NA>         2022-12-31        2023-01-03     20.2
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     26.1

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
      2          <NA>         2022-12-30        2023-01-05     25.3
      3          <NA>         2022-12-30        2023-01-02     25.8
      4          <NA>         2022-12-29        2023-01-02       NA
      5          <NA>         2023-01-01        2023-01-03     24.9
      6          <NA>         2023-01-03        2023-01-04     24.5
      7          <NA>         2023-01-04        2023-01-05     26.4
      8          <NA>         2023-01-01        2023-01-04     27.3
      9          <NA>         2022-12-31        2023-01-03     20.2
      10         <NA>         2022-12-30        2023-01-03       NA
      11         <NA>         2023-01-01        2023-01-04       NA
      12         <NA>         2023-01-01        2023-01-03     26.1

