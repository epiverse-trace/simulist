# sim_linelist works as expected with defaults

    Code
      sim_linelist()
    Output
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

# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
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

# sim_linelist works as expected with age-strat risks

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
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

# sim_linelist works as expected with anonymous

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
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

# sim_linelist works as expected with age structure

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
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

# sim_linelist works as expected with age-strat risks & age struct

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, population_age = age_struct)
    Output
         id           case_name case_type sex age date_onset date_reporting
      1   1        Bryce Kelley confirmed   m  43 2023-01-01     2023-01-01
      2   2 Khristopher Carlson confirmed   m  13 2023-01-01     2023-01-01
      3   3       Cleatus Black suspected   m  11 2023-01-01     2023-01-01
      4   5       Tyler Spencer confirmed   m  80 2023-01-01     2023-01-01
      5   6    Sajiyya el-Bahri confirmed   f  19 2023-01-01     2023-01-01
      6   8   Shameema al-Fayad confirmed   f  84 2023-01-01     2023-01-01
      7  11           Jelani Le confirmed   m  79 2023-01-01     2023-01-01
      8  12    Ashley Depoyster confirmed   f  31 2023-01-01     2023-01-01
      9  13     Rushdi el-Amara  probable   m  71 2023-01-01     2023-01-01
      10 18      Sabrina Catlin suspected   f  61 2023-01-02     2023-01-02
      11 20       Jackson Sheek confirmed   m  51 2023-01-02     2023-01-02
      12 22       Talia Cousins  probable   f  75 2023-01-02     2023-01-02
         date_admission   outcome date_outcome date_first_contact date_last_contact
      1            <NA> recovered         <NA>               <NA>              <NA>
      2            <NA> recovered         <NA>         2022-12-30        2023-01-05
      3            <NA> recovered         <NA>         2022-12-30        2023-01-02
      4            <NA> recovered         <NA>         2022-12-29        2023-01-02
      5            <NA> recovered         <NA>         2023-01-01        2023-01-03
      6            <NA> recovered         <NA>         2023-01-03        2023-01-04
      7            <NA> recovered         <NA>         2023-01-04        2023-01-05
      8            <NA> recovered         <NA>         2023-01-01        2023-01-04
      9            <NA> recovered         <NA>         2022-12-31        2023-01-03
      10           <NA> recovered         <NA>         2022-12-30        2023-01-03
      11           <NA> recovered         <NA>         2023-01-01        2023-01-04
      12     2023-01-05 recovered         <NA>         2023-01-01        2023-01-03
         ct_value
      1      26.0
      2      25.8
      3        NA
      4      28.7
      5      27.1
      6      25.2
      7      24.8
      8      26.2
      9        NA
      10       NA
      11     23.2
      12       NA

# sim_linelist works as expected with modified config

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution = "geom",
          last_contact_distribution_params = c(prob = 0.5)))
    Output
         id           case_name case_type sex age date_onset date_reporting
      1   1        Lily Camacho confirmed   f  20 2023-01-01     2023-01-01
      2   2 Charles Stuart Rasi suspected   m  24 2023-01-01     2023-01-01
      3   3        Jonah Burden suspected   m  51 2023-01-01     2023-01-01
      4   5          Craig Agee  probable   m  16 2023-01-01     2023-01-01
      5   6 Christopher Lohrenz suspected   m  83 2023-01-01     2023-01-01
      6   8      Kevin Saunders suspected   m  48 2023-01-01     2023-01-01
      7  11     Saabiq al-Samra  probable   m  77 2023-01-01     2023-01-01
      8  12      Kenneth Cahill confirmed   m  90 2023-01-01     2023-01-01
      9  13    Halle Batchelder confirmed   f  66 2023-01-01     2023-01-01
      10 18  Morgan Grant-Perry confirmed   f  31 2023-01-02     2023-01-02
      11 20      Enrique Galvan confirmed   m  46 2023-01-02     2023-01-02
      12 22     Robert Chaparro confirmed   m  75 2023-01-02     2023-01-02
         date_admission   outcome date_outcome date_first_contact date_last_contact
      1            <NA> recovered         <NA>               <NA>              <NA>
      2      2023-01-02      died   2023-01-10         2022-12-30        2023-01-01
      3            <NA> recovered         <NA>         2022-12-31        2023-01-02
      4            <NA> recovered         <NA>         2022-12-30        2023-01-02
      5            <NA>      died   2023-01-16         2022-12-31        2023-01-01
      6            <NA> recovered         <NA>         2022-12-31        2023-01-01
      7      2023-01-15 recovered         <NA>         2022-12-30        2023-01-02
      8            <NA> recovered         <NA>         2022-12-30        2023-01-01
      9            <NA> recovered         <NA>         2022-12-29        2023-01-01
      10           <NA> recovered         <NA>         2022-12-30        2023-01-01
      11           <NA> recovered         <NA>         2022-12-30        2023-01-01
      12           <NA> recovered         <NA>         2022-12-30        2023-01-02
         ct_value
      1      24.3
      2        NA
      3        NA
      4        NA
      5        NA
      6        NA
      7        NA
      8      23.1
      9      24.5
      10     25.8
      11     23.3
      12     30.3

# sim_linelist works as expected with modified config parameters

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution_params = c(lambda = 5)))
    Output
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
      2      2023-01-07 recovered         <NA>         2023-01-01        2023-01-07
      3            <NA> recovered         <NA>         2022-12-31        2023-01-03
      4      2023-01-03      died   2023-01-21         2022-12-31        2023-01-04
      5      2023-01-28      died   2023-02-09         2023-01-02        2023-01-04
      6            <NA> recovered         <NA>         2023-01-06        2023-01-07
      7            <NA> recovered         <NA>         2023-01-07        2023-01-08
      8            <NA> recovered         <NA>         2023-01-03        2023-01-06
      9            <NA> recovered         <NA>         2023-01-02        2023-01-05
      10           <NA> recovered         <NA>         2023-01-01        2023-01-05
      11           <NA> recovered         <NA>         2023-01-04        2023-01-07
      12           <NA> recovered         <NA>         2023-01-03        2023-01-05
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

# sim_linelist works as expected with time-varying cfr

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(time_varying_death_risk = function(risk, time) risk *
          exp(-time)))
    Output
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

# sim_linelist works as expected with time-varying cfr & age-strat

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_death_risk = age_dep_hosp_death_risk, config = create_config(
          time_varying_death_risk = function(risk, time) risk * exp(-time)))
    Output
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
      4      2023-01-03 recovered         <NA>         2022-12-29        2023-01-02
      5      2023-01-28 recovered         <NA>         2023-01-01        2023-01-03
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

