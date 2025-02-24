# sim_outbreak works as expected with defaults

    Code
      sim_outbreak()
    Output
      $linelist
           id                case_name case_type sex age date_onset date_reporting
      1     1              James Manis suspected   m  59 2023-01-01     2023-01-01
      2     2            Anisa Hatcher confirmed   f  90 2023-01-01     2023-01-01
      3     3              Morgan Bohn confirmed   f   4 2023-01-02     2023-01-02
      4     5             David Welter confirmed   m  29 2023-01-04     2023-01-04
      5     6            Sade Phillips suspected   f  14 2023-01-05     2023-01-05
      6     7          Sameeha al-Zaki  probable   f  85 2023-01-06     2023-01-06
      7    10    Cornelius Stadelbauer  probable   m  25 2023-01-13     2023-01-13
      8    11          Hafsa al-Arshad confirmed   f  34 2023-01-11     2023-01-11
      9    12                Maiya Kim suspected   f  89 2023-01-13     2023-01-13
      10   14           Desmond Ibarra suspected   m  63 2023-01-11     2023-01-11
      11   18  Carlo Ceazar Strausburg confirmed   m  74 2023-01-14     2023-01-14
      12   19    Jennifer Vathanavarin  probable   f  34 2023-01-12     2023-01-12
      13   22              Deisha Wall confirmed   f  29 2023-01-12     2023-01-12
      14   24          Qamraaa el-Ally  probable   f  46 2023-01-13     2023-01-13
      15   27          Jaylynn Baldwin confirmed   f  24 2023-01-14     2023-01-14
      16   29       Nafeesa al-Massoud suspected   f  41 2023-01-21     2023-01-21
      17   30          Dalicia Wilkins confirmed   f  72 2023-01-19     2023-01-19
      18   31      Sulaimaan al-Farooq suspected   m   6 2023-01-20     2023-01-20
      19   33           James Colligan confirmed   m  61 2023-01-14     2023-01-14
      20   34         Crystal Sandoval confirmed   f  44 2023-01-14     2023-01-14
      21   35        Chandel Aviado II confirmed   f  71 2023-01-27     2023-01-27
      22   38          Utkarsh Hammond confirmed   m  69 2023-01-23     2023-01-23
      23   39           Orville Mosher  probable   m  61 2023-01-23     2023-01-23
      24   41        Nawwaara al-Rahim confirmed   f  64 2023-01-24     2023-01-24
      25   44           Shuaib al-Kaba suspected   m  61 2023-01-22     2023-01-22
      26   45         Lauren Caramillo  probable   f  66 2023-01-22     2023-01-22
      27   47          Jamaal el-Sarah confirmed   m  81 2023-01-28     2023-01-28
      28   50          Jameel Scurlock  probable   m  53 2023-01-28     2023-01-28
      29   51          Khongmong Ahmad confirmed   m  45 2023-01-29     2023-01-29
      30   53           Nichole Gilroy confirmed   f  42 2023-02-02     2023-02-02
      31   54     Collin Rangel Mendez  probable   m  78 2023-02-03     2023-02-03
      32   55          Ronnie Maryland confirmed   m  35 2023-01-24     2023-01-24
      33   56              Itzel Jiron  probable   f  54 2023-01-26     2023-01-26
      34   58         Brandon Trammell  probable   m  68 2023-01-25     2023-01-25
      35   59              Shane Huang  probable   m   3 2023-01-23     2023-01-23
      36   60       Mu,Aawiya al-Amiri confirmed   m  44 2023-01-29     2023-01-29
      37   63 Joshua Valencia Anchondo  probable   m  62 2023-01-31     2023-01-31
      38   64            Cairra Curtis confirmed   m  35 2023-01-29     2023-01-29
      39   65        Nadheera el-Pasha confirmed   f  90 2023-02-03     2023-02-03
      40   66        Sapphire Freeland confirmed   f  25 2023-02-01     2023-02-01
      41   71              Medhavi Kim suspected   f  46 2023-01-29     2023-01-29
      42   73        Madelyn Mcfarland confirmed   f   8 2023-02-01     2023-02-01
      43   77                Kevin Cha  probable   m  63 2023-01-30     2023-01-30
      44   78         Laraena Sturgeon  probable   f  54 2023-01-29     2023-01-29
      45   80            Taylor Nguyen  probable   f  67 2023-02-03     2023-02-03
      46   85         Markese Marchman confirmed   m  37 2023-02-02     2023-02-02
      47   88         Christian Molina confirmed   m  73 2023-01-30     2023-01-30
      48   89            Mark Espinosa  probable   m  13 2023-02-02     2023-02-02
      49   90          Cassandra Lange  probable   f  72 2023-02-01     2023-02-01
      50   93         Alexander Naylor confirmed   m  61 2023-02-04     2023-02-04
      51   97                Micah San confirmed   m  22 2023-02-05     2023-02-05
      52   98         Carmelita Huizar suspected   f  29 2023-02-04     2023-02-04
      53  101        Daniel Goodfellow  probable   m  17 2023-02-07     2023-02-07
      54  108           Samuel Johnson  probable   m  71 2023-02-14     2023-02-14
      55  111           Bertha Montoya confirmed   f  90 2023-02-09     2023-02-09
      56  113           Taaj al-Rahimi  probable   m  23 2023-02-12     2023-02-12
      57  114             Lafaith Bean  probable   f  35 2023-02-16     2023-02-16
      58  116              Joshua Khan  probable   m  62 2023-02-24     2023-02-24
      59  119             Billye Cohen  probable   f  57 2023-02-23     2023-02-23
      60  120         Madison Mcdonald confirmed   f  44 2023-02-18     2023-02-18
      61  122           Wen Kang Zheng confirmed   m  57 2023-03-02     2023-03-02
      62  123            Sidqi el-Reza  probable   m  63 2023-03-08     2023-03-08
      63  125           Rebekah Norman confirmed   f  46 2023-02-28     2023-02-28
      64  126              Ryan Fukuda  probable   m  66 2023-02-26     2023-02-26
      65  130         Jumail al-Salame confirmed   m  68 2023-03-07     2023-03-07
      66  131            Jez-Mas Woods confirmed   m  12 2023-03-09     2023-03-09
      67  133          Mikayla Hopkins confirmed   f  51 2023-03-18     2023-03-18
      68  138             Rosemary Lor suspected   f   2 2023-03-10     2023-03-10
      69  139       Mansoor al-Hussein confirmed   m  53 2023-03-09     2023-03-09
      70  142           Nawfa el-Ahmad suspected   f  76 2023-03-23     2023-03-23
      71  143              Raul Millan suspected   m  82 2023-03-21     2023-03-21
      72  145         Najlaa el-Yassin suspected   f  25 2023-03-15     2023-03-15
      73  146         Sakeena el-Anwar  probable   f  76 2023-03-13     2023-03-13
      74  147             Rida al-Ozer  probable   m  14 2023-03-13     2023-03-13
      75  150          Tanya Tollivoro confirmed   f  76 2023-03-11     2023-03-11
      76  153           Shawn Videtzky confirmed   m  78 2023-03-15     2023-03-15
      77  154         Kailey Scharnell  probable   f  75 2023-03-24     2023-03-24
      78  155            Orilea Medina  probable   f  76 2023-03-24     2023-03-24
      79  157            Unique Tinoco confirmed   f  80 2023-03-18     2023-03-18
      80  158         Raadiya al-Abdoo confirmed   f  41 2023-03-18     2023-03-18
      81  159              Janie Mohar suspected   f  78 2023-03-19     2023-03-19
      82  163        Keeman Stockinger confirmed   m  28 2023-03-15     2023-03-15
      83  164         Frankie Griffith confirmed   f   2 2023-03-21     2023-03-21
      84  166           Sharon Harding confirmed   f  82 2023-03-26     2023-03-26
      85  171          Alvaro Vikingur confirmed   m   5 2023-03-22     2023-03-22
      86  172       Nadheera al-Jafari confirmed   f   1 2023-03-20     2023-03-20
      87  173     Lane Martinez-Deleon suspected   m  44 2023-03-19     2023-03-19
      88  174                 Ka Ahsan confirmed   m  76 2023-03-16     2023-03-16
      89  175          Munsif el-Salem confirmed   m   3 2023-03-29     2023-03-29
      90  176  Abdur Rasheed al-Akbari suspected   m  15 2023-03-25     2023-03-25
      91  177   Abdul Kareem al-Firman confirmed   m  19 2023-03-26     2023-03-26
      92  178            Yesenia Diego  probable   f  76 2023-03-25     2023-03-25
      93  182   Abdul Ghafoor el-Aslam  probable   m  90 2023-03-27     2023-03-27
      94  186           Raul Rodriguez confirmed   m  64 2023-04-03     2023-04-03
      95  189             T'Koia Myers confirmed   f  35 2023-03-29     2023-03-29
      96  195             Ashley Coles suspected   f  84 2023-03-27     2023-03-27
      97  196            Mason Mcgrier suspected   m  18 2023-03-30     2023-03-30
      98  197                Cam Tu Vu  probable   f  79 2023-03-28     2023-03-28
      99  199          Bao-Tran Suetos confirmed   f  49 2023-04-07     2023-04-07
      100 200         Sandra Ouellette confirmed   f  56 2023-04-05     2023-04-05
      101 201           Gina Dalrymple confirmed   f  76 2023-04-07     2023-04-07
      102 202          Razeen el-Karam confirmed   m  41 2023-04-03     2023-04-03
      103 205         Ashley Armstrong confirmed   f  29 2023-04-01     2023-04-01
      104 209      Damian Murillo-Soto confirmed   m  39 2023-04-05     2023-04-05
      105 210           Yahya al-Saidi confirmed   m  32 2023-04-01     2023-04-01
      106 211               Rusty Asad suspected   m   9 2023-04-06     2023-04-06
      107 213         Manaara el-Bilal suspected   f  39 2023-04-11     2023-04-11
      108 214              Fisayo Rice  probable   m  12 2023-04-17     2023-04-17
      109 219            Jacob Barrett confirmed   m  52 2023-04-10     2023-04-10
      110 221          Jordan Redhorse confirmed   f  22 2023-04-02     2023-04-02
      111 224         Laaiqa al-Farrah suspected   f  68 2023-04-08     2023-04-08
      112 226          Ameen al-Semaan suspected   m  57 2023-04-06     2023-04-06
      113 229         Azmi el-Abdallah confirmed   m   8 2023-04-12     2023-04-12
      114 230           Khyleah Dotson suspected   f  28 2023-04-12     2023-04-12
      115 232            Khampane Behr confirmed   m   2 2023-04-02     2023-04-02
      116 233        Jose Delgado Diaz confirmed   m  84 2023-04-09     2023-04-09
      117 234            Eliora Braden confirmed   f  52 2023-04-09     2023-04-09
      118 235               Kevin Tran confirmed   m  58 2023-04-12     2023-04-12
      119 236         Haakima el-Azizi  probable   f  29 2023-04-10     2023-04-10
      120 238              Amanda Dodd confirmed   f  30 2023-04-14     2023-04-14
      121 240     Alex Zaragoza-Madrid confirmed   m  71 2023-04-15     2023-04-15
      122 243            Marques Cross confirmed   m  43 2023-04-13     2023-04-13
      123 245           Andrew Lefholz suspected   m  40 2023-04-15     2023-04-15
      124 250             Roy Williams confirmed   m  46 2023-04-16     2023-04-16
      125 251              Jason Hoyle confirmed   m  69 2023-04-11     2023-04-11
      126 252       Yeun Jung Hasegawa confirmed   f  69 2023-04-20     2023-04-20
      127 253              Yeeleng Sun suspected   m  38 2023-04-20     2023-04-20
      128 254             Isaac Stuart confirmed   m  28 2023-04-16     2023-04-16
      129 255         Lawrence Jenkins confirmed   m  82 2023-04-16     2023-04-16
      130 258            Jasmine Jones suspected   f  19 2023-04-14     2023-04-14
      131 261                Jose Maez confirmed   m  46 2023-04-26     2023-04-26
      132 262          Bryanna Herrera suspected   f  71 2023-04-13     2023-04-13
      133 264               Lael Vigil suspected   f   4 2023-04-25     2023-04-25
      134 265         Gericko Martinez suspected   m  31 2023-04-25     2023-04-25
      135 267           Asiah Marshall  probable   f  16 2023-04-20     2023-04-20
      136 268             Javon Reeves  probable   m  53 2023-04-21     2023-04-21
      137 277            Zachary Major confirmed   m  14 2023-05-01     2023-05-01
      138 278             Jane Solberg confirmed   f  48 2023-04-28     2023-04-28
      139 279          Razeen al-Shaer confirmed   m  89 2023-04-25     2023-04-25
      140 280            Ismad al-Azad confirmed   m  39 2023-04-26     2023-04-26
      141 282             Marcus Ellis confirmed   m  20 2023-04-21     2023-04-21
      142 284        Firdaus el-Satter confirmed   f   6 2023-05-03     2023-05-03
      143 285  Haley Iron Cloud-Gresko  probable   f  28 2023-05-05     2023-05-05
      144 291        Justin Cunningham confirmed   m  42 2023-05-01     2023-05-01
      145 292               Judy David confirmed   f  71 2023-04-23     2023-04-23
      146 293          Sanaaa el-Farha confirmed   f   9 2023-05-05     2023-05-05
      147 296        Alexandra Medrano confirmed   f  61 2023-05-06     2023-05-06
      148 298          Andrew Kelemeni suspected   m  53 2023-05-02     2023-05-02
      149 301      Alexzandria Holguin  probable   f  76 2023-04-23     2023-04-23
      150 302             Jazmyn Evans  probable   f  69 2023-04-26     2023-04-26
      151 304             Ty Gutierrez  probable   m  50 2023-05-07     2023-05-07
      152 307        Jennifer Valverde suspected   f   7 2023-05-09     2023-05-09
      153 310         Naseera el-Saidi confirmed   f  45 2023-04-24     2023-04-24
      154 311              Luis Taylor  probable   m  83 2023-04-25     2023-04-25
      155 313              Kylie Berry suspected   f  41 2023-04-27     2023-04-27
      156 316            Laneece Ahuna confirmed   f  88 2023-05-10     2023-05-10
      157 320     John Gonzalez Vargas confirmed   m  79 2023-05-01     2023-05-01
      158 326            Stephon White confirmed   m  82 2023-05-08     2023-05-08
          date_admission   outcome date_outcome date_first_contact date_last_contact
      1       2023-01-09      died   2023-01-13               <NA>              <NA>
      2             <NA> recovered         <NA>         2022-12-31        2023-01-05
      3             <NA> recovered         <NA>         2022-12-30        2023-01-01
      4             <NA> recovered         <NA>         2023-01-05        2023-01-05
      5       2023-01-09      died   2023-01-23         2023-01-07        2023-01-08
      6       2023-01-08 recovered         <NA>         2023-01-03        2023-01-06
      7             <NA> recovered         <NA>         2023-01-06        2023-01-06
      8       2023-01-24      died   2023-01-27         2023-01-01        2023-01-06
      9             <NA> recovered         <NA>         2023-01-06        2023-01-08
      10            <NA> recovered         <NA>         2023-01-02        2023-01-08
      11            <NA> recovered         <NA>         2023-01-12        2023-01-17
      12            <NA> recovered         <NA>         2023-01-09        2023-01-11
      13            <NA> recovered         <NA>         2023-01-12        2023-01-14
      14            <NA> recovered         <NA>         2023-01-10        2023-01-16
      15      2023-01-19      died   2023-01-27         2023-01-11        2023-01-13
      16            <NA> recovered         <NA>         2023-01-11        2023-01-15
      17            <NA> recovered         <NA>         2023-01-14        2023-01-17
      18            <NA> recovered         <NA>         2023-01-14        2023-01-16
      19            <NA> recovered         <NA>         2023-01-12        2023-01-16
      20      2023-02-10 recovered         <NA>         2023-01-13        2023-01-17
      21            <NA>      died   2023-02-05         2023-01-22        2023-01-23
      22            <NA> recovered         <NA>         2023-01-20        2023-01-22
      23            <NA> recovered         <NA>         2023-01-19        2023-01-23
      24            <NA> recovered         <NA>         2023-01-19        2023-01-22
      25            <NA> recovered         <NA>         2023-01-23        2023-01-24
      26            <NA> recovered         <NA>         2023-01-23        2023-01-25
      27            <NA> recovered         <NA>         2023-01-23        2023-01-28
      28      2023-01-30      died   2023-02-16         2023-01-22        2023-01-24
      29            <NA> recovered         <NA>         2023-01-23        2023-01-28
      30      2023-02-11 recovered         <NA>         2023-01-25        2023-01-26
      31            <NA> recovered         <NA>         2023-01-24        2023-01-26
      32            <NA> recovered         <NA>         2023-01-23        2023-01-26
      33            <NA>      died   2023-02-14         2023-01-18        2023-01-23
      34      2023-01-29 recovered         <NA>         2023-01-19        2023-01-23
      35            <NA> recovered         <NA>         2023-01-22        2023-01-26
      36      2023-02-02      died   2023-02-09         2023-01-27        2023-01-27
      37            <NA> recovered         <NA>         2023-01-26        2023-01-28
      38            <NA> recovered         <NA>         2023-01-25        2023-01-30
      39      2023-02-08      died   2023-02-21         2023-01-27        2023-01-30
      40      2023-02-05 recovered         <NA>         2023-01-27        2023-01-31
      41            <NA> recovered         <NA>         2023-01-30        2023-01-31
      42            <NA>      died   2023-02-15         2023-02-01        2023-02-04
      43            <NA> recovered         <NA>         2023-01-28        2023-02-02
      44            <NA> recovered         <NA>         2023-01-27        2023-02-02
      45            <NA> recovered         <NA>         2023-02-03        2023-02-04
      46            <NA> recovered         <NA>         2023-02-01        2023-02-03
      47            <NA> recovered         <NA>         2023-01-31        2023-02-01
      48            <NA> recovered         <NA>         2023-01-30        2023-02-02
      49            <NA> recovered         <NA>         2023-01-31        2023-01-31
      50            <NA> recovered         <NA>         2023-01-30        2023-02-04
      51            <NA>      died   2023-02-14         2023-02-04        2023-02-06
      52            <NA>      died   2023-02-13         2023-02-03        2023-02-05
      53            <NA> recovered         <NA>         2023-01-30        2023-02-04
      54            <NA>      died   2023-02-28         2023-02-05        2023-02-08
      55            <NA> recovered         <NA>         2023-02-06        2023-02-08
      56            <NA> recovered         <NA>         2023-02-10        2023-02-11
      57            <NA> recovered         <NA>         2023-02-14        2023-02-19
      58            <NA> recovered         <NA>         2023-02-13        2023-02-16
      59            <NA> recovered         <NA>         2023-02-10        2023-02-13
      60            <NA> recovered         <NA>         2023-02-16        2023-02-18
      61            <NA> recovered         <NA>         2023-03-02        2023-03-02
      62      2023-03-11      died   2023-03-25         2023-02-26        2023-03-03
      63            <NA> recovered         <NA>         2023-02-24        2023-02-26
      64            <NA> recovered         <NA>         2023-02-17        2023-02-23
      65            <NA> recovered         <NA>         2023-03-06        2023-03-07
      66            <NA> recovered         <NA>         2023-03-03        2023-03-04
      67            <NA> recovered         <NA>         2023-03-07        2023-03-09
      68            <NA> recovered         <NA>         2023-03-06        2023-03-11
      69      2023-03-16      died   2023-03-22         2023-03-07        2023-03-11
      70            <NA> recovered         <NA>         2023-03-18        2023-03-23
      71            <NA> recovered         <NA>         2023-03-20        2023-03-20
      72            <NA> recovered         <NA>         2023-03-07        2023-03-12
      73            <NA> recovered         <NA>         2023-03-10        2023-03-14
      74      2023-03-17 recovered         <NA>         2023-03-06        2023-03-11
      75            <NA> recovered         <NA>         2023-03-10        2023-03-11
      76            <NA> recovered         <NA>         2023-03-16        2023-03-21
      77      2023-03-31 recovered         <NA>         2023-03-16        2023-03-19
      78            <NA> recovered         <NA>         2023-03-12        2023-03-19
      79            <NA> recovered         <NA>         2023-03-13        2023-03-14
      80            <NA> recovered         <NA>         2023-03-12        2023-03-14
      81            <NA> recovered         <NA>         2023-03-12        2023-03-17
      82            <NA> recovered         <NA>         2023-03-12        2023-03-17
      83            <NA> recovered         <NA>         2023-03-15        2023-03-18
      84            <NA> recovered         <NA>         2023-03-21        2023-03-25
      85            <NA> recovered         <NA>         2023-03-16        2023-03-20
      86            <NA> recovered         <NA>         2023-03-18        2023-03-21
      87      2023-03-22      died   2023-04-03         2023-03-17        2023-03-18
      88            <NA> recovered         <NA>         2023-03-20        2023-03-21
      89            <NA> recovered         <NA>         2023-03-26        2023-03-27
      90            <NA> recovered         <NA>         2023-03-24        2023-03-24
      91            <NA> recovered         <NA>         2023-03-22        2023-03-24
      92            <NA> recovered         <NA>         2023-03-19        2023-03-24
      93            <NA> recovered         <NA>         2023-03-20        2023-03-20
      94            <NA>      died   2023-04-12         2023-03-29        2023-04-01
      95            <NA>      died   2023-04-20         2023-03-27        2023-03-28
      96            <NA> recovered         <NA>         2023-03-23        2023-03-28
      97      2023-04-03 recovered         <NA>         2023-03-25        2023-03-29
      98      2023-04-03 recovered         <NA>         2023-03-26        2023-03-28
      99            <NA> recovered         <NA>         2023-04-02        2023-04-07
      100           <NA> recovered         <NA>         2023-04-03        2023-04-06
      101     2023-04-12 recovered         <NA>         2023-03-31        2023-04-03
      102           <NA> recovered         <NA>         2023-03-28        2023-04-01
      103           <NA> recovered         <NA>         2023-03-24        2023-03-29
      104     2023-04-12 recovered         <NA>         2023-03-28        2023-04-01
      105           <NA> recovered         <NA>         2023-03-30        2023-04-06
      106           <NA> recovered         <NA>         2023-04-03        2023-04-05
      107     2023-04-13      died   2023-04-14         2023-04-07        2023-04-08
      108     2023-04-20      died   2023-04-28         2023-04-08        2023-04-08
      109           <NA> recovered         <NA>         2023-04-06        2023-04-06
      110           <NA> recovered         <NA>         2023-04-01        2023-04-05
      111           <NA>      died   2023-04-19         2023-04-03        2023-04-06
      112           <NA> recovered         <NA>         2023-04-01        2023-04-04
      113           <NA> recovered         <NA>         2023-04-11        2023-04-16
      114           <NA> recovered         <NA>         2023-04-09        2023-04-12
      115           <NA> recovered         <NA>         2023-04-05        2023-04-06
      116           <NA> recovered         <NA>         2023-04-01        2023-04-03
      117     2023-04-13      died   2023-04-18         2023-04-01        2023-04-09
      118           <NA> recovered         <NA>         2023-04-04        2023-04-08
      119           <NA> recovered         <NA>         2023-04-12        2023-04-13
      120           <NA> recovered         <NA>         2023-04-14        2023-04-17
      121           <NA> recovered         <NA>         2023-04-03        2023-04-05
      122           <NA> recovered         <NA>         2023-04-09        2023-04-12
      123           <NA> recovered         <NA>         2023-04-10        2023-04-16
      124           <NA> recovered         <NA>         2023-04-06        2023-04-11
      125           <NA> recovered         <NA>         2023-04-07        2023-04-12
      126           <NA> recovered         <NA>         2023-04-04        2023-04-11
      127           <NA> recovered         <NA>         2023-04-10        2023-04-11
      128           <NA>      died   2023-04-25         2023-04-13        2023-04-16
      129           <NA> recovered         <NA>         2023-04-14        2023-04-18
      130           <NA> recovered         <NA>         2023-04-13        2023-04-14
      131           <NA> recovered         <NA>         2023-04-15        2023-04-18
      132     2023-04-18      died   2023-05-02         2023-04-14        2023-04-14
      133     2023-04-27 recovered         <NA>         2023-04-12        2023-04-21
      134           <NA> recovered         <NA>         2023-04-16        2023-04-21
      135     2023-04-24 recovered         <NA>         2023-04-19        2023-04-25
      136     2023-04-29      died   2023-05-05         2023-04-23        2023-04-25
      137           <NA> recovered         <NA>         2023-04-11        2023-04-15
      138     2023-05-01 recovered         <NA>         2023-04-23        2023-04-26
      139           <NA> recovered         <NA>         2023-04-21        2023-04-22
      140           <NA> recovered         <NA>         2023-04-18        2023-04-22
      141     2023-04-26 recovered         <NA>         2023-04-21        2023-04-25
      142           <NA> recovered         <NA>         2023-05-05        2023-05-06
      143           <NA> recovered         <NA>         2023-04-28        2023-04-29
      144           <NA> recovered         <NA>         2023-04-19        2023-04-21
      145           <NA> recovered         <NA>         2023-04-21        2023-04-23
      146           <NA> recovered         <NA>         2023-05-03        2023-05-05
      147           <NA> recovered         <NA>         2023-05-06        2023-05-08
      148           <NA> recovered         <NA>         2023-05-01        2023-05-03
      149           <NA> recovered         <NA>         2023-04-25        2023-04-27
      150           <NA> recovered         <NA>         2023-04-20        2023-04-25
      151     2023-05-11 recovered         <NA>         2023-05-08        2023-05-10
      152           <NA> recovered         <NA>         2023-04-28        2023-05-04
      153           <NA> recovered         <NA>         2023-04-19        2023-04-25
      154           <NA> recovered         <NA>         2023-04-25        2023-04-26
      155           <NA> recovered         <NA>         2023-04-25        2023-04-29
      156           <NA> recovered         <NA>         2023-05-05        2023-05-08
      157           <NA> recovered         <NA>         2023-04-22        2023-04-28
      158     2023-05-21      died   2023-05-22         2023-05-01        2023-05-03
          ct_value
      1         NA
      2       22.3
      3       24.5
      4       24.8
      5         NA
      6         NA
      7         NA
      8       25.4
      9         NA
      10        NA
      11      24.5
      12        NA
      13      24.8
      14        NA
      15      24.6
      16        NA
      17      26.5
      18        NA
      19      24.7
      20      24.5
      21      21.7
      22      21.5
      23        NA
      24      24.2
      25        NA
      26        NA
      27      23.1
      28        NA
      29      21.5
      30      21.5
      31        NA
      32      26.4
      33        NA
      34        NA
      35        NA
      36      25.2
      37        NA
      38      25.8
      39      21.7
      40      23.7
      41        NA
      42      24.8
      43        NA
      44        NA
      45        NA
      46      23.6
      47      25.3
      48        NA
      49        NA
      50      23.9
      51      27.8
      52        NA
      53        NA
      54        NA
      55      26.1
      56        NA
      57        NA
      58        NA
      59        NA
      60      24.3
      61      25.9
      62        NA
      63      24.2
      64        NA
      65      27.1
      66      27.1
      67      24.3
      68        NA
      69      24.5
      70        NA
      71        NA
      72        NA
      73        NA
      74        NA
      75      30.3
      76      25.2
      77        NA
      78        NA
      79      23.0
      80      25.7
      81        NA
      82      25.1
      83      20.0
      84      25.7
      85      27.2
      86      24.2
      87        NA
      88      27.5
      89      25.3
      90        NA
      91      27.2
      92        NA
      93        NA
      94      24.9
      95      25.2
      96        NA
      97        NA
      98        NA
      99      24.0
      100     26.8
      101     24.2
      102     29.1
      103     24.1
      104     23.7
      105     23.4
      106       NA
      107       NA
      108       NA
      109     25.2
      110     26.7
      111       NA
      112       NA
      113     27.8
      114       NA
      115     26.4
      116     20.5
      117     26.4
      118     28.1
      119       NA
      120     25.6
      121     18.6
      122     25.9
      123       NA
      124     23.8
      125     24.9
      126     23.2
      127       NA
      128     24.0
      129     25.3
      130       NA
      131     22.3
      132       NA
      133       NA
      134       NA
      135       NA
      136       NA
      137     25.3
      138     23.9
      139     25.8
      140     22.5
      141     27.2
      142     25.1
      143       NA
      144     18.6
      145     23.1
      146     24.6
      147     25.7
      148       NA
      149       NA
      150       NA
      151       NA
      152       NA
      153     26.2
      154       NA
      155       NA
      156     28.1
      157     23.7
      158     26.7
      
      $contacts
                              from                       to age sex
      1                James Manis            Anisa Hatcher  90   f
      2                James Manis              Morgan Bohn   4   f
      3              Anisa Hatcher                Chen Moua  86   m
      4              Anisa Hatcher             David Welter  29   m
      5                Morgan Bohn            Sade Phillips  14   f
      6                Morgan Bohn          Sameeha al-Zaki  85   f
      7                Morgan Bohn       Christopher Turner  18   m
      8               David Welter          Yutitham Corpuz  59   m
      9              Sade Phillips    Cornelius Stadelbauer  25   m
      10             Sade Phillips          Hafsa al-Arshad  34   f
      11             Sade Phillips                Maiya Kim  89   f
      12             Sade Phillips            Nimesha Ilaoa   5   f
      13           Sameeha al-Zaki           Desmond Ibarra  63   m
      14           Hafsa al-Arshad          Junaid al-Hoque  50   m
      15           Hafsa al-Arshad             Bishr el-Aly   5   m
      16           Hafsa al-Arshad            Kaile Shaheen  89   f
      17                 Maiya Kim  Carlo Ceazar Strausburg  74   m
      18            Desmond Ibarra    Jennifer Vathanavarin  34   f
      19            Desmond Ibarra         Aabdeen al-Amara  47   m
      20            Desmond Ibarra            Edward Castro  85   m
      21            Desmond Ibarra              Deisha Wall  29   f
      22   Carlo Ceazar Strausburg          Jubair el-Zafar  24   m
      23     Jennifer Vathanavarin          Qamraaa el-Ally  46   f
      24     Jennifer Vathanavarin  Abdul Jaleel al-Shabazz  63   m
      25     Jennifer Vathanavarin      Ghaamid el-Mohammed  19   m
      26     Jennifer Vathanavarin          Jaylynn Baldwin  24   f
      27               Deisha Wall            Trever Bailey   9   m
      28               Deisha Wall       Nafeesa al-Massoud  41   f
      29               Deisha Wall          Dalicia Wilkins  72   f
      30               Deisha Wall      Sulaimaan al-Farooq   6   m
      31           Qamraaa el-Ally            Mia Grossaint   9   f
      32           Jaylynn Baldwin           James Colligan  61   m
      33           Jaylynn Baldwin         Crystal Sandoval  44   f
      34        Nafeesa al-Massoud        Chandel Aviado II  71   f
      35        Nafeesa al-Massoud           Austin Lathrop  34   m
      36        Nafeesa al-Massoud              Marco Lopez  75   m
      37        Nafeesa al-Massoud          Utkarsh Hammond  69   m
      38        Nafeesa al-Massoud           Orville Mosher  61   m
      39        Nafeesa al-Massoud       Saleet el-Shehadeh  67   m
      40           Dalicia Wilkins        Nawwaara al-Rahim  64   f
      41           Dalicia Wilkins             Eraina Smith  11   f
      42           Dalicia Wilkins           Rashele Cooper  59   f
      43       Sulaimaan al-Farooq           Shuaib al-Kaba  61   m
      44       Sulaimaan al-Farooq         Lauren Caramillo  66   f
      45          Crystal Sandoval             Savanna Sena  16   f
      46         Chandel Aviado II          Jamaal el-Sarah  81   m
      47         Chandel Aviado II Christian Gomez-Buchanan  88   m
      48            Orville Mosher      Alexander Rodriguez  53   m
      49            Orville Mosher          Jameel Scurlock  53   m
      50         Nawwaara al-Rahim          Khongmong Ahmad  45   m
      51         Nawwaara al-Rahim        Ghaaliya al-Zaher  42   f
      52         Nawwaara al-Rahim           Nichole Gilroy  42   f
      53         Nawwaara al-Rahim     Collin Rangel Mendez  78   m
      54            Shuaib al-Kaba          Ronnie Maryland  35   m
      55            Shuaib al-Kaba              Itzel Jiron  54   f
      56            Shuaib al-Kaba              Renae Mason  54   f
      57          Lauren Caramillo         Brandon Trammell  68   m
      58          Lauren Caramillo              Shane Huang   3   m
      59          Lauren Caramillo       Mu,Aawiya al-Amiri  44   m
      60           Jamaal el-Sarah          Nelly Andreatta  35   f
      61           Jameel Scurlock              Whitney Ouk  23   f
      62           Jameel Scurlock Joshua Valencia Anchondo  62   m
      63           Jameel Scurlock            Cairra Curtis  35   m
      64           Khongmong Ahmad        Nadheera el-Pasha  90   f
      65           Khongmong Ahmad        Sapphire Freeland  25   f
      66      Collin Rangel Mendez             Diksha Floyd  41   f
      67               Itzel Jiron        Exzinia O'Donnell  17   f
      68               Itzel Jiron         Hissa al-Shaheed  26   f
      69          Brandon Trammell         Mathurin Labadie  61   m
      70          Brandon Trammell              Medhavi Kim  46   f
      71               Shane Huang            Jazmine Mcgee  57   f
      72        Mu,Aawiya al-Amiri        Madelyn Mcfarland   8   f
      73        Mu,Aawiya al-Amiri             Kimiko Smith  11   f
      74  Joshua Valencia Anchondo             Yuvorn Shahi  56   m
      75             Cairra Curtis           Monica Reichal  32   f
      76             Cairra Curtis                Kevin Cha  63   m
      77             Cairra Curtis         Laraena Sturgeon  54   f
      78             Cairra Curtis                 Yusuf La  22   m
      79         Sapphire Freeland            Taylor Nguyen  67   f
      80         Sapphire Freeland              Russell Roy  83   m
      81         Sapphire Freeland          Nakrista Chacon  16   f
      82         Sapphire Freeland            Caroline Cano  38   f
      83               Medhavi Kim       Afaaf el-Mohiuddin  19   f
      84         Madelyn Mcfarland         Markese Marchman  37   m
      85         Madelyn Mcfarland        Habeeba al-Hammad  46   f
      86         Madelyn Mcfarland                Alicia Ye  64   f
      87                 Kevin Cha         Christian Molina  73   m
      88                 Kevin Cha            Mark Espinosa  13   m
      89          Laraena Sturgeon          Cassandra Lange  72   f
      90          Laraena Sturgeon            Megan Beckner  12   f
      91             Taylor Nguyen              Sally Joyce  52   f
      92             Taylor Nguyen         Alexander Naylor  61   m
      93             Taylor Nguyen        Kashauna Thompson   9   f
      94             Taylor Nguyen           Shamari Batson   9   f
      95             Taylor Nguyen          De'Chelle Yorks  42   f
      96          Markese Marchman                Micah San  22   m
      97          Christian Molina         Carmelita Huizar  29   f
      98             Mark Espinosa          Savannah Duling  15   f
      99             Mark Espinosa          Gloria Zaragoza  69   f
      100            Mark Espinosa        Daniel Goodfellow  17   m
      101            Mark Espinosa            Kloe Williams  21   f
      102            Mark Espinosa         Isabella Alvarez  54   f
      103            Mark Espinosa       Shelby Vargas Pena  20   f
      104            Mark Espinosa          Connor Reichman   9   m
      105         Alexander Naylor            Sarah Etsitty  26   f
      106         Alexander Naylor             Deliah Bison  80   f
      107         Alexander Naylor           Samuel Johnson  71   m
      108         Alexander Naylor           Aliyya al-Azzi  57   f
      109         Alexander Naylor          Deviny Mckinney  77   f
      110         Carmelita Huizar           Bertha Montoya  90   f
      111        Daniel Goodfellow           Danielle Begay  58   f
      112        Daniel Goodfellow           Taaj al-Rahimi  23   m
      113           Samuel Johnson             Lafaith Bean  35   f
      114           Bertha Montoya       Shannon Richardson  66   f
      115           Taaj al-Rahimi              Joshua Khan  62   m
      116           Taaj al-Rahimi   Andrew Macias-Monarrez  62   m
      117           Taaj al-Rahimi        Trevor Feuerstein  34   m
      118           Taaj al-Rahimi             Billye Cohen  57   f
      119             Lafaith Bean         Madison Mcdonald  44   f
      120             Lafaith Bean            Yusri al-Imam  22   m
      121              Joshua Khan           Wen Kang Zheng  57   m
      122              Joshua Khan            Sidqi el-Reza  63   m
      123             Billye Cohen                Elyse Vue   7   f
      124             Billye Cohen           Rebekah Norman  46   f
      125             Billye Cohen              Ryan Fukuda  66   m
      126         Madison Mcdonald             Henry Morgan   4   m
      127         Madison Mcdonald         Mastoor al-Murad  10   m
      128           Wen Kang Zheng     Muhaajir al-Siddique  68   m
      129           Wen Kang Zheng         Jumail al-Salame  68   m
      130           Wen Kang Zheng            Jez-Mas Woods  12   m
      131            Sidqi el-Reza            Kara Armbrust  51   f
      132            Sidqi el-Reza          Mikayla Hopkins  51   f
      133           Rebekah Norman              Weston Hahs   8   m
      134              Ryan Fukuda             Marissa Osse  55   f
      135         Jumail al-Salame         Merrill Jr Baker  77   m
      136         Jumail al-Salame         Jennifer Johnson  22   f
      137            Jez-Mas Woods             Rosemary Lor   2   f
      138            Jez-Mas Woods       Mansoor al-Hussein  53   m
      139          Mikayla Hopkins            Amanda Finken  31   f
      140          Mikayla Hopkins          Alexis Jones Jr  77   f
      141          Mikayla Hopkins           Nawfa el-Ahmad  76   f
      142          Mikayla Hopkins              Raul Millan  82   m
      143          Mikayla Hopkins         Nizaam al-Shaker  12   m
      144             Rosemary Lor         Najlaa el-Yassin  25   f
      145             Rosemary Lor         Sakeena el-Anwar  76   f
      146       Mansoor al-Hussein             Rida al-Ozer  14   m
      147       Mansoor al-Hussein             Jaesung Prum  31   m
      148       Mansoor al-Hussein          Alejandra Avila  90   f
      149       Mansoor al-Hussein          Tanya Tollivoro  76   f
      150           Nawfa el-Ahmad              Aldo Campos  30   m
      151              Raul Millan          Shahla al-Salam  32   f
      152         Najlaa el-Yassin           Shawn Videtzky  78   m
      153         Najlaa el-Yassin         Kailey Scharnell  75   f
      154         Najlaa el-Yassin            Orilea Medina  76   f
      155         Sakeena el-Anwar              Richard Lee  88   m
      156             Rida al-Ozer            Unique Tinoco  80   f
      157             Rida al-Ozer         Raadiya al-Abdoo  41   f
      158             Rida al-Ozer              Janie Mohar  78   f
      159             Rida al-Ozer           Jaycee Conners  11   m
      160             Rida al-Ozer              Asysa Smith  57   f
      161          Tanya Tollivoro      Qaaid al-Salahuddin  79   m
      162           Shawn Videtzky        Keeman Stockinger  28   m
      163           Shawn Videtzky         Frankie Griffith   2   f
      164         Kailey Scharnell       Shabeeba al-Jaffer  16   f
      165            Orilea Medina           Sharon Harding  82   f
      166            Unique Tinoco            Maritza Silva  51   f
      167            Unique Tinoco         Shalise Robinson  54   f
      168         Raadiya al-Abdoo         Fikra el-Chahine  76   f
      169         Raadiya al-Abdoo              Yael Watson  56   f
      170         Raadiya al-Abdoo          Alvaro Vikingur   5   m
      171              Janie Mohar       Nadheera al-Jafari   1   f
      172        Keeman Stockinger     Lane Martinez-Deleon  44   m
      173        Keeman Stockinger                 Ka Ahsan  76   m
      174           Sharon Harding          Munsif el-Salem   3   m
      175          Alvaro Vikingur  Abdur Rasheed al-Akbari  15   m
      176          Alvaro Vikingur   Abdul Kareem al-Firman  19   m
      177          Alvaro Vikingur            Yesenia Diego  76   f
      178       Nadheera al-Jafari    Brittany Peters-Maloy  12   f
      179                 Ka Ahsan            Trevor Arnick  43   m
      180                 Ka Ahsan           Sharaf al-Sala   9   m
      181                 Ka Ahsan   Abdul Ghafoor el-Aslam  90   m
      182                 Ka Ahsan           Samuel Henzler   7   m
      183          Munsif el-Salem            Jeremy Herman  15   m
      184          Munsif el-Salem         Brieannah Pruitt  54   f
      185   Abdul Kareem al-Firman           Raul Rodriguez  64   m
      186   Abdul Kareem al-Firman                Jay Jiron  21   m
      187   Abdul Kareem al-Firman               Sarah Tran  37   f
      188   Abdul Kareem al-Firman             T'Koia Myers  35   f
      189   Abdul Kareem al-Firman       Chasity Thammarath  70   f
      190            Yesenia Diego           Jason Figueroa  70   m
      191            Yesenia Diego        Katherine Vannice  59   f
      192            Yesenia Diego              Grant Vigil  77   m
      193            Yesenia Diego            Tracy Powells  75   m
      194            Yesenia Diego             Ashley Coles  84   f
      195   Abdul Ghafoor el-Aslam            Mason Mcgrier  18   m
      196   Abdul Ghafoor el-Aslam                Cam Tu Vu  79   f
      197           Raul Rodriguez            Lizbeth Vigil  14   f
      198           Raul Rodriguez          Bao-Tran Suetos  49   f
      199           Raul Rodriguez         Sandra Ouellette  56   f
      200           Raul Rodriguez           Gina Dalrymple  76   f
      201             T'Koia Myers          Razeen el-Karam  41   m
      202             T'Koia Myers             Luna Purdham  16   f
      203             T'Koia Myers           Tyler John III   3   m
      204             Ashley Coles         Ashley Armstrong  29   f
      205             Ashley Coles           Vincent Miller  89   m
      206             Ashley Coles       Devundrick Wallace  24   m
      207             Ashley Coles        Amelia Santa Cruz  31   f
      208            Mason Mcgrier      Damian Murillo-Soto  39   m
      209            Mason Mcgrier           Yahya al-Saidi  32   m
      210            Mason Mcgrier               Rusty Asad   9   m
      211                Cam Tu Vu           Randall Kazemi  82   m
      212          Bao-Tran Suetos         Manaara el-Bilal  39   f
      213         Sandra Ouellette              Fisayo Rice  12   m
      214           Gina Dalrymple           Mreenal Quilon  54   f
      215           Gina Dalrymple           Antonio Helfer  68   m
      216          Razeen el-Karam             Emma Waddles  73   f
      217          Razeen el-Karam            Payton Mcadoo  85   f
      218          Razeen el-Karam            Jacob Barrett  52   m
      219          Razeen el-Karam         Nabeel al-Shakir   3   m
      220         Ashley Armstrong          Jordan Redhorse  22   f
      221         Ashley Armstrong           Bianca Winkler   5   f
      222      Damian Murillo-Soto            Oscar Salazar  66   m
      223      Damian Murillo-Soto         Laaiqa al-Farrah  68   f
      224           Yahya al-Saidi    Kamaaluddeen el-Safar  38   m
      225           Yahya al-Saidi          Ameen al-Semaan  57   m
      226           Yahya al-Saidi              Joshua Reid  48   m
      227               Rusty Asad            Abeer el-Saba  75   f
      228         Manaara el-Bilal         Azmi el-Abdallah   8   m
      229            Jacob Barrett           Khyleah Dotson  28   f
      230            Jacob Barrett  Kamaaluddeen al-Noorani  21   m
      231          Jordan Redhorse            Khampane Behr   2   m
      232          Jordan Redhorse        Jose Delgado Diaz  84   m
      233         Laaiqa al-Farrah            Eliora Braden  52   f
      234         Laaiqa al-Farrah               Kevin Tran  58   m
      235         Laaiqa al-Farrah         Haakima el-Azizi  29   f
      236          Ameen al-Semaan              Quinn Salaz   7   m
      237         Azmi el-Abdallah              Amanda Dodd  30   f
      238         Azmi el-Abdallah         Julisa Alexander  11   f
      239            Khampane Behr     Alex Zaragoza-Madrid  71   m
      240            Khampane Behr             Azza el-Kazi  50   f
      241        Jose Delgado Diaz        Marissa Rodriquez  77   f
      242        Jose Delgado Diaz            Marques Cross  43   m
      243        Jose Delgado Diaz            Julanne Jones  19   f
      244        Jose Delgado Diaz           Andrew Lefholz  40   m
      245        Jose Delgado Diaz           Lydia Mcmaster  49   f
      246        Jose Delgado Diaz             Alec Coleman  11   m
      247        Jose Delgado Diaz           Braxton Griego  15   m
      248        Jose Delgado Diaz        Richard Mcclaskey  61   m
      249         Haakima el-Azizi             Roy Williams  46   m
      250         Haakima el-Azizi              Jason Hoyle  69   m
      251         Haakima el-Azizi       Yeun Jung Hasegawa  69   f
      252         Haakima el-Azizi              Yeeleng Sun  38   m
      253              Amanda Dodd             Isaac Stuart  28   m
      254              Amanda Dodd         Lawrence Jenkins  82   m
      255     Alex Zaragoza-Madrid            Adrian Romero  45   m
      256     Alex Zaragoza-Madrid           Saeed el-Javed  47   m
      257            Marques Cross            Jasmine Jones  19   f
      258           Andrew Lefholz   Ummu Kulthoom el-Kanan  85   f
      259             Roy Williams          Colette Baldwin  24   f
      260             Roy Williams                Jose Maez  46   m
      261              Jason Hoyle          Bryanna Herrera  71   f
      262              Jason Hoyle            Samuel Delori  69   m
      263       Yeun Jung Hasegawa               Lael Vigil   4   f
      264       Yeun Jung Hasegawa         Gericko Martinez  31   m
      265              Yeeleng Sun             Jessie Allen  18   f
      266              Yeeleng Sun           Asiah Marshall  16   f
      267              Yeeleng Sun             Javon Reeves  53   m
      268             Isaac Stuart             Clifton Haro  62   m
      269             Isaac Stuart          Tawheed el-Azad  87   m
      270         Lawrence Jenkins        Zuhaira el-Husain  28   f
      271         Lawrence Jenkins              Tyree Erman  42   m
      272            Jasmine Jones        Fidda al-Ghaffari  42   f
      273                Jose Maez        Farhat al-Mohamed  84   f
      274                Jose Maez        Cuauhtemoc Moreno  29   m
      275          Bryanna Herrera         Naseer al-Badour  47   m
      276          Bryanna Herrera            Zachary Major  14   m
      277               Lael Vigil             Jane Solberg  48   f
      278           Asiah Marshall          Razeen al-Shaer  89   m
      279           Asiah Marshall            Ismad al-Azad  39   m
      280           Asiah Marshall       Esmeralda Gallegos  17   f
      281             Javon Reeves             Marcus Ellis  20   m
      282             Javon Reeves            Kaylee Gaytan  61   f
      283            Zachary Major        Firdaus el-Satter   6   f
      284             Jane Solberg  Haley Iron Cloud-Gresko  28   f
      285          Razeen al-Shaer       Daifallah el-Zaman  83   m
      286          Razeen al-Shaer              Colin Rains  68   m
      287          Razeen al-Shaer          Azzaam el-Mousa  47   m
      288             Marcus Ellis           Janalen Khanom  73   f
      289             Marcus Ellis          Raabia al-Masih  24   f
      290             Marcus Ellis        Justin Cunningham  42   m
      291             Marcus Ellis               Judy David  71   f
      292        Firdaus el-Satter          Sanaaa el-Farha   9   f
      293        Firdaus el-Satter            Alexis Wilson  78   f
      294  Haley Iron Cloud-Gresko            Corina Cortez  24   f
      295  Haley Iron Cloud-Gresko        Alexandra Medrano  61   f
      296        Justin Cunningham            Bailey Torres  49   f
      297        Justin Cunningham          Andrew Kelemeni  53   m
      298        Justin Cunningham            Kristin Major  63   f
      299               Judy David          Jazmine El-Amin  29   f
      300               Judy David      Alexzandria Holguin  76   f
      301               Judy David             Jazmyn Evans  69   f
      302          Sanaaa el-Farha          Maribel Escobar  63   f
      303          Sanaaa el-Farha             Ty Gutierrez  50   m
      304          Sanaaa el-Farha           Kyana Stafford  58   f
      305          Andrew Kelemeni            Logan Ehrlich  88   m
      306          Andrew Kelemeni        Jennifer Valverde   7   f
      307          Andrew Kelemeni            Javier Lucero  51   m
      308      Alexzandria Holguin           Richard Lawson  47   m
      309      Alexzandria Holguin         Naseera el-Saidi  45   f
      310      Alexzandria Holguin              Luis Taylor  83   m
      311      Alexzandria Holguin         Stephanie Nguyen  30   f
      312             Jazmyn Evans              Kylie Berry  41   f
      313             Ty Gutierrez           Ryan Singleton  15   m
      314             Ty Gutierrez              Gia Morales  27   f
      315             Ty Gutierrez            Laneece Ahuna  88   f
      316        Jennifer Valverde           Binyu Vincelet  74   f
      317         Naseera el-Saidi            Katryna Berry   1   f
      318         Naseera el-Saidi            Autumn Lucero  84   f
      319              Luis Taylor     John Gonzalez Vargas  79   m
      320              Kylie Berry           Jacey Sheppard  54   f
      321              Kylie Berry        Mujahid al-Salehi  24   m
      322              Kylie Berry        Nicholas Johnston  37   m
      323            Laneece Ahuna            Hannah Hamlin   3   f
      324            Laneece Ahuna     Muhyddeen al-Barakat  48   m
      325     John Gonzalez Vargas            Stephon White  82   m
      326            Stephon White      Saafiyya el-Mohamed  30   f
          date_first_contact date_last_contact was_case           status
      1           2022-12-31        2023-01-05        Y             case
      2           2022-12-30        2023-01-01        Y             case
      3           2023-01-02        2023-01-04        N   under_followup
      4           2023-01-05        2023-01-05        Y             case
      5           2023-01-07        2023-01-08        Y             case
      6           2023-01-03        2023-01-06        Y             case
      7           2023-01-02        2023-01-04        N lost_to_followup
      8           2023-01-02        2023-01-06        N   under_followup
      9           2023-01-06        2023-01-06        Y             case
      10          2023-01-01        2023-01-06        Y             case
      11          2023-01-06        2023-01-08        Y             case
      12          2023-01-05        2023-01-07        N   under_followup
      13          2023-01-02        2023-01-08        Y             case
      14          2023-01-14        2023-01-17        N   under_followup
      15          2023-01-10        2023-01-13        N lost_to_followup
      16          2023-01-07        2023-01-13        N   under_followup
      17          2023-01-12        2023-01-17        Y             case
      18          2023-01-09        2023-01-11        Y             case
      19          2023-01-11        2023-01-15        N          unknown
      20          2023-01-12        2023-01-15        N   under_followup
      21          2023-01-12        2023-01-14        Y             case
      22          2023-01-12        2023-01-16        N lost_to_followup
      23          2023-01-10        2023-01-16        Y             case
      24          2023-01-12        2023-01-14        N          unknown
      25          2023-01-13        2023-01-16        N   under_followup
      26          2023-01-11        2023-01-13        Y             case
      27          2023-01-15        2023-01-16        N lost_to_followup
      28          2023-01-11        2023-01-15        Y             case
      29          2023-01-14        2023-01-17        Y             case
      30          2023-01-14        2023-01-16        Y             case
      31          2023-01-17        2023-01-18        N   under_followup
      32          2023-01-12        2023-01-16        Y             case
      33          2023-01-13        2023-01-17        Y             case
      34          2023-01-22        2023-01-23        Y             case
      35          2023-01-19        2023-01-23        N   under_followup
      36          2023-01-26        2023-01-26        N   under_followup
      37          2023-01-20        2023-01-22        Y             case
      38          2023-01-19        2023-01-23        Y             case
      39          2023-01-21        2023-01-23        N   under_followup
      40          2023-01-19        2023-01-22        Y             case
      41          2023-01-15        2023-01-20        N   under_followup
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
      61          2023-01-29        2023-01-30        N   under_followup
      62          2023-01-26        2023-01-28        Y             case
      63          2023-01-25        2023-01-30        Y             case
      64          2023-01-27        2023-01-30        Y             case
      65          2023-01-27        2023-01-31        Y             case
      66          2023-01-31        2023-02-04        N lost_to_followup
      67          2023-01-27        2023-01-28        N lost_to_followup
      68          2023-01-24        2023-01-29        N lost_to_followup
      69          2023-01-26        2023-01-27        N   under_followup
      70          2023-01-30        2023-01-31        Y             case
      71          2023-01-20        2023-01-25        N   under_followup
      72          2023-02-01        2023-02-04        Y             case
      73          2023-01-29        2023-01-31        N   under_followup
      74          2023-01-31        2023-02-04        N   under_followup
      75          2023-01-24        2023-01-30        N lost_to_followup
      76          2023-01-28        2023-02-02        Y             case
      77          2023-01-27        2023-02-02        Y             case
      78          2023-01-29        2023-02-01        N   under_followup
      79          2023-02-03        2023-02-04        Y             case
      80          2023-01-31        2023-02-05        N   under_followup
      81          2023-02-01        2023-02-02        N   under_followup
      82          2023-02-01        2023-02-04        N          unknown
      83          2023-02-01        2023-02-02        N   under_followup
      84          2023-02-01        2023-02-03        Y             case
      85          2023-01-28        2023-02-01        N   under_followup
      86          2023-01-30        2023-02-03        N lost_to_followup
      87          2023-01-31        2023-02-01        Y             case
      88          2023-01-30        2023-02-02        Y             case
      89          2023-01-31        2023-01-31        Y             case
      90          2023-01-31        2023-02-04        N   under_followup
      91          2023-01-28        2023-02-04        N lost_to_followup
      92          2023-01-30        2023-02-04        Y             case
      93          2023-02-01        2023-02-06        N lost_to_followup
      94          2023-02-01        2023-02-03        N   under_followup
      95          2023-01-31        2023-02-04        N   under_followup
      96          2023-02-04        2023-02-06        Y             case
      97          2023-02-03        2023-02-05        Y             case
      98          2023-02-02        2023-02-04        N lost_to_followup
      99          2023-02-02        2023-02-05        N   under_followup
      100         2023-01-30        2023-02-04        Y             case
      101         2023-02-04        2023-02-08        N   under_followup
      102         2023-01-31        2023-02-07        N   under_followup
      103         2023-02-05        2023-02-06        N   under_followup
      104         2023-01-30        2023-02-04        N   under_followup
      105         2023-02-01        2023-02-04        N          unknown
      106         2023-02-01        2023-02-06        N   under_followup
      107         2023-02-05        2023-02-08        Y             case
      108         2023-02-04        2023-02-10        N          unknown
      109         2023-02-02        2023-02-08        N   under_followup
      110         2023-02-06        2023-02-08        Y             case
      111         2023-02-08        2023-02-12        N lost_to_followup
      112         2023-02-10        2023-02-11        Y             case
      113         2023-02-14        2023-02-19        Y             case
      114         2023-02-11        2023-02-12        N   under_followup
      115         2023-02-13        2023-02-16        Y             case
      116         2023-02-10        2023-02-13        N   under_followup
      117         2023-02-15        2023-02-16        N   under_followup
      118         2023-02-10        2023-02-13        Y             case
      119         2023-02-16        2023-02-18        Y             case
      120         2023-02-18        2023-02-18        N   under_followup
      121         2023-03-02        2023-03-02        Y             case
      122         2023-02-26        2023-03-03        Y             case
      123         2023-02-18        2023-02-23        N lost_to_followup
      124         2023-02-24        2023-02-26        Y             case
      125         2023-02-17        2023-02-23        Y             case
      126         2023-02-18        2023-02-21        N   under_followup
      127         2023-02-16        2023-02-19        N   under_followup
      128         2023-03-01        2023-03-05        N   under_followup
      129         2023-03-06        2023-03-07        Y             case
      130         2023-03-03        2023-03-04        Y             case
      131         2023-03-04        2023-03-09        N   under_followup
      132         2023-03-07        2023-03-09        Y             case
      133         2023-02-27        2023-03-02        N   under_followup
      134         2023-03-02        2023-03-07        N   under_followup
      135         2023-03-08        2023-03-10        N   under_followup
      136         2023-03-02        2023-03-09        N lost_to_followup
      137         2023-03-06        2023-03-11        Y             case
      138         2023-03-07        2023-03-11        Y             case
      139         2023-03-16        2023-03-18        N   under_followup
      140         2023-03-14        2023-03-18        N   under_followup
      141         2023-03-18        2023-03-23        Y             case
      142         2023-03-20        2023-03-20        Y             case
      143         2023-03-19        2023-03-21        N   under_followup
      144         2023-03-07        2023-03-12        Y             case
      145         2023-03-10        2023-03-14        Y             case
      146         2023-03-06        2023-03-11        Y             case
      147         2023-03-08        2023-03-12        N lost_to_followup
      148         2023-03-07        2023-03-09        N          unknown
      149         2023-03-10        2023-03-11        Y             case
      150         2023-03-26        2023-03-29        N   under_followup
      151         2023-03-23        2023-03-27        N   under_followup
      152         2023-03-16        2023-03-21        Y             case
      153         2023-03-16        2023-03-19        Y             case
      154         2023-03-12        2023-03-19        Y             case
      155         2023-03-10        2023-03-14        N   under_followup
      156         2023-03-13        2023-03-14        Y             case
      157         2023-03-12        2023-03-14        Y             case
      158         2023-03-12        2023-03-17        Y             case
      159         2023-03-15        2023-03-18        N   under_followup
      160         2023-03-10        2023-03-15        N   under_followup
      161         2023-03-06        2023-03-12        N   under_followup
      162         2023-03-12        2023-03-17        Y             case
      163         2023-03-15        2023-03-18        Y             case
      164         2023-03-26        2023-03-29        N   under_followup
      165         2023-03-21        2023-03-25        Y             case
      166         2023-03-16        2023-03-19        N lost_to_followup
      167         2023-03-20        2023-03-22        N lost_to_followup
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
      178         2023-03-23        2023-03-24        N          unknown
      179         2023-03-20        2023-03-21        N   under_followup
      180         2023-03-20        2023-03-20        N   under_followup
      181         2023-03-20        2023-03-20        Y             case
      182         2023-03-11        2023-03-17        N   under_followup
      183         2023-03-28        2023-04-02        N   under_followup
      184         2023-04-01        2023-04-02        N   under_followup
      185         2023-03-29        2023-04-01        Y             case
      186         2023-03-24        2023-03-26        N   under_followup
      187         2023-03-27        2023-03-29        N lost_to_followup
      188         2023-03-27        2023-03-28        Y             case
      189         2023-03-27        2023-03-30        N   under_followup
      190         2023-03-25        2023-03-29        N   under_followup
      191         2023-03-25        2023-03-27        N   under_followup
      192         2023-03-23        2023-03-27        N   under_followup
      193         2023-03-24        2023-03-29        N   under_followup
      194         2023-03-23        2023-03-28        Y             case
      195         2023-03-25        2023-03-29        Y             case
      196         2023-03-26        2023-03-28        Y             case
      197         2023-04-08        2023-04-08        N   under_followup
      198         2023-04-02        2023-04-07        Y             case
      199         2023-04-03        2023-04-06        Y             case
      200         2023-03-31        2023-04-03        Y             case
      201         2023-03-28        2023-04-01        Y             case
      202         2023-03-30        2023-03-31        N   under_followup
      203         2023-03-28        2023-04-01        N   under_followup
      204         2023-03-24        2023-03-29        Y             case
      205         2023-03-27        2023-03-27        N lost_to_followup
      206         2023-03-24        2023-03-30        N lost_to_followup
      207         2023-03-26        2023-03-28        N          unknown
      208         2023-03-28        2023-04-01        Y             case
      209         2023-03-30        2023-04-06        Y             case
      210         2023-04-03        2023-04-05        Y             case
      211         2023-03-28        2023-04-01        N   under_followup
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
      224         2023-04-03        2023-04-05        N   under_followup
      225         2023-04-01        2023-04-04        Y             case
      226         2023-04-02        2023-04-04        N   under_followup
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
      238         2023-04-11        2023-04-13        N   under_followup
      239         2023-04-03        2023-04-05        Y             case
      240         2023-04-03        2023-04-06        N   under_followup
      241         2023-04-06        2023-04-12        N   under_followup
      242         2023-04-09        2023-04-12        Y             case
      243         2023-04-09        2023-04-14        N   under_followup
      244         2023-04-10        2023-04-16        Y             case
      245         2023-04-09        2023-04-11        N   under_followup
      246         2023-04-07        2023-04-10        N lost_to_followup
      247         2023-04-07        2023-04-10        N   under_followup
      248         2023-04-12        2023-04-14        N lost_to_followup
      249         2023-04-06        2023-04-11        Y             case
      250         2023-04-07        2023-04-12        Y             case
      251         2023-04-04        2023-04-11        Y             case
      252         2023-04-10        2023-04-11        Y             case
      253         2023-04-13        2023-04-16        Y             case
      254         2023-04-14        2023-04-18        Y             case
      255         2023-04-17        2023-04-18        N   under_followup
      256         2023-04-11        2023-04-16        N   under_followup
      257         2023-04-13        2023-04-14        Y             case
      258         2023-04-15        2023-04-16        N   under_followup
      259         2023-04-11        2023-04-18        N          unknown
      260         2023-04-15        2023-04-18        Y             case
      261         2023-04-14        2023-04-14        Y             case
      262         2023-04-09        2023-04-14        N          unknown
      263         2023-04-12        2023-04-21        Y             case
      264         2023-04-16        2023-04-21        Y             case
      265         2023-04-24        2023-04-26        N lost_to_followup
      266         2023-04-19        2023-04-25        Y             case
      267         2023-04-23        2023-04-25        Y             case
      268         2023-04-10        2023-04-17        N   under_followup
      269         2023-04-13        2023-04-16        N          unknown
      270         2023-04-16        2023-04-19        N   under_followup
      271         2023-04-13        2023-04-18        N   under_followup
      272         2023-04-16        2023-04-17        N   under_followup
      273         2023-04-25        2023-04-28        N lost_to_followup
      274         2023-04-25        2023-04-27        N lost_to_followup
      275         2023-04-16        2023-04-16        N   under_followup
      276         2023-04-11        2023-04-15        Y             case
      277         2023-04-23        2023-04-26        Y             case
      278         2023-04-21        2023-04-22        Y             case
      279         2023-04-18        2023-04-22        Y             case
      280         2023-04-21        2023-04-25        N lost_to_followup
      281         2023-04-21        2023-04-25        Y             case
      282         2023-04-26        2023-04-27        N   under_followup
      283         2023-05-05        2023-05-06        Y             case
      284         2023-04-28        2023-04-29        Y             case
      285         2023-04-28        2023-04-28        N          unknown
      286         2023-04-27        2023-04-30        N          unknown
      287         2023-04-26        2023-04-28        N lost_to_followup
      288         2023-04-22        2023-04-24        N   under_followup
      289         2023-04-22        2023-04-23        N   under_followup
      290         2023-04-19        2023-04-21        Y             case
      291         2023-04-21        2023-04-23        Y             case
      292         2023-05-03        2023-05-05        Y             case
      293         2023-05-07        2023-05-08        N   under_followup
      294         2023-05-03        2023-05-09        N lost_to_followup
      295         2023-05-06        2023-05-08        Y             case
      296         2023-05-03        2023-05-04        N   under_followup
      297         2023-05-01        2023-05-03        Y             case
      298         2023-04-28        2023-05-01        N   under_followup
      299         2023-04-25        2023-04-29        N   under_followup
      300         2023-04-25        2023-04-27        Y             case
      301         2023-04-20        2023-04-25        Y             case
      302         2023-04-30        2023-05-09        N          unknown
      303         2023-05-08        2023-05-10        Y             case
      304         2023-05-04        2023-05-07        N   under_followup
      305         2023-05-04        2023-05-06        N   under_followup
      306         2023-04-28        2023-05-04        Y             case
      307         2023-05-03        2023-05-06        N   under_followup
      308         2023-04-26        2023-04-30        N   under_followup
      309         2023-04-19        2023-04-25        Y             case
      310         2023-04-25        2023-04-26        Y             case
      311         2023-04-24        2023-04-27        N   under_followup
      312         2023-04-25        2023-04-29        Y             case
      313         2023-05-08        2023-05-08        N   under_followup
      314         2023-05-04        2023-05-08        N   under_followup
      315         2023-05-05        2023-05-08        Y             case
      316         2023-05-07        2023-05-10        N   under_followup
      317         2023-04-23        2023-04-26        N   under_followup
      318         2023-04-25        2023-04-25        N lost_to_followup
      319         2023-04-22        2023-04-28        Y             case
      320         2023-04-22        2023-04-29        N          unknown
      321         2023-04-27        2023-04-30        N          unknown
      322         2023-04-29        2023-05-02        N          unknown
      323         2023-05-10        2023-05-12        N lost_to_followup
      324         2023-05-15        2023-05-16        N   under_followup
      325         2023-05-01        2023-05-03        Y             case
      326         2023-05-09        2023-05-14        N lost_to_followup
      

# sim_outbreak works as expected

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
      $linelist
         id        case_name case_type sex age date_onset date_reporting
      1   1     Kevin Pullen suspected   m  35 2023-01-01     2023-01-01
      2   2 Maazin el-Othman confirmed   m  43 2023-01-01     2023-01-01
      3   3 Faisal el-Vaziri confirmed   m   1 2023-01-01     2023-01-01
      4   5     Jorge Marten suspected   m  78 2023-01-01     2023-01-01
      5   6   Katelyn Catlin confirmed   f  22 2023-01-01     2023-01-01
      6   8     Lynsey Duron confirmed   f  28 2023-01-01     2023-01-01
      7  11   Collin Stimack confirmed   m  46 2023-01-01     2023-01-01
      8  12     Jacy Cousins confirmed   f  67 2023-01-01     2023-01-01
      9  13  Nicholas Orgill confirmed   m  86 2023-01-01     2023-01-01
      10 18   Maria Eberhart  probable   f  60 2023-01-02     2023-01-02
      11 20       Kevin Waid suspected   m  49 2023-01-02     2023-01-02
      12 22      Erin Payson confirmed   f   7 2023-01-02     2023-01-02
         date_admission   outcome date_outcome date_first_contact date_last_contact
      1            <NA> recovered         <NA>               <NA>              <NA>
      2      2023-01-07 recovered         <NA>         2022-12-30        2023-01-05
      3            <NA> recovered         <NA>         2022-12-30        2023-01-02
      4      2023-01-03      died   2023-01-21         2022-12-29        2023-01-02
      5      2023-01-28      died   2023-02-09         2023-01-01        2023-01-03
      6            <NA> recovered         <NA>         2023-01-03        2023-01-04
      7            <NA> recovered         <NA>         2023-01-04        2023-01-05
      8            <NA> recovered         <NA>         2023-01-01        2023-01-04
      9            <NA> recovered         <NA>         2022-12-31        2023-01-03
      10           <NA> recovered         <NA>         2022-12-30        2023-01-03
      11           <NA> recovered         <NA>         2023-01-01        2023-01-04
      12           <NA> recovered         <NA>         2023-01-01        2023-01-03
         ct_value
      1        NA
      2      25.3
      3      25.8
      4        NA
      5      24.9
      6      24.5
      7      26.4
      8      27.3
      9      20.2
      10       NA
      11       NA
      12     26.1
      
      $contacts
                     from                       to age sex date_first_contact
      1      Kevin Pullen         Maazin el-Othman  43   m         2022-12-30
      2      Kevin Pullen         Faisal el-Vaziri   1   m         2022-12-30
      3  Maazin el-Othman   Carisa Flores-Gonzalez  29   f         2022-12-27
      4  Maazin el-Othman             Jorge Marten  78   m         2022-12-29
      5  Faisal el-Vaziri           Katelyn Catlin  22   f         2023-01-01
      6  Faisal el-Vaziri          Kaleb Natarelli  70   m         2022-12-30
      7  Faisal el-Vaziri             Lynsey Duron  28   f         2023-01-03
      8      Jorge Marten          Amaani al-Gaber  37   f         2023-01-06
      9    Katelyn Catlin           Lilibeth Black  61   f         2023-01-01
      10     Lynsey Duron           Collin Stimack  46   m         2023-01-04
      11     Lynsey Duron             Jacy Cousins  67   f         2023-01-01
      12     Lynsey Duron          Nicholas Orgill  86   m         2022-12-31
      13   Collin Stimack             Corey Alcala  71   m         2022-12-28
      14   Collin Stimack         Marquaja Johnson  51   f         2023-01-01
      15   Collin Stimack Francisco Zapata Morales  44   m         2023-01-02
      16     Jacy Cousins              Kayla Tudor  49   f         2023-01-02
      17  Nicholas Orgill           Maria Eberhart  60   f         2022-12-30
      18  Nicholas Orgill              Katja Muetz  56   f         2023-01-06
      19  Nicholas Orgill               Kevin Waid  49   m         2023-01-01
      20  Nicholas Orgill            Sean Shrestha  50   m         2023-01-01
      21   Maria Eberhart              Erin Payson   7   f         2023-01-01
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-02        Y             case
      3         2023-01-03        N   under_followup
      4         2023-01-02        Y             case
      5         2023-01-03        Y             case
      6         2023-01-02        N   under_followup
      7         2023-01-04        Y             case
      8         2023-01-06        N   under_followup
      9         2023-01-05        N   under_followup
      10        2023-01-05        Y             case
      11        2023-01-04        Y             case
      12        2023-01-03        Y             case
      13        2023-01-05        N lost_to_followup
      14        2023-01-04        N lost_to_followup
      15        2023-01-05        N   under_followup
      16        2023-01-03        N   under_followup
      17        2023-01-03        Y             case
      18        2023-01-09        N   under_followup
      19        2023-01-04        Y             case
      20        2023-01-03        N          unknown
      21        2023-01-03        Y             case
      

# sim_outbreak works as expected with anonymised

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
      $linelist
         id  case_name case_type sex age date_onset date_reporting date_admission
      1   1 OvsRrRMCAJ confirmed   m  35 2023-01-01     2023-01-01           <NA>
      2   2 FEY3qKY39Z  probable   m  43 2023-01-01     2023-01-01     2023-01-07
      3   3 yiuuoY8Kxn confirmed   m   1 2023-01-01     2023-01-01           <NA>
      4   5 Huaqm1SzNb  probable   m  78 2023-01-01     2023-01-01     2023-01-03
      5   6 O5h4yEtT6t suspected   f  22 2023-01-01     2023-01-01     2023-01-28
      6   8 8e6yKFNmyd  probable   f  28 2023-01-01     2023-01-01           <NA>
      7  11 Lkhw9tYeb1 confirmed   m  46 2023-01-01     2023-01-01           <NA>
      8  12 elczXnmE3U suspected   f  67 2023-01-01     2023-01-01           <NA>
      9  13 4HDzSVgVAW confirmed   m  86 2023-01-01     2023-01-01           <NA>
      10 18 To9HLY9VZd  probable   f  60 2023-01-02     2023-01-02           <NA>
      11 20 czwJ3WvUcV confirmed   m  49 2023-01-02     2023-01-02           <NA>
      12 22 vu5Ak6RZkf confirmed   f   7 2023-01-02     2023-01-02           <NA>
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>     26.2
      2  recovered         <NA>         2022-12-30        2023-01-05       NA
      3  recovered         <NA>         2022-12-30        2023-01-02     26.4
      4       died   2023-01-21         2022-12-29        2023-01-02       NA
      5       died   2023-02-09         2023-01-01        2023-01-03       NA
      6  recovered         <NA>         2023-01-03        2023-01-04       NA
      7  recovered         <NA>         2023-01-04        2023-01-05     26.1
      8  recovered         <NA>         2023-01-01        2023-01-04       NA
      9  recovered         <NA>         2022-12-31        2023-01-03     23.9
      10 recovered         <NA>         2022-12-30        2023-01-03       NA
      11 recovered         <NA>         2023-01-01        2023-01-04     22.3
      12 recovered         <NA>         2023-01-01        2023-01-03     24.2
      
      $contacts
               from         to age sex date_first_contact date_last_contact was_case
      1  OvsRrRMCAJ FEY3qKY39Z  43   m         2022-12-30        2023-01-05        Y
      2  OvsRrRMCAJ yiuuoY8Kxn   1   m         2022-12-30        2023-01-02        Y
      3  FEY3qKY39Z g7AzDS6oXf  29   f         2022-12-27        2023-01-03        N
      4  FEY3qKY39Z Huaqm1SzNb  78   m         2022-12-29        2023-01-02        Y
      5  yiuuoY8Kxn O5h4yEtT6t  22   f         2023-01-01        2023-01-03        Y
      6  yiuuoY8Kxn ejRt34oCba  70   m         2022-12-30        2023-01-02        N
      7  yiuuoY8Kxn 8e6yKFNmyd  28   f         2023-01-03        2023-01-04        Y
      8  Huaqm1SzNb PL7XeZaLTm  37   f         2023-01-06        2023-01-06        N
      9  O5h4yEtT6t hWsVUBVWYT  61   f         2023-01-01        2023-01-05        N
      10 8e6yKFNmyd Lkhw9tYeb1  46   m         2023-01-04        2023-01-05        Y
      11 8e6yKFNmyd elczXnmE3U  67   f         2023-01-01        2023-01-04        Y
      12 8e6yKFNmyd 4HDzSVgVAW  86   m         2022-12-31        2023-01-03        Y
      13 Lkhw9tYeb1 QihvSfYVAR  71   m         2022-12-28        2023-01-05        N
      14 Lkhw9tYeb1 DjDafq8m2z  51   f         2023-01-01        2023-01-04        N
      15 Lkhw9tYeb1 bFUJRewLYt  44   m         2023-01-02        2023-01-05        N
      16 elczXnmE3U BBlIdUTzmc  49   f         2023-01-02        2023-01-03        N
      17 4HDzSVgVAW To9HLY9VZd  60   f         2022-12-30        2023-01-03        Y
      18 4HDzSVgVAW zuuT3p6Kxu  56   f         2023-01-06        2023-01-09        N
      19 4HDzSVgVAW czwJ3WvUcV  49   m         2023-01-01        2023-01-04        Y
      20 4HDzSVgVAW V4dJ6ZKaUK  50   m         2023-01-01        2023-01-03        N
      21 To9HLY9VZd vu5Ak6RZkf   7   f         2023-01-01        2023-01-03        Y
                   status
      1              case
      2              case
      3    under_followup
      4              case
      5              case
      6    under_followup
      7              case
      8    under_followup
      9    under_followup
      10             case
      11             case
      12             case
      13   under_followup
      14 lost_to_followup
      15   under_followup
      16   under_followup
      17             case
      18   under_followup
      19             case
      20          unknown
      21             case
      

# sim_outbreak works as expected with age-strat risks

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
      $linelist
         id          case_name case_type sex age date_onset date_reporting
      1   1         Kyle Crane suspected   m  35 2023-01-01     2023-01-01
      2   2 Ghaamid el-Ishmael confirmed   m  43 2023-01-01     2023-01-01
      3   3   Faatih el-Kaiser confirmed   m   1 2023-01-01     2023-01-01
      4   5   Va'Aahi Galligan suspected   m  78 2023-01-01     2023-01-01
      5   6     Katelyn Catlin confirmed   f  22 2023-01-01     2023-01-01
      6   8       Lynsey Duron confirmed   f  28 2023-01-01     2023-01-01
      7  11    Wajdi al-Demian confirmed   m  46 2023-01-01     2023-01-01
      8  12       Jacy Cousins confirmed   f  67 2023-01-01     2023-01-01
      9  13      Travis Foster confirmed   m  86 2023-01-01     2023-01-01
      10 18     Maria Eberhart  probable   f  60 2023-01-02     2023-01-02
      11 20  Mubarak el-Vaziri suspected   m  49 2023-01-02     2023-01-02
      12 22        Erin Payson confirmed   f   7 2023-01-02     2023-01-02
         date_admission   outcome date_outcome date_first_contact date_last_contact
      1            <NA> recovered         <NA>               <NA>              <NA>
      2      2023-01-07 recovered         <NA>         2022-12-30        2023-01-05
      3            <NA> recovered         <NA>         2022-12-30        2023-01-02
      4            <NA> recovered         <NA>         2022-12-29        2023-01-02
      5            <NA> recovered         <NA>         2023-01-01        2023-01-03
      6            <NA> recovered         <NA>         2023-01-03        2023-01-04
      7            <NA> recovered         <NA>         2023-01-04        2023-01-05
      8            <NA> recovered         <NA>         2023-01-01        2023-01-04
      9            <NA> recovered         <NA>         2022-12-31        2023-01-03
      10           <NA> recovered         <NA>         2022-12-30        2023-01-03
      11           <NA> recovered         <NA>         2023-01-01        2023-01-04
      12           <NA> recovered         <NA>         2023-01-01        2023-01-03
         ct_value
      1        NA
      2      25.3
      3      25.8
      4        NA
      5      24.9
      6      24.5
      7      26.4
      8      27.3
      9      20.2
      10       NA
      11       NA
      12     26.1
      
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
      9         2023-01-05        N   under_followup
      10        2023-01-05        Y             case
      11        2023-01-04        Y             case
      12        2023-01-03        Y             case
      13        2023-01-05        N lost_to_followup
      14        2023-01-04        N lost_to_followup
      15        2023-01-05        N   under_followup
      16        2023-01-03        N   under_followup
      17        2023-01-03        Y             case
      18        2023-01-09        N   under_followup
      19        2023-01-04        Y             case
      20        2023-01-03        N          unknown
      21        2023-01-03        Y             case
      

# sim_outbreak works as expected with age structure

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
      $linelist
         id          case_name case_type sex age date_onset date_reporting
      1   1      Gabriel Black  probable   m  43 2023-01-01     2023-01-01
      2   2       Tyler Kelley confirmed   m  13 2023-01-01     2023-01-01
      3   3       Cody Morales suspected   m  11 2023-01-01     2023-01-01
      4   5          Joewid Le  probable   m  80 2023-01-01     2023-01-01
      5   6      Carolyn Moore confirmed   f  19 2023-01-01     2023-01-01
      6   8  Cheyenne Sayavong confirmed   f  84 2023-01-01     2023-01-01
      7  11 Pierce Khanthavong confirmed   m  79 2023-01-01     2023-01-01
      8  12          Kendra To suspected   f  31 2023-01-01     2023-01-01
      9  13  Preston Barringer confirmed   m  71 2023-01-01     2023-01-01
      10 18  Dominique Raymond confirmed   f  61 2023-01-02     2023-01-02
      11 20   Bassaam el-Majid  probable   m  51 2023-01-02     2023-01-02
      12 22      Susana Varela  probable   f  75 2023-01-02     2023-01-02
         date_admission   outcome date_outcome date_first_contact date_last_contact
      1      2023-01-02 recovered         <NA>               <NA>              <NA>
      2            <NA> recovered         <NA>         2022-12-30        2023-01-05
      3            <NA> recovered         <NA>         2022-12-30        2023-01-02
      4            <NA> recovered         <NA>         2022-12-29        2023-01-02
      5            <NA> recovered         <NA>         2023-01-01        2023-01-03
      6            <NA> recovered         <NA>         2023-01-03        2023-01-04
      7            <NA> recovered         <NA>         2023-01-04        2023-01-05
      8            <NA> recovered         <NA>         2023-01-01        2023-01-04
      9            <NA> recovered         <NA>         2022-12-31        2023-01-03
      10     2023-01-03      died   2023-01-21         2022-12-30        2023-01-03
      11           <NA> recovered         <NA>         2023-01-01        2023-01-04
      12     2023-01-05 recovered         <NA>         2023-01-01        2023-01-03
         ct_value
      1        NA
      2      23.0
      3        NA
      4        NA
      5      28.2
      6      25.0
      7      19.2
      8        NA
      9      22.8
      10     28.1
      11       NA
      12       NA
      
      $contacts
                       from                        to age sex date_first_contact
      1       Gabriel Black              Tyler Kelley  13   m         2022-12-30
      2       Gabriel Black              Cody Morales  11   m         2022-12-30
      3        Tyler Kelley             Taylor Graves  10   f         2022-12-27
      4        Tyler Kelley                 Joewid Le  80   m         2022-12-29
      5        Cody Morales             Carolyn Moore  19   f         2023-01-01
      6        Cody Morales           Rushdi al-Ishak   4   m         2022-12-30
      7        Cody Morales         Cheyenne Sayavong  84   f         2023-01-03
      8           Joewid Le         Mercedes Lovelace  86   f         2023-01-06
      9       Carolyn Moore Chantelle Vazquez-Luevano  88   f         2023-01-01
      10  Cheyenne Sayavong        Pierce Khanthavong  79   m         2023-01-04
      11  Cheyenne Sayavong                 Kendra To  31   f         2023-01-01
      12  Cheyenne Sayavong         Preston Barringer  71   m         2022-12-31
      13 Pierce Khanthavong           Jackson Carlson  78   m         2022-12-28
      14 Pierce Khanthavong               Megan Hayes  28   f         2023-01-01
      15 Pierce Khanthavong               Sam Spencer   1   m         2023-01-02
      16          Kendra To         Amanda Larochelle  13   f         2023-01-02
      17  Preston Barringer         Dominique Raymond  61   f         2022-12-30
      18  Preston Barringer            Natalie Newton  24   f         2023-01-06
      19  Preston Barringer          Bassaam el-Majid  51   m         2023-01-01
      20  Preston Barringer           Qaaid al-Madani  73   m         2023-01-01
      21  Dominique Raymond             Susana Varela  75   f         2023-01-01
         date_last_contact was_case           status
      1         2023-01-05        Y             case
      2         2023-01-02        Y             case
      3         2023-01-03        N   under_followup
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
      18        2023-01-09        N   under_followup
      19        2023-01-04        Y             case
      20        2023-01-03        N   under_followup
      21        2023-01-03        Y             case
      

