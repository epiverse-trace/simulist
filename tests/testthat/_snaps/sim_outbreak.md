# sim_outbreak works as expected with defaults

    Code
      sim_outbreak()
    Output
      $linelist
           id                 case_name case_type sex age date_onset date_reporting
      1     1          Michael Mckenney confirmed   m  58 2023-01-01     2023-01-01
      2     2               Jordan Reed  probable   m  89 2023-01-01     2023-01-01
      3     3         Bassil el-Hossain suspected   m   3 2023-01-02     2023-01-02
      4     5          Joseph Dickerson suspected   m  28 2023-01-04     2023-01-04
      5     6       Naqiyya el-Ghaffari confirmed   f  13 2023-01-05     2023-01-05
      6     7           Sergio Sandoval suspected   m  84 2023-01-06     2023-01-06
      7    10         Benjamin Sendejas confirmed   m  24 2023-01-13     2023-01-13
      8    11                Aimee Snow confirmed   f  33 2023-01-11     2023-01-11
      9    12             Alexis Zamora confirmed   f  88 2023-01-13     2023-01-13
      10   14                Dylan Bell suspected   m  62 2023-01-11     2023-01-11
      11   18          Kiyontus Gallion  probable   m  73 2023-01-14     2023-01-14
      12   19         Mishaari al-Kalil  probable   m  33 2023-01-12     2023-01-12
      13   22        Christine Shrestha confirmed   f  28 2023-01-12     2023-01-12
      14   24              Jenae Cromer suspected   f  45 2023-01-13     2023-01-13
      15   27       Ana Aviles Montalvo suspected   f  23 2023-01-14     2023-01-14
      16   29                Andrew Bly confirmed   m  40 2023-01-21     2023-01-21
      17   30             Charlee Oster  probable   f  71 2023-01-19     2023-01-19
      18   31              Alex Kumagai confirmed   m   5 2023-01-20     2023-01-20
      19   33          Zumruda al-Nawaz  probable   f   8 2023-01-14     2023-01-14
      20   34          Brittany Johnson confirmed   f  60 2023-01-14     2023-01-14
      21   35            Alexander Jack suspected   m  43 2023-01-27     2023-01-27
      22   38             Nuzha el-Amin confirmed   f  74 2023-01-23     2023-01-23
      23   39              Deshawn Ryan suspected   m  68 2023-01-23     2023-01-23
      24   41             Ramla al-Zaki confirmed   f  66 2023-01-24     2023-01-24
      25   44             Darian Madera confirmed   m  58 2023-01-22     2023-01-22
      26   45           Masood el-Zaman confirmed   m  60 2023-01-22     2023-01-22
      27   47                Tre Elfvin confirmed   f  15 2023-01-28     2023-01-28
      28   50         Jameela al-Arshad  probable   f  52 2023-01-28     2023-01-28
      29   51     Jaylynn Kelly-Corichi confirmed   f  52 2023-01-29     2023-01-29
      30   53           Sultan al-Qasim suspected   m  41 2023-02-02     2023-02-02
      31   54              Adam Puentes  probable   m  41 2023-02-03     2023-02-03
      32   55            Rajaa al-Hoque confirmed   m  77 2023-01-24     2023-01-24
      33   56            Jaliya Hatcher  probable   f  34 2023-01-26     2023-01-26
      34   58       Isaac Herrera-Vigil confirmed   m  53 2023-01-25     2023-01-25
      35   59             Saleet el-Aly confirmed   m  67 2023-01-23     2023-01-23
      36   60            Crystal Garcia  probable   f   2 2023-01-29     2023-01-29
      37   63            Subhi al-Amara confirmed   m  22 2023-01-31     2023-01-31
      38   64          Jasmine Phillips  probable   f  61 2023-01-29     2023-01-29
      39   65           Suhaib el-Zafar  probable   m  34 2023-02-03     2023-02-03
      40   66         Jonni Lynn Seiler  probable   f  89 2023-02-01     2023-02-01
      41   71           Jeremiah Flores confirmed   m  60 2023-01-29     2023-01-29
      42   73           Savanna Baldwin  probable   f  56 2023-02-01     2023-02-01
      43   77         Fikri el-Mohammed confirmed   m  31 2023-01-30     2023-01-30
      44   78             Claire Conley confirmed   f  62 2023-01-29     2023-01-29
      45   80        Mu'taz el-Shehadeh confirmed   m  21 2023-02-03     2023-02-03
      46   85            Zachary Murphy suspected   m  18 2023-02-02     2023-02-02
      47   88               Jalen Palma confirmed   m  63 2023-01-30     2023-01-30
      48   89          Mondray Hamilton  probable   m  72 2023-02-02     2023-02-02
      49   90           Jennifer Nguyen  probable   f  12 2023-02-01     2023-02-01
      50   93            Shukri al-Kaba  probable   m  51 2023-02-04     2023-02-04
      51   97             Kelly Fuentes confirmed   f  41 2023-02-05     2023-02-05
      52   98                  Mia Long confirmed   f  21 2023-02-04     2023-02-04
      53  101         Nawwaara el-Pasha  probable   f  68 2023-02-07     2023-02-07
      54  108           Michael Powless  probable   m  79 2023-02-14     2023-02-14
      55  111             Julian Ibarra confirmed   m  76 2023-02-09     2023-02-09
      56  113              Pedro Parker confirmed   m  57 2023-02-12     2023-02-12
      57  114                Joseph Tan suspected   m  22 2023-02-16     2023-02-16
      58  116              Ashley Mcgee  probable   f  65 2023-02-24     2023-02-24
      59  119            Mori Phanekham  probable   m  33 2023-02-23     2023-02-23
      60  120             Tucker Welter confirmed   m  56 2023-02-18     2023-02-18
      61  122    Abdul Ghafoor el-Sarah  probable   m  21 2023-03-02     2023-03-02
      62  123             Yutitham Tong  probable   m  56 2023-03-08     2023-03-08
      63  125        Caroline Andreatta  probable   f   6 2023-02-28     2023-02-28
      64  126       Ghaaliya al-Shaheed  probable   f  45 2023-02-26     2023-02-26
      65  130            Matthew Bailey confirmed   m  67 2023-03-07     2023-03-07
      66  131   Amanda Runningbear-Paul confirmed   f  67 2023-03-09     2023-03-09
      67  133     Carlo Ceazar Santiago  probable   m  50 2023-03-18     2023-03-18
      68  138         Caroline Sturgeon confirmed   f  21 2023-03-10     2023-03-10
      69  139          Marcela Thompson  probable   f   1 2023-03-09     2023-03-09
      70  142             Alexis Cooper confirmed   f  76 2023-03-23     2023-03-23
      71  143            Faaris al-Imam confirmed   m  75 2023-03-21     2023-03-21
      72  145            Nawaar el-Reza confirmed   m  11 2023-03-15     2023-03-15
      73  146           Saleet al-Murad suspected   m  24 2023-03-13     2023-03-13
      74  147        Rhiannon Caramillo confirmed   f  75 2023-03-13     2023-03-13
      75  150           Shelby Zaragoza suspected   f  89 2023-03-11     2023-03-11
      76  153           Chandel Beckner suspected   f  31 2023-03-15     2023-03-15
      77  154              Ethan Mosher suspected   m  77 2023-03-24     2023-03-24
      78  155        Shuaib al-Siddique  probable   m  74 2023-03-24     2023-03-24
      79  157              Joshua Lopez  probable   m  87 2023-03-18     2023-03-18
      80  158          Jamaal al-Salame confirmed   m  79 2023-03-18     2023-03-18
      81  159              Renae Beeton confirmed   f  40 2023-03-19     2023-03-19
      82  163           Khongmong Huang  probable   m  78 2023-03-15     2023-03-15
      83  164             Lauren Batson  probable   f  27 2023-03-21     2023-03-21
      84  166          Madelyn Mcmullen confirmed   f  15 2023-03-26     2023-03-26
      85  171             Octavia Yorks confirmed   f  55 2023-03-22     2023-03-22
      86  172               Shane Shahi suspected   m   4 2023-03-20     2023-03-20
      87  173           Deviny Armbrust confirmed   f   0 2023-03-19     2023-03-19
      88  174          Treyvon Scurlock confirmed   m  43 2023-03-16     2023-03-16
      89  175               Daijia Bean confirmed   f  75 2023-03-29     2023-03-29
      90  176              Shannon Osse confirmed   f   2 2023-03-25     2023-03-25
      91  177            Taaj al-Shaker confirmed   m  14 2023-03-26     2023-03-26
      92  178            Tucker Sorrell suspected   m  18 2023-03-25     2023-03-25
      93  182            Madison Finken confirmed   f   8 2023-03-27     2023-03-27
      94  186             Yusri al-Ozer confirmed   m  53 2023-04-03     2023-04-03
      95  189          Habeeba el-Ahmad suspected   f  36 2023-03-29     2023-03-29
      96  195            Kara Tollivoro confirmed   f  74 2023-03-27     2023-03-27
      97  196            Nawfa el-Anwar  probable   f  83 2023-03-30     2023-03-30
      98  197         Marissa Scharnell  probable   f  17 2023-03-28     2023-03-28
      99  199            Orilea Montoya confirmed   f  13 2023-04-07     2023-04-07
      100 200            Unique Johnson confirmed   f  48 2023-04-05     2023-04-05
      101 201           Najlaa al-Salam suspected   f  55 2023-04-07     2023-04-07
      102 202              Janie Medina suspected   f  75 2023-04-03     2023-04-03
      103 205              Jericho Huff  probable   m   2 2023-04-01     2023-04-01
      104 209               Cody Powell confirmed   m  30 2023-04-05     2023-04-05
      105 210            Nadia Jones Jr confirmed   f  38 2023-04-01     2023-04-01
      106 211                  Kevin La confirmed   m  31 2023-04-06     2023-04-06
      107 213                Ryan Stott confirmed   m  81 2023-04-11     2023-04-11
      108 214           Thomas Maryland confirmed   m  38 2023-04-17     2023-04-17
      109 219          Otoniel Mitchell confirmed   m  84 2023-04-10     2023-04-10
      110 221          Cornelius Curtis confirmed   m   2 2023-04-02     2023-04-02
      111 224        Raadiya el-Chahine suspected   f  65 2023-04-08     2023-04-08
      112 226           Briana Robinson suspected   f  37 2023-04-06     2023-04-06
      113 229                 Yusuf San  probable   m  74 2023-04-12     2023-04-12
      114 230          Micah Goodfellow confirmed   m   7 2023-04-12     2023-04-12
      115 232           Orville Labadie confirmed   m  20 2023-04-02     2023-04-02
      116 233      Safarha Peters-Maloy suspected   f   1 2023-04-09     2023-04-09
      117 234            Rosemary Lange suspected   f  83 2023-04-09     2023-04-09
      118 235          Austin Martzloff confirmed   m  51 2023-04-12     2023-04-12
      119 236            Savannah Begay suspected   f  57 2023-04-10     2023-04-10
      120 238             Rida el-Karam confirmed   m   6 2023-04-14     2023-04-14
      121 240            Qaaid al-Saidi confirmed   m  10 2023-04-15     2023-04-15
      122 243             Lizbeth Silva confirmed   f  76 2023-04-13     2023-04-13
      123 245               Chasity Lor confirmed   f  90 2023-04-15     2023-04-15
      124 250          Danielle Vannice  probable   f  14 2023-04-16     2023-04-16
      125 251    Abdur Rasheed el-Safar confirmed   m  60 2023-04-11     2023-04-11
      126 252    Abdul Kareem al-Semaan confirmed   m  45 2023-04-20     2023-04-20
      127 253            Daniel Johnson confirmed   m  68 2023-04-20     2023-04-20
      128 254              Amelia Diego suspected   f  68 2023-04-16     2023-04-16
      129 255        Shabeeba al-Jafari confirmed   f  37 2023-04-16     2023-04-16
      130 258           Craynisha Myers confirmed   f  44 2023-04-14     2023-04-14
      131 261          Billye Ouellette confirmed   f  84 2023-04-26     2023-04-26
      132 262         Alexander Goldman suspected   m  23 2023-04-13     2023-04-13
      133 264           Jameel Marchman confirmed   m  70 2023-04-25     2023-04-25
      134 265              Bianca Vigil confirmed   f  68 2023-04-25     2023-04-25
      135 267        Nadheera al-Farrah suspected   f  30 2023-04-20     2023-04-20
      136 268               Lasha Coles confirmed   f  17 2023-04-21     2023-04-21
      137 277       Alejandra Dalrymple suspected   f  28 2023-05-01     2023-05-01
      138 278             Karah Waddles suspected   f  46 2023-04-28     2023-04-28
      139 279             Henry Henzler suspected   m  13 2023-04-25     2023-04-25
      140 280           Frankie Purdham  probable   f  47 2023-04-26     2023-04-26
      141 282              Renee Dotson  probable   f  38 2023-04-21     2023-04-21
      142 284             Brandon Baker confirmed   m  19 2023-05-03     2023-05-03
      143 285            Payton Baldwin confirmed   f  60 2023-05-05     2023-05-05
      144 291            Gina Rodriquez confirmed   f  72 2023-05-01     2023-05-01
      145 292          Haakima el-Kanan confirmed   f  23 2023-04-23     2023-04-23
      146 293             Weston Miller confirmed   m  41 2023-05-05     2023-05-05
      147 296 Ummu Kulthoom al-Ghaffari confirmed   f  77 2023-05-06     2023-05-06
      148 298                Mreenal Vu  probable   f  60 2023-05-02     2023-05-02
      149 301       Esmeralda Alexander confirmed   f  62 2023-04-23     2023-04-23
      150 302                Shawn Reid confirmed   m  28 2023-04-26     2023-04-26
      151 304        Zuhaira al-Mohamed confirmed   f  68 2023-05-07     2023-05-07
      152 307             Luna Mcmaster confirmed   f  57 2023-05-09     2023-05-09
      153 310           Fidda el-Satter suspected   f  50 2023-04-24     2023-04-24
      154 311               Jane Quilon  probable   f  46 2023-04-25     2023-04-25
      155 313           Farhat al-Masih  probable   f  82 2023-04-27     2023-04-27
      156 316              Tyler Herman  probable   m  14 2023-05-10     2023-05-10
      157 320          Alexandra Gaytan suspected   f   0 2023-05-01     2023-05-01
      158 326              Ashley Vigil confirmed   f   2 2023-05-08     2023-05-08
          date_admission   outcome date_outcome date_first_contact date_last_contact
      1       2023-01-13      died   2023-01-21               <NA>              <NA>
      2             <NA> recovered         <NA>         2022-12-29        2023-01-03
      3       2023-01-08      died   2023-01-15         2022-12-28        2023-01-01
      4             <NA> recovered         <NA>         2022-12-28        2023-01-04
      5             <NA> recovered         <NA>         2022-12-31        2023-01-04
      6             <NA> recovered         <NA>         2022-12-31        2023-01-06
      7             <NA> recovered         <NA>         2023-01-02        2023-01-07
      8             <NA> recovered         <NA>         2023-01-03        2023-01-07
      9             <NA> recovered         <NA>         2023-01-03        2023-01-11
      10            <NA> recovered         <NA>         2023-01-04        2023-01-09
      11            <NA> recovered         <NA>         2023-01-09        2023-01-17
      12            <NA> recovered         <NA>         2023-01-07        2023-01-14
      13            <NA> recovered         <NA>         2023-01-07        2023-01-17
      14            <NA> recovered         <NA>         2023-01-08        2023-01-15
      15            <NA> recovered         <NA>         2023-01-09        2023-01-16
      16      2023-01-27      died   2023-02-09         2023-01-08        2023-01-14
      17            <NA> recovered         <NA>         2023-01-07        2023-01-13
      18            <NA>      died   2023-02-07         2023-01-10        2023-01-16
      19            <NA> recovered         <NA>         2023-01-12        2023-01-15
      20      2023-01-22      died   2023-01-23         2023-01-12        2023-01-18
      21            <NA> recovered         <NA>         2023-01-16        2023-01-21
      22            <NA> recovered         <NA>         2023-01-19        2023-01-23
      23            <NA> recovered         <NA>         2023-01-18        2023-01-24
      24            <NA> recovered         <NA>         2023-01-17        2023-01-21
      25            <NA> recovered         <NA>         2023-01-18        2023-01-21
      26            <NA> recovered         <NA>         2023-01-19        2023-01-25
      27            <NA> recovered         <NA>         2023-01-23        2023-01-28
      28            <NA> recovered         <NA>         2023-01-20        2023-01-28
      29      2023-02-01      died   2023-02-12         2023-01-22        2023-01-25
      30            <NA> recovered         <NA>         2023-01-20        2023-01-27
      31            <NA> recovered         <NA>         2023-01-23        2023-01-29
      32      2023-01-29 recovered         <NA>         2023-01-17        2023-01-24
      33            <NA> recovered         <NA>         2023-01-21        2023-01-26
      34            <NA> recovered         <NA>         2023-01-17        2023-01-22
      35            <NA> recovered         <NA>         2023-01-15        2023-01-22
      36      2023-02-04 recovered         <NA>         2023-01-20        2023-01-23
      37            <NA> recovered         <NA>         2023-01-27        2023-01-31
      38            <NA> recovered         <NA>         2023-01-26        2023-02-01
      39            <NA> recovered         <NA>         2023-01-28        2023-02-02
      40            <NA> recovered         <NA>         2023-01-27        2023-01-30
      41      2023-02-02 recovered         <NA>         2023-01-19        2023-01-28
      42            <NA> recovered         <NA>         2023-01-25        2023-02-02
      43            <NA> recovered         <NA>         2023-01-26        2023-02-01
      44      2023-02-06 recovered         <NA>         2023-01-26        2023-01-30
      45            <NA> recovered         <NA>         2023-01-31        2023-02-02
      46      2023-02-10      died   2023-02-22         2023-01-30        2023-02-05
      47            <NA> recovered         <NA>         2023-01-28        2023-01-30
      48      2023-02-09 recovered         <NA>         2023-01-24        2023-02-03
      49            <NA> recovered         <NA>         2023-01-28        2023-02-05
      50            <NA> recovered         <NA>         2023-02-03        2023-02-05
      51            <NA> recovered         <NA>         2023-01-31        2023-02-04
      52            <NA> recovered         <NA>         2023-01-27        2023-02-02
      53            <NA> recovered         <NA>         2023-01-28        2023-02-09
      54            <NA> recovered         <NA>         2023-01-31        2023-02-10
      55            <NA> recovered         <NA>         2023-01-31        2023-02-05
      56            <NA>      died   2023-02-21         2023-02-04        2023-02-08
      57            <NA>      died   2023-02-27         2023-02-10        2023-02-17
      58            <NA> recovered         <NA>         2023-02-08        2023-02-13
      59            <NA> recovered         <NA>         2023-02-10        2023-02-12
      60      2023-02-21      died   2023-02-28         2023-02-10        2023-02-16
      61            <NA>      died   2023-03-10         2023-02-24        2023-03-01
      62      2023-03-14      died   2023-03-27         2023-02-21        2023-02-26
      63      2023-03-02      died   2023-03-16         2023-02-20        2023-02-26
      64            <NA> recovered         <NA>         2023-02-22        2023-02-26
      65            <NA> recovered         <NA>         2023-03-01        2023-03-07
      66      2023-03-13      died   2023-03-14         2023-03-01        2023-03-04
      67            <NA> recovered         <NA>         2023-02-27        2023-03-13
      68            <NA> recovered         <NA>         2023-03-09        2023-03-11
      69            <NA> recovered         <NA>         2023-03-09        2023-03-13
      70      2023-03-30 recovered         <NA>         2023-03-15        2023-03-20
      71            <NA>      died   2023-04-02         2023-03-16        2023-03-23
      72            <NA> recovered         <NA>         2023-03-08        2023-03-15
      73      2023-03-16      died   2023-03-27         2023-03-07        2023-03-14
      74            <NA> recovered         <NA>         2023-03-09        2023-03-11
      75      2023-03-15 recovered         <NA>         2023-03-03        2023-03-13
      76            <NA> recovered         <NA>         2023-03-11        2023-03-22
      77            <NA> recovered         <NA>         2023-03-14        2023-03-19
      78            <NA> recovered         <NA>         2023-03-14        2023-03-16
      79            <NA> recovered         <NA>         2023-03-09        2023-03-18
      80            <NA> recovered         <NA>         2023-03-08        2023-03-16
      81            <NA> recovered         <NA>         2023-03-11        2023-03-18
      82            <NA> recovered         <NA>         2023-03-10        2023-03-18
      83            <NA> recovered         <NA>         2023-03-14        2023-03-19
      84            <NA> recovered         <NA>         2023-03-20        2023-03-26
      85      2023-03-27      died   2023-03-30         2023-03-15        2023-03-19
      86            <NA> recovered         <NA>         2023-03-13        2023-03-20
      87            <NA> recovered         <NA>         2023-03-14        2023-03-16
      88            <NA> recovered         <NA>         2023-03-13        2023-03-15
      89      2023-04-01      died   2023-04-09         2023-03-24        2023-03-28
      90            <NA> recovered         <NA>         2023-03-20        2023-03-27
      91            <NA> recovered         <NA>         2023-03-18        2023-03-23
      92            <NA> recovered         <NA>         2023-03-17        2023-03-23
      93            <NA> recovered         <NA>         2023-03-12        2023-03-21
      94      2023-04-05      died   2023-04-12         2023-03-23        2023-03-28
      95            <NA> recovered         <NA>         2023-03-22        2023-03-30
      96      2023-03-31      died   2023-04-15         2023-03-24        2023-03-27
      97            <NA> recovered         <NA>         2023-03-22        2023-03-27
      98            <NA> recovered         <NA>         2023-03-23        2023-04-01
      99      2023-04-14 recovered         <NA>         2023-04-03        2023-04-06
      100           <NA> recovered         <NA>         2023-03-31        2023-04-07
      101           <NA> recovered         <NA>         2023-04-01        2023-04-04
      102           <NA>      died   2023-04-11         2023-03-26        2023-04-02
      103     2023-04-08      died   2023-04-15         2023-03-24        2023-04-02
      104           <NA> recovered         <NA>         2023-03-24        2023-04-01
      105           <NA> recovered         <NA>         2023-03-26        2023-04-03
      106     2023-04-10 recovered         <NA>         2023-03-29        2023-03-31
      107           <NA> recovered         <NA>         2023-04-04        2023-04-10
      108           <NA> recovered         <NA>         2023-04-02        2023-04-05
      109           <NA> recovered         <NA>         2023-03-30        2023-04-07
      110           <NA> recovered         <NA>         2023-03-31        2023-04-03
      111     2023-04-14 recovered         <NA>         2023-04-02        2023-04-08
      112           <NA> recovered         <NA>         2023-03-31        2023-04-04
      113           <NA> recovered         <NA>         2023-04-09        2023-04-12
      114     2023-04-15      died   2023-04-21         2023-04-06        2023-04-11
      115           <NA> recovered         <NA>         2023-04-01        2023-04-10
      116           <NA> recovered         <NA>         2023-04-02        2023-04-06
      117           <NA> recovered         <NA>         2023-04-03        2023-04-09
      118           <NA> recovered         <NA>         2023-04-06        2023-04-11
      119     2023-04-15      died   2023-04-21         2023-04-03        2023-04-11
      120           <NA> recovered         <NA>         2023-04-09        2023-04-14
      121           <NA>      died   2023-04-23         2023-03-30        2023-04-08
      122           <NA> recovered         <NA>         2023-04-02        2023-04-15
      123           <NA> recovered         <NA>         2023-04-08        2023-04-12
      124           <NA> recovered         <NA>         2023-04-09        2023-04-17
      125           <NA> recovered         <NA>         2023-04-09        2023-04-11
      126           <NA> recovered         <NA>         2023-04-08        2023-04-13
      127           <NA> recovered         <NA>         2023-04-06        2023-04-14
      128           <NA> recovered         <NA>         2023-04-11        2023-04-15
      129           <NA> recovered         <NA>         2023-04-13        2023-04-19
      130           <NA> recovered         <NA>         2023-04-11        2023-04-20
      131           <NA> recovered         <NA>         2023-04-13        2023-04-21
      132           <NA> recovered         <NA>         2023-04-10        2023-04-20
      133     2023-05-01      died   2023-05-09         2023-04-14        2023-04-22
      134           <NA> recovered         <NA>         2023-04-15        2023-04-26
      135           <NA> recovered         <NA>         2023-04-19        2023-04-27
      136     2023-04-24      died   2023-04-28         2023-04-20        2023-04-23
      137           <NA> recovered         <NA>         2023-04-11        2023-04-14
      138           <NA> recovered         <NA>         2023-04-23        2023-04-29
      139           <NA> recovered         <NA>         2023-04-15        2023-04-24
      140     2023-05-02 recovered         <NA>         2023-04-16        2023-04-24
      141           <NA> recovered         <NA>         2023-04-16        2023-04-22
      142     2023-05-07 recovered         <NA>         2023-04-28        2023-05-01
      143           <NA> recovered         <NA>         2023-04-23        2023-05-01
      144           <NA> recovered         <NA>         2023-04-19        2023-04-23
      145           <NA> recovered         <NA>         2023-04-16        2023-04-22
      146           <NA> recovered         <NA>         2023-04-29        2023-05-09
      147           <NA> recovered         <NA>         2023-05-03        2023-05-07
      148           <NA> recovered         <NA>         2023-04-25        2023-05-05
      149           <NA> recovered         <NA>         2023-04-19        2023-05-02
      150           <NA> recovered         <NA>         2023-04-18        2023-04-25
      151           <NA>      died   2023-05-25         2023-05-01        2023-05-07
      152     2023-05-13 recovered         <NA>         2023-04-25        2023-05-06
      153           <NA> recovered         <NA>         2023-04-19        2023-04-26
      154           <NA> recovered         <NA>         2023-04-20        2023-04-27
      155           <NA> recovered         <NA>         2023-04-25        2023-04-30
      156           <NA> recovered         <NA>         2023-05-05        2023-05-10
      157           <NA> recovered         <NA>         2023-04-22        2023-04-28
      158           <NA> recovered         <NA>         2023-04-27        2023-05-03
          ct_value
      1       24.8
      2         NA
      3         NA
      4         NA
      5       21.2
      6         NA
      7       25.3
      8       24.7
      9       22.8
      10        NA
      11        NA
      12        NA
      13      26.0
      14        NA
      15        NA
      16      30.1
      17        NA
      18      22.3
      19        NA
      20      24.2
      21        NA
      22      23.6
      23        NA
      24      24.3
      25      23.9
      26      22.8
      27      26.3
      28        NA
      29      23.9
      30        NA
      31        NA
      32      26.1
      33        NA
      34      24.9
      35      23.6
      36        NA
      37      25.2
      38        NA
      39        NA
      40        NA
      41      27.1
      42        NA
      43      21.7
      44      29.1
      45      21.5
      46        NA
      47      24.2
      48        NA
      49        NA
      50        NA
      51      25.3
      52      25.0
      53        NA
      54        NA
      55      21.6
      56      22.5
      57        NA
      58        NA
      59        NA
      60      24.5
      61        NA
      62        NA
      63        NA
      64        NA
      65      25.8
      66      24.1
      67        NA
      68      27.2
      69        NA
      70      26.4
      71      21.7
      72      23.2
      73        NA
      74      26.1
      75        NA
      76        NA
      77        NA
      78        NA
      79        NA
      80      25.4
      81      25.4
      82        NA
      83        NA
      84      24.8
      85      27.9
      86        NA
      87      24.1
      88      28.6
      89      25.9
      90      25.6
      91      22.7
      92        NA
      93      24.3
      94      30.0
      95        NA
      96      24.0
      97        NA
      98        NA
      99      24.6
      100     22.1
      101       NA
      102       NA
      103       NA
      104     23.8
      105     22.3
      106     27.1
      107     27.6
      108     25.5
      109     25.1
      110     22.5
      111       NA
      112       NA
      113       NA
      114     28.6
      115     24.7
      116       NA
      117       NA
      118     23.6
      119       NA
      120     26.1
      121     28.7
      122     25.5
      123     23.0
      124       NA
      125     24.5
      126     28.9
      127     21.3
      128       NA
      129     25.4
      130     27.4
      131     26.0
      132       NA
      133     24.9
      134     26.0
      135       NA
      136     27.2
      137       NA
      138       NA
      139       NA
      140       NA
      141       NA
      142     24.8
      143     25.3
      144     29.6
      145     28.4
      146     24.5
      147     27.1
      148       NA
      149     23.2
      150     25.4
      151     25.7
      152     27.3
      153       NA
      154       NA
      155       NA
      156       NA
      157       NA
      158     27.8
      
      $contacts
                             from                        to age sex
      1          Michael Mckenney               Jordan Reed  89   m
      2          Michael Mckenney         Bassil el-Hossain   3   m
      3               Jordan Reed              Ashley Perez  85   f
      4               Jordan Reed          Joseph Dickerson  28   m
      5         Bassil el-Hossain       Naqiyya el-Ghaffari  13   f
      6         Bassil el-Hossain           Sergio Sandoval  84   m
      7         Bassil el-Hossain            Danielle Muchi  17   f
      8          Joseph Dickerson  Cheyanne Delatorre-Lopez  58   f
      9       Naqiyya el-Ghaffari         Benjamin Sendejas  24   m
      10      Naqiyya el-Ghaffari                Aimee Snow  33   f
      11      Naqiyya el-Ghaffari             Alexis Zamora  88   f
      12      Naqiyya el-Ghaffari             Israel Chacon   4   m
      13          Sergio Sandoval                Dylan Bell  62   m
      14               Aimee Snow                  Amy Burd  49   f
      15               Aimee Snow        Christopher Mulder   4   m
      16               Aimee Snow               Evan Gibson  88   m
      17            Alexis Zamora          Kiyontus Gallion  73   m
      18               Dylan Bell         Mishaari al-Kalil  33   m
      19               Dylan Bell            Juanita Neloms  46   f
      20               Dylan Bell          Suhail el-Younes  84   m
      21               Dylan Bell        Christine Shrestha  28   f
      22         Kiyontus Gallion               Berwo Barry  23   f
      23        Mishaari al-Kalil              Jenae Cromer  45   f
      24        Mishaari al-Kalil            Dashawn Thrift  62   m
      25        Mishaari al-Kalil          Maazina al-Habib  18   f
      26        Mishaari al-Kalil       Ana Aviles Montalvo  23   f
      27       Christine Shrestha               Mai Jing Oh   8   f
      28       Christine Shrestha                Andrew Bly  40   m
      29       Christine Shrestha             Charlee Oster  71   f
      30       Christine Shrestha              Alex Kumagai   5   m
      31             Jenae Cromer         Kameela al-Habeeb  90   f
      32      Ana Aviles Montalvo          Zumruda al-Nawaz   8   f
      33      Ana Aviles Montalvo          Brittany Johnson  60   f
      34               Andrew Bly            Alexander Jack  43   m
      35               Andrew Bly               Emily Tobin  70   f
      36               Andrew Bly         Breyanna Robinson  33   f
      37               Andrew Bly             Nuzha el-Amin  74   f
      38               Andrew Bly              Deshawn Ryan  68   m
      39               Andrew Bly            Elijah Cooksey  60   m
      40            Charlee Oster             Ramla al-Zaki  66   f
      41            Charlee Oster              Neelish Abel  63   m
      42            Charlee Oster                Nhi Javaid  10   f
      43             Alex Kumagai             Darian Madera  58   m
      44             Alex Kumagai           Masood el-Zaman  60   m
      45         Brittany Johnson                 Laura Tan  65   f
      46           Alexander Jack                Tre Elfvin  15   f
      47           Alexander Jack                 Maiya Chu  80   f
      48             Deshawn Ryan           Mariah Williams  87   f
      49             Deshawn Ryan         Jameela al-Arshad  52   f
      50            Ramla al-Zaki     Jaylynn Kelly-Corichi  52   f
      51            Ramla al-Zaki           Sameeha el-Ally  44   f
      52            Ramla al-Zaki           Sultan al-Qasim  41   m
      53            Ramla al-Zaki              Adam Puentes  41   m
      54            Darian Madera            Rajaa al-Hoque  77   m
      55            Darian Madera            Jaliya Hatcher  34   f
      56            Darian Madera         Nimesha Pickering  53   f
      57          Masood el-Zaman       Isaac Herrera-Vigil  53   m
      58          Masood el-Zaman             Saleet el-Aly  67   m
      59          Masood el-Zaman            Crystal Garcia   2   f
      60               Tre Elfvin             Aiyana Ortega  43   f
      61        Jameela al-Arshad          Hafsa al-Massoud  34   f
      62        Jameela al-Arshad            Subhi al-Amara  22   m
      63        Jameela al-Arshad          Jasmine Phillips  61   f
      64    Jaylynn Kelly-Corichi           Suhaib el-Zafar  34   m
      65    Jaylynn Kelly-Corichi         Jonni Lynn Seiler  89   f
      66             Adam Puentes              David Ponzio  24   m
      67           Jaliya Hatcher       Siddeeqi al-Shabazz  40   m
      68           Jaliya Hatcher            Mariah Roberts  16   f
      69      Isaac Herrera-Vigil                Cole Manis  25   m
      70      Isaac Herrera-Vigil           Jeremiah Flores  60   m
      71            Saleet el-Aly               Jose Marley  45   m
      72           Crystal Garcia           Savanna Baldwin  56   f
      73           Crystal Garcia                  Ishan Vu   7   m
      74           Subhi al-Amara          Qamraaa al-Rahim  10   f
      75         Jasmine Phillips          Alexander Thomas  55   m
      76         Jasmine Phillips         Fikri el-Mohammed  31   m
      77         Jasmine Phillips             Claire Conley  62   f
      78         Jasmine Phillips        Ramalaan al-Farooq  53   m
      79        Jonni Lynn Seiler        Mu'taz el-Shehadeh  21   m
      80        Jonni Lynn Seiler            Itzel Sandoval  66   f
      81        Jonni Lynn Seiler               Luis Silvas  82   m
      82        Jonni Lynn Seiler           Danielle Rhoads  15   f
      83          Jeremiah Flores     Arnold Garcia-Barrios  37   m
      84          Savanna Baldwin            Zachary Murphy  18   m
      85          Savanna Baldwin                Nelly Sena  36   f
      86          Savanna Baldwin              Derek Nakata  45   m
      87        Fikri el-Mohammed               Jalen Palma  63   m
      88        Fikri el-Mohammed          Mondray Hamilton  72   m
      89            Claire Conley           Jennifer Nguyen  12   f
      90            Claire Conley          Vincent Williams  71   m
      91       Mu'taz el-Shehadeh            Dong-Keun Tran  11   m
      92       Mu'taz el-Shehadeh            Shukri al-Kaba  51   m
      93       Mu'taz el-Shehadeh            Albert Sanchez  60   m
      94       Mu'taz el-Shehadeh                    Te Fox   8   m
      95       Mu'taz el-Shehadeh          Nafeesa al-Zaher   8   f
      96           Zachary Murphy             Kelly Fuentes  41   f
      97              Jalen Palma                  Mia Long  21   f
      98         Mondray Hamilton                  Sir Ward  28   m
      99         Mondray Hamilton          Deavyona Wilkins  14   f
      100        Mondray Hamilton         Nawwaara el-Pasha  68   f
      101        Mondray Hamilton      Whitney Vathanavarin  16   f
      102        Mondray Hamilton             Brianni Smith  20   f
      103        Mondray Hamilton                 Alex Heng  53   m
      104        Mondray Hamilton             Morgan Gaiser  19   f
      105          Shukri al-Kaba             Alexander Hsu   8   m
      106          Shukri al-Kaba     Tuvshinbayar Malhotra  25   m
      107          Shukri al-Kaba           Michael Powless  79   m
      108          Shukri al-Kaba            Anthony Turner  70   m
      109          Shukri al-Kaba             Angel Cachola  56   m
      110                Mia Long             Julian Ibarra  76   m
      111       Nawwaara el-Pasha          Alisha O'Donnell  89   f
      112       Nawwaara el-Pasha              Pedro Parker  57   m
      113         Michael Powless                Joseph Tan  22   m
      114           Julian Ibarra          Diksha Grossaint  34   f
      115            Pedro Parker              Ashley Mcgee  65   f
      116            Pedro Parker               Medhavi Ouk  61   f
      117            Pedro Parker            Nakrista Jiron  61   f
      118            Pedro Parker            Mori Phanekham  33   m
      119              Joseph Tan             Tucker Welter  56   m
      120              Joseph Tan               Jaeson Ngan  43   m
      121            Ashley Mcgee    Abdul Ghafoor el-Sarah  21   m
      122            Ashley Mcgee             Yutitham Tong  56   m
      123          Mori Phanekham           Kristian Castro  62   m
      124          Mori Phanekham        Caroline Andreatta   6   f
      125          Mori Phanekham       Ghaaliya al-Shaheed  45   f
      126           Tucker Welter     Nadheera el-Mohiuddin  65   f
      127           Tucker Welter              Monica Floyd   3   f
      128  Abdul Ghafoor el-Sarah                Taylor Kim   9   f
      129  Abdul Ghafoor el-Sarah            Matthew Bailey  67   m
      130  Abdul Ghafoor el-Sarah   Amanda Runningbear-Paul  67   f
      131           Yutitham Tong          Raashid al-Amiri  11   m
      132           Yutitham Tong     Carlo Ceazar Santiago  50   m
      133      Caroline Andreatta          Nichole Williams  50   f
      134     Ghaaliya al-Shaheed          Taamir al-Rahimi   7   m
      135          Matthew Bailey              Sierra Smith  54   f
      136          Matthew Bailey             Utkarsh Ahmad  76   m
      137 Amanda Runningbear-Paul         Caroline Sturgeon  21   f
      138 Amanda Runningbear-Paul          Marcela Thompson   1   f
      139   Carlo Ceazar Santiago          Carmelita Chacon  52   f
      140   Carlo Ceazar Santiago          Brandon Colligan  30   m
      141   Carlo Ceazar Santiago             Alexis Cooper  76   f
      142   Carlo Ceazar Santiago            Faaris al-Imam  75   m
      143   Carlo Ceazar Santiago               Gloria Cano  81   f
      144       Caroline Sturgeon            Nawaar el-Reza  11   m
      145       Caroline Sturgeon           Saleet al-Murad  24   m
      146        Marcela Thompson        Rhiannon Caramillo  75   f
      147        Marcela Thompson           Isabella Huizar  13   f
      148        Marcela Thompson        Joshua Stadelbauer  30   m
      149        Marcela Thompson           Shelby Zaragoza  89   f
      150           Alexis Cooper            James Reichman  75   m
      151          Faaris al-Imam           Deisha Freeland  29   f
      152          Nawaar el-Reza           Chandel Beckner  31   f
      153          Nawaar el-Reza              Ethan Mosher  77   m
      154          Nawaar el-Reza        Shuaib al-Siddique  74   m
      155         Saleet al-Murad           Hissa al-Hammad  75   f
      156      Rhiannon Caramillo              Joshua Lopez  87   m
      157      Rhiannon Caramillo          Jamaal al-Salame  79   m
      158      Rhiannon Caramillo              Renae Beeton  40   f
      159      Rhiannon Caramillo            Bertha Alvarez  77   f
      160      Rhiannon Caramillo      Mu,Aawiya al-Hussein  10   m
      161         Shelby Zaragoza            Rashele Duling  56   f
      162         Chandel Beckner           Khongmong Huang  78   m
      163         Chandel Beckner             Lauren Batson  27   f
      164            Ethan Mosher    Ernesto Gomez-Buchanan   1   m
      165      Shuaib al-Siddique          Madelyn Mcmullen  15   f
      166            Joshua Lopez           Lauren Williams  81   f
      167            Joshua Lopez          David Feuerstein  50   m
      168        Jamaal al-Salame            Sally Mcdonald  53   f
      169        Jamaal al-Salame            Alicia Reichal  75   f
      170        Jamaal al-Salame             Octavia Yorks  55   f
      171            Renae Beeton               Shane Shahi   4   m
      172         Khongmong Huang           Deviny Armbrust   0   f
      173         Khongmong Huang          Treyvon Scurlock  43   m
      174        Madelyn Mcmullen               Daijia Bean  75   f
      175           Octavia Yorks              Shannon Osse   2   f
      176           Octavia Yorks            Taaj al-Shaker  14   m
      177           Octavia Yorks            Tucker Sorrell  18   m
      178             Shane Shahi      Jennifer Vargas Pena  75   f
      179        Treyvon Scurlock        Emmanuel Rodriguez  11   m
      180        Treyvon Scurlock          Cassandra Nguyen  42   f
      181        Treyvon Scurlock            Madison Finken   8   f
      182        Treyvon Scurlock     Desmond Rangel Mendez  89   m
      183             Daijia Bean                Yuvorn Cha   6   m
      184             Daijia Bean              Renee Norman  14   f
      185          Taaj al-Shaker             Yusri al-Ozer  53   m
      186          Taaj al-Shaker       Sidqi al-Salahuddin  63   m
      187          Taaj al-Shaker             Afaaf al-Azzi  20   f
      188          Taaj al-Shaker          Habeeba el-Ahmad  36   f
      189          Taaj al-Shaker          Aliyya el-Yassin  34   f
      190          Tucker Sorrell          Mastoor el-Salem  69   m
      191          Tucker Sorrell             Trever Morgan  69   m
      192          Tucker Sorrell        Muhaajir al-Akbari  58   m
      193          Tucker Sorrell          Sapphire Etsitty  76   f
      194          Tucker Sorrell            Kara Tollivoro  74   f
      195          Madison Finken            Nawfa el-Anwar  83   f
      196          Madison Finken         Marissa Scharnell  17   f
      197           Yusri al-Ozer          Jumail al-Firman  78   m
      198           Yusri al-Ozer            Orilea Montoya  13   f
      199           Yusri al-Ozer            Unique Johnson  48   f
      200           Yusri al-Ozer           Najlaa al-Salam  55   f
      201        Habeeba el-Ahmad              Janie Medina  75   f
      202        Habeeba el-Ahmad                James Hahs  40   m
      203        Habeeba el-Ahmad             Janay Hopkins  15   f
      204          Kara Tollivoro              Jericho Huff   2   m
      205          Kara Tollivoro               Megan Bison  28   f
      206          Kara Tollivoro  Edward Valencia Anchondo  88   m
      207          Kara Tollivoro          Sakeena al-Abdoo  23   f
      208          Nawfa el-Anwar               Cody Powell  30   m
      209          Nawfa el-Anwar            Nadia Jones Jr  38   f
      210          Nawfa el-Anwar                  Kevin La  31   m
      211       Marissa Scharnell            Maritza Tinoco   8   f
      212          Orilea Montoya                Ryan Stott  81   m
      213          Unique Johnson           Thomas Maryland  38   m
      214         Najlaa al-Salam              Autumn Smith  11   f
      215         Najlaa al-Salam           Dearee Trammell  53   m
      216            Janie Medina           Mansoor al-Sala  67   m
      217            Janie Medina          Shahla al-Jaffer  72   f
      218            Janie Medina          Otoniel Mitchell  84   m
      219            Janie Medina           Connor Videtzky  51   m
      220            Jericho Huff          Cornelius Curtis   2   m
      221            Jericho Huff              Marco Molina  21   m
      222             Cody Powell           Brianni Harding   4   f
      223             Cody Powell        Raadiya el-Chahine  65   f
      224          Nadia Jones Jr             Yesenia Mohar  67   f
      225          Nadia Jones Jr           Briana Robinson  37   f
      226          Nadia Jones Jr           Nizaam el-Aslam  56   m
      227                Kevin La              Kiera Watson  47   f
      228              Ryan Stott                 Yusuf San  74   m
      229        Otoniel Mitchell          Micah Goodfellow   7   m
      230        Otoniel Mitchell                  Elyse Ye  27   f
      231        Cornelius Curtis           Orville Labadie  20   m
      232        Cornelius Curtis      Safarha Peters-Maloy   1   f
      233      Raadiya el-Chahine            Rosemary Lange  83   f
      234      Raadiya el-Chahine          Austin Martzloff  51   m
      235      Raadiya el-Chahine            Savannah Begay  57   f
      236         Briana Robinson Russell Montelongo Declay  28   m
      237               Yusuf San             Rida el-Karam   6   m
      238               Yusuf San        Christian Espinosa  29   m
      239         Orville Labadie            Qaaid al-Saidi  10   m
      240         Orville Labadie             Alonna Pruitt  70   f
      241    Safarha Peters-Maloy                 Sarah Vue  49   f
      242    Safarha Peters-Maloy             Lizbeth Silva  76   f
      243    Safarha Peters-Maloy          Munsif al-Shakir  42   m
      244    Safarha Peters-Maloy               Chasity Lor  90   f
      245    Safarha Peters-Maloy             Trevor Arnick  18   m
      246    Safarha Peters-Maloy                Kloe Cohen  39   f
      247    Safarha Peters-Maloy               Sarah Avila  48   f
      248    Safarha Peters-Maloy           Deliah Griffith  10   f
      249          Savannah Begay          Danielle Vannice  14   f
      250          Savannah Begay    Abdur Rasheed el-Safar  60   m
      251          Savannah Begay    Abdul Kareem al-Semaan  45   m
      252          Savannah Begay            Daniel Johnson  68   m
      253           Rida el-Karam              Amelia Diego  68   f
      254           Rida el-Karam        Shabeeba al-Jafari  37   f
      255          Qaaid al-Saidi               Cam Tu Tran  27   f
      256          Qaaid al-Saidi Alexander Macias-Monarrez  81   m
      257           Lizbeth Silva           Craynisha Myers  44   f
      258             Chasity Lor               Samuel Khan  46   m
      259        Danielle Vannice             Amanda Mcadoo  18   f
      260        Danielle Vannice          Billye Ouellette  84   f
      261  Abdur Rasheed el-Safar         Alexander Goldman  23   m
      262  Abdur Rasheed el-Safar            Keeman Lathrop  45   m
      263  Abdul Kareem al-Semaan           Jameel Marchman  70   m
      264  Abdul Kareem al-Semaan              Bianca Vigil  68   f
      265          Daniel Johnson            Fikra el-Bilal   3   f
      266          Daniel Johnson        Nadheera al-Farrah  30   f
      267          Daniel Johnson               Lasha Coles  17   f
      268            Amelia Diego                Jeremy Roy  15   m
      269            Amelia Diego              Tanya Braden  52   f
      270      Shabeeba al-Jafari           Manaara el-Saba  61   f
      271      Shabeeba al-Jafari              Ronnie Woods  86   m
      272         Craynisha Myers               Kailey Dodd  27   f
      273        Billye Ouellette         Julisa Santa Cruz  41   f
      274        Billye Ouellette           Laaiqa el-Azizi  41   f
      275       Alexander Goldman                Jay Naylor  83   m
      276       Alexander Goldman       Alejandra Dalrymple  28   f
      277         Jameel Marchman             Karah Waddles  46   f
      278      Nadheera al-Farrah             Henry Henzler  13   m
      279      Nadheera al-Farrah           Frankie Purdham  47   f
      280      Nadheera al-Farrah       Bao-Tran Thammarath  88   f
      281             Lasha Coles              Renee Dotson  38   f
      282             Lasha Coles             Abeer el-Kazi  16   f
      283     Alejandra Dalrymple             Brandon Baker  19   m
      284           Karah Waddles            Payton Baldwin  60   f
      285           Henry Henzler           Bryanna Winkler   5   f
      286           Henry Henzler       Katherine Armstrong  27   f
      287           Henry Henzler             Collin Millan  82   m
      288            Renee Dotson              Joshua Zheng  67   m
      289            Renee Dotson           Sandra Redhorse  46   f
      290            Renee Dotson            Gina Rodriquez  72   f
      291            Renee Dotson          Haakima el-Kanan  23   f
      292           Brandon Baker             Weston Miller  41   m
      293           Brandon Baker            Azza el-Husain  70   f
      294          Payton Baldwin            Cairra Conners   8   m
      295          Payton Baldwin Ummu Kulthoom al-Ghaffari  77   f
      296          Gina Rodriquez             Joshua Campos  23   m
      297          Gina Rodriquez                Mreenal Vu  60   f
      298          Gina Rodriquez        Sharaf el-Abdallah  48   m
      299        Haakima el-Kanan        Christian Vikingur  52   m
      300        Haakima el-Kanan       Esmeralda Alexander  62   f
      301        Haakima el-Kanan                Shawn Reid  28   m
      302           Weston Miller            Kaylee Herrera  75   f
      303           Weston Miller        Zuhaira al-Mohamed  68   f
      304           Weston Miller          Grant Stockinger  62   m
      305              Mreenal Vu          Mathurin Powells  49   m
      306              Mreenal Vu             Luna Mcmaster  57   f
      307              Mreenal Vu          Yeun Jung Suetos  87   f
      308     Esmeralda Alexander      Mark Martinez-Deleon   6   m
      309     Esmeralda Alexander           Fidda el-Satter  50   f
      310     Esmeralda Alexander               Jane Quilon  46   f
      311     Esmeralda Alexander  Abdul Ghafoor al-Noorani  44   m
      312              Shawn Reid           Farhat al-Masih  82   f
      313      Zuhaira al-Mohamed           Markese Mcgrier  29   m
      314      Zuhaira al-Mohamed             Eliora Wilson  40   f
      315      Zuhaira al-Mohamed              Tyler Herman  14   m
      316           Luna Mcmaster           Corina Gallegos  26   f
      317         Fidda el-Satter           Razeen el-Javed  87   m
      318         Fidda el-Satter          Trevor Mcclaskey  73   m
      319             Jane Quilon          Alexandra Gaytan   0   f
      320         Farhat al-Masih             Yahya el-Azad  83   m
      321         Farhat al-Masih          Nabeel al-Badour  78   m
      322         Farhat al-Masih             Amanda Torres  53   f
      323            Tyler Herman           Jez-Mas Wallace  23   m
      324            Tyler Herman     Kamaaluddeen al-Shaer  36   m
      325        Alexandra Gaytan              Ashley Vigil   2   f
      326            Ashley Vigil             Antonio Jiron  47   m
          date_first_contact date_last_contact was_case           status
      1           2022-12-29        2023-01-03     TRUE             case
      2           2022-12-28        2023-01-01     TRUE             case
      3           2022-12-26        2023-01-02    FALSE   under_followup
      4           2022-12-28        2023-01-04     TRUE             case
      5           2022-12-31        2023-01-04     TRUE             case
      6           2022-12-31        2023-01-06     TRUE             case
      7           2023-01-01        2023-01-02    FALSE   under_followup
      8           2023-01-03        2023-01-09    FALSE          unknown
      9           2023-01-02        2023-01-07     TRUE             case
      10          2023-01-03        2023-01-07     TRUE             case
      11          2023-01-03        2023-01-11     TRUE             case
      12          2022-12-30        2023-01-08    FALSE lost_to_followup
      13          2023-01-04        2023-01-09     TRUE             case
      14          2023-01-09        2023-01-17    FALSE   under_followup
      15          2023-01-07        2023-01-16    FALSE   under_followup
      16          2023-01-11        2023-01-13    FALSE lost_to_followup
      17          2023-01-09        2023-01-17     TRUE             case
      18          2023-01-07        2023-01-14     TRUE             case
      19          2023-01-08        2023-01-13    FALSE   under_followup
      20          2023-01-09        2023-01-15    FALSE   under_followup
      21          2023-01-07        2023-01-17     TRUE             case
      22          2023-01-12        2023-01-16    FALSE   under_followup
      23          2023-01-08        2023-01-15     TRUE             case
      24          2023-01-11        2023-01-14    FALSE lost_to_followup
      25          2023-01-08        2023-01-13    FALSE   under_followup
      26          2023-01-09        2023-01-16     TRUE             case
      27          2023-01-07        2023-01-15    FALSE          unknown
      28          2023-01-08        2023-01-14     TRUE             case
      29          2023-01-07        2023-01-13     TRUE             case
      30          2023-01-10        2023-01-16     TRUE             case
      31          2023-01-10        2023-01-17    FALSE   under_followup
      32          2023-01-12        2023-01-15     TRUE             case
      33          2023-01-12        2023-01-18     TRUE             case
      34          2023-01-16        2023-01-21     TRUE             case
      35          2023-01-20        2023-01-23    FALSE lost_to_followup
      36          2023-01-19        2023-01-25    FALSE          unknown
      37          2023-01-19        2023-01-23     TRUE             case
      38          2023-01-18        2023-01-24     TRUE             case
      39          2023-01-20        2023-01-26    FALSE   under_followup
      40          2023-01-17        2023-01-21     TRUE             case
      41          2023-01-15        2023-01-20    FALSE lost_to_followup
      42          2023-01-14        2023-01-21    FALSE   under_followup
      43          2023-01-18        2023-01-21     TRUE             case
      44          2023-01-19        2023-01-25     TRUE             case
      45          2023-01-12        2023-01-18    FALSE   under_followup
      46          2023-01-23        2023-01-28     TRUE             case
      47          2023-01-26        2023-01-29    FALSE   under_followup
      48          2023-01-19        2023-01-28    FALSE   under_followup
      49          2023-01-20        2023-01-28     TRUE             case
      50          2023-01-22        2023-01-25     TRUE             case
      51          2023-01-22        2023-01-26    FALSE   under_followup
      52          2023-01-20        2023-01-27     TRUE             case
      53          2023-01-23        2023-01-29     TRUE             case
      54          2023-01-17        2023-01-24     TRUE             case
      55          2023-01-21        2023-01-26     TRUE             case
      56          2023-01-18        2023-01-26    FALSE   under_followup
      57          2023-01-17        2023-01-22     TRUE             case
      58          2023-01-15        2023-01-22     TRUE             case
      59          2023-01-20        2023-01-23     TRUE             case
      60          2023-01-28        2023-01-30    FALSE   under_followup
      61          2023-01-26        2023-02-02    FALSE   under_followup
      62          2023-01-27        2023-01-31     TRUE             case
      63          2023-01-26        2023-02-01     TRUE             case
      64          2023-01-28        2023-02-02     TRUE             case
      65          2023-01-27        2023-01-30     TRUE             case
      66          2023-01-31        2023-02-08    FALSE   under_followup
      67          2023-01-24        2023-01-27    FALSE   under_followup
      68          2023-01-20        2023-01-27    FALSE lost_to_followup
      69          2023-01-23        2023-01-30    FALSE   under_followup
      70          2023-01-19        2023-01-28     TRUE             case
      71          2023-01-21        2023-01-25    FALSE   under_followup
      72          2023-01-25        2023-02-02     TRUE             case
      73          2023-01-28        2023-02-04    FALSE lost_to_followup
      74          2023-01-27        2023-02-05    FALSE lost_to_followup
      75          2023-01-25        2023-02-04    FALSE lost_to_followup
      76          2023-01-26        2023-02-01     TRUE             case
      77          2023-01-26        2023-01-30     TRUE             case
      78          2023-01-25        2023-02-03    FALSE   under_followup
      79          2023-01-31        2023-02-02     TRUE             case
      80          2023-01-29        2023-02-04    FALSE   under_followup
      81          2023-01-28        2023-02-02    FALSE   under_followup
      82          2023-01-30        2023-02-03    FALSE   under_followup
      83          2023-01-29        2023-02-02    FALSE lost_to_followup
      84          2023-01-30        2023-02-05     TRUE             case
      85          2023-01-30        2023-02-02    FALSE   under_followup
      86          2023-01-29        2023-02-04    FALSE   under_followup
      87          2023-01-28        2023-01-30     TRUE             case
      88          2023-01-24        2023-02-03     TRUE             case
      89          2023-01-28        2023-02-05     TRUE             case
      90          2023-01-28        2023-02-03    FALSE   under_followup
      91          2023-01-31        2023-02-08    FALSE          unknown
      92          2023-02-03        2023-02-05     TRUE             case
      93          2023-02-02        2023-02-07    FALSE   under_followup
      94          2023-01-30        2023-02-05    FALSE   under_followup
      95          2023-01-28        2023-02-05    FALSE lost_to_followup
      96          2023-01-31        2023-02-04     TRUE             case
      97          2023-01-27        2023-02-02     TRUE             case
      98          2023-01-31        2023-02-07    FALSE   under_followup
      99          2023-01-27        2023-02-06    FALSE lost_to_followup
      100         2023-01-28        2023-02-09     TRUE             case
      101         2023-01-29        2023-02-03    FALSE lost_to_followup
      102         2023-01-31        2023-02-07    FALSE   under_followup
      103         2023-02-02        2023-02-05    FALSE   under_followup
      104         2023-01-31        2023-02-07    FALSE lost_to_followup
      105         2023-01-31        2023-02-07    FALSE   under_followup
      106         2023-01-29        2023-02-10    FALSE   under_followup
      107         2023-01-31        2023-02-10     TRUE             case
      108         2023-01-31        2023-02-06    FALSE   under_followup
      109         2023-01-30        2023-02-08    FALSE   under_followup
      110         2023-01-31        2023-02-05     TRUE             case
      111         2023-02-02        2023-02-12    FALSE   under_followup
      112         2023-02-04        2023-02-08     TRUE             case
      113         2023-02-10        2023-02-17     TRUE             case
      114         2023-02-08        2023-02-12    FALSE          unknown
      115         2023-02-08        2023-02-13     TRUE             case
      116         2023-02-11        2023-02-15    FALSE   under_followup
      117         2023-02-10        2023-02-14    FALSE          unknown
      118         2023-02-10        2023-02-12     TRUE             case
      119         2023-02-10        2023-02-16     TRUE             case
      120         2023-02-09        2023-02-21    FALSE   under_followup
      121         2023-02-24        2023-03-01     TRUE             case
      122         2023-02-21        2023-02-26     TRUE             case
      123         2023-02-23        2023-03-01    FALSE lost_to_followup
      124         2023-02-20        2023-02-26     TRUE             case
      125         2023-02-22        2023-02-26     TRUE             case
      126         2023-02-15        2023-02-22    FALSE   under_followup
      127         2023-02-13        2023-02-19    FALSE   under_followup
      128         2023-02-28        2023-03-03    FALSE   under_followup
      129         2023-03-01        2023-03-07     TRUE             case
      130         2023-03-01        2023-03-04     TRUE             case
      131         2023-03-06        2023-03-11    FALSE   under_followup
      132         2023-02-27        2023-03-13     TRUE             case
      133         2023-02-25        2023-03-02    FALSE lost_to_followup
      134         2023-02-24        2023-03-05    FALSE   under_followup
      135         2023-03-05        2023-03-12    FALSE   under_followup
      136         2023-03-05        2023-03-11    FALSE   under_followup
      137         2023-03-09        2023-03-11     TRUE             case
      138         2023-03-09        2023-03-13     TRUE             case
      139         2023-03-13        2023-03-23    FALSE   under_followup
      140         2023-03-16        2023-03-18    FALSE   under_followup
      141         2023-03-15        2023-03-20     TRUE             case
      142         2023-03-16        2023-03-23     TRUE             case
      143         2023-03-14        2023-03-22    FALSE   under_followup
      144         2023-03-08        2023-03-15     TRUE             case
      145         2023-03-07        2023-03-14     TRUE             case
      146         2023-03-09        2023-03-11     TRUE             case
      147         2023-03-07        2023-03-10    FALSE   under_followup
      148         2023-03-03        2023-03-12    FALSE lost_to_followup
      149         2023-03-03        2023-03-13     TRUE             case
      150         2023-03-17        2023-03-28    FALSE   under_followup
      151         2023-03-17        2023-03-24    FALSE   under_followup
      152         2023-03-11        2023-03-22     TRUE             case
      153         2023-03-14        2023-03-19     TRUE             case
      154         2023-03-14        2023-03-16     TRUE             case
      155         2023-03-12        2023-03-15    FALSE   under_followup
      156         2023-03-09        2023-03-18     TRUE             case
      157         2023-03-08        2023-03-16     TRUE             case
      158         2023-03-11        2023-03-18     TRUE             case
      159         2023-03-12        2023-03-19    FALSE lost_to_followup
      160         2023-03-11        2023-03-18    FALSE          unknown
      161         2023-03-08        2023-03-14    FALSE   under_followup
      162         2023-03-10        2023-03-18     TRUE             case
      163         2023-03-14        2023-03-19     TRUE             case
      164         2023-03-23        2023-03-27    FALSE   under_followup
      165         2023-03-20        2023-03-26     TRUE             case
      166         2023-03-16        2023-03-21    FALSE   under_followup
      167         2023-03-14        2023-03-19    FALSE   under_followup
      168         2023-03-16        2023-03-22    FALSE   under_followup
      169         2023-03-16        2023-03-21    FALSE   under_followup
      170         2023-03-15        2023-03-19     TRUE             case
      171         2023-03-13        2023-03-20     TRUE             case
      172         2023-03-14        2023-03-16     TRUE             case
      173         2023-03-13        2023-03-15     TRUE             case
      174         2023-03-24        2023-03-28     TRUE             case
      175         2023-03-20        2023-03-27     TRUE             case
      176         2023-03-18        2023-03-23     TRUE             case
      177         2023-03-17        2023-03-23     TRUE             case
      178         2023-03-16        2023-03-20    FALSE   under_followup
      179         2023-03-12        2023-03-16    FALSE lost_to_followup
      180         2023-03-15        2023-03-22    FALSE lost_to_followup
      181         2023-03-12        2023-03-21     TRUE             case
      182         2023-03-12        2023-03-17    FALSE   under_followup
      183         2023-03-23        2023-04-01    FALSE   under_followup
      184         2023-03-29        2023-03-31    FALSE          unknown
      185         2023-03-23        2023-03-28     TRUE             case
      186         2023-03-24        2023-03-27    FALSE   under_followup
      187         2023-03-22        2023-03-29    FALSE   under_followup
      188         2023-03-22        2023-03-30     TRUE             case
      189         2023-03-24        2023-03-28    FALSE   under_followup
      190         2023-03-23        2023-03-29    FALSE   under_followup
      191         2023-03-21        2023-03-30    FALSE   under_followup
      192         2023-03-22        2023-03-30    FALSE   under_followup
      193         2023-03-23        2023-03-29    FALSE lost_to_followup
      194         2023-03-24        2023-03-27     TRUE             case
      195         2023-03-22        2023-03-27     TRUE             case
      196         2023-03-23        2023-04-01     TRUE             case
      197         2023-03-31        2023-04-06    FALSE   under_followup
      198         2023-04-03        2023-04-06     TRUE             case
      199         2023-03-31        2023-04-07     TRUE             case
      200         2023-04-01        2023-04-04     TRUE             case
      201         2023-03-26        2023-04-02     TRUE             case
      202         2023-03-27        2023-04-03    FALSE   under_followup
      203         2023-03-29        2023-03-29    FALSE   under_followup
      204         2023-03-24        2023-04-02     TRUE             case
      205         2023-03-26        2023-03-29    FALSE   under_followup
      206         2023-03-25        2023-03-31    FALSE   under_followup
      207         2023-03-20        2023-04-03    FALSE   under_followup
      208         2023-03-24        2023-04-01     TRUE             case
      209         2023-03-26        2023-04-03     TRUE             case
      210         2023-03-29        2023-03-31     TRUE             case
      211         2023-03-25        2023-03-28    FALSE   under_followup
      212         2023-04-04        2023-04-10     TRUE             case
      213         2023-04-02        2023-04-05     TRUE             case
      214         2023-04-07        2023-04-08    FALSE   under_followup
      215         2023-04-04        2023-04-11    FALSE lost_to_followup
      216         2023-03-31        2023-04-03    FALSE lost_to_followup
      217         2023-03-30        2023-04-06    FALSE          unknown
      218         2023-03-30        2023-04-07     TRUE             case
      219         2023-03-30        2023-04-08    FALSE   under_followup
      220         2023-03-31        2023-04-03     TRUE             case
      221         2023-03-31        2023-04-04    FALSE   under_followup
      222         2023-04-01        2023-04-07    FALSE   under_followup
      223         2023-04-02        2023-04-08     TRUE             case
      224         2023-03-29        2023-04-03    FALSE   under_followup
      225         2023-03-31        2023-04-04     TRUE             case
      226         2023-03-27        2023-04-06    FALSE   under_followup
      227         2023-04-04        2023-04-09    FALSE   under_followup
      228         2023-04-09        2023-04-12     TRUE             case
      229         2023-04-06        2023-04-11     TRUE             case
      230         2023-04-09        2023-04-12    FALSE   under_followup
      231         2023-04-01        2023-04-10     TRUE             case
      232         2023-04-02        2023-04-06     TRUE             case
      233         2023-04-03        2023-04-09     TRUE             case
      234         2023-04-06        2023-04-11     TRUE             case
      235         2023-04-03        2023-04-11     TRUE             case
      236         2023-04-05        2023-04-08    FALSE   under_followup
      237         2023-04-09        2023-04-14     TRUE             case
      238         2023-04-08        2023-04-15    FALSE   under_followup
      239         2023-03-30        2023-04-08     TRUE             case
      240         2023-03-30        2023-04-05    FALSE   under_followup
      241         2023-04-04        2023-04-14    FALSE   under_followup
      242         2023-04-02        2023-04-15     TRUE             case
      243         2023-04-07        2023-04-11    FALSE   under_followup
      244         2023-04-08        2023-04-12     TRUE             case
      245         2023-04-08        2023-04-12    FALSE   under_followup
      246         2023-04-04        2023-04-11    FALSE   under_followup
      247         2023-04-08        2023-04-14    FALSE   under_followup
      248         2023-04-07        2023-04-14    FALSE   under_followup
      249         2023-04-09        2023-04-17     TRUE             case
      250         2023-04-09        2023-04-11     TRUE             case
      251         2023-04-08        2023-04-13     TRUE             case
      252         2023-04-06        2023-04-14     TRUE             case
      253         2023-04-11        2023-04-15     TRUE             case
      254         2023-04-13        2023-04-19     TRUE             case
      255         2023-04-14        2023-04-16    FALSE   under_followup
      256         2023-04-14        2023-04-16    FALSE   under_followup
      257         2023-04-11        2023-04-20     TRUE             case
      258         2023-04-13        2023-04-18    FALSE lost_to_followup
      259         2023-04-13        2023-04-16    FALSE   under_followup
      260         2023-04-13        2023-04-21     TRUE             case
      261         2023-04-10        2023-04-20     TRUE             case
      262         2023-04-10        2023-04-16    FALSE lost_to_followup
      263         2023-04-14        2023-04-22     TRUE             case
      264         2023-04-15        2023-04-26     TRUE             case
      265         2023-04-15        2023-04-22    FALSE   under_followup
      266         2023-04-19        2023-04-27     TRUE             case
      267         2023-04-20        2023-04-23     TRUE             case
      268         2023-04-13        2023-04-19    FALSE   under_followup
      269         2023-04-14        2023-04-21    FALSE   under_followup
      270         2023-04-13        2023-04-17    FALSE          unknown
      271         2023-04-14        2023-04-19    FALSE          unknown
      272         2023-04-13        2023-04-16    FALSE lost_to_followup
      273         2023-04-23        2023-04-26    FALSE   under_followup
      274         2023-04-24        2023-04-30    FALSE          unknown
      275         2023-04-12        2023-04-16    FALSE   under_followup
      276         2023-04-11        2023-04-14     TRUE             case
      277         2023-04-23        2023-04-29     TRUE             case
      278         2023-04-15        2023-04-24     TRUE             case
      279         2023-04-16        2023-04-24     TRUE             case
      280         2023-04-14        2023-04-21    FALSE   under_followup
      281         2023-04-16        2023-04-22     TRUE             case
      282         2023-04-20        2023-04-22    FALSE   under_followup
      283         2023-04-28        2023-05-01     TRUE             case
      284         2023-04-23        2023-05-01     TRUE             case
      285         2023-04-22        2023-04-27    FALSE lost_to_followup
      286         2023-04-22        2023-04-27    FALSE lost_to_followup
      287         2023-04-23        2023-04-26    FALSE   under_followup
      288         2023-04-21        2023-04-23    FALSE lost_to_followup
      289         2023-04-19        2023-04-23    FALSE   under_followup
      290         2023-04-19        2023-04-23     TRUE             case
      291         2023-04-16        2023-04-22     TRUE             case
      292         2023-04-29        2023-05-09     TRUE             case
      293         2023-04-30        2023-05-05    FALSE          unknown
      294         2023-05-02        2023-05-06    FALSE          unknown
      295         2023-05-03        2023-05-07     TRUE             case
      296         2023-05-01        2023-05-04    FALSE lost_to_followup
      297         2023-04-25        2023-05-05     TRUE             case
      298         2023-04-27        2023-05-03    FALSE   under_followup
      299         2023-04-21        2023-04-28    FALSE   under_followup
      300         2023-04-19        2023-05-02     TRUE             case
      301         2023-04-18        2023-04-25     TRUE             case
      302         2023-05-03        2023-05-08    FALSE   under_followup
      303         2023-05-01        2023-05-07     TRUE             case
      304         2023-05-03        2023-05-11    FALSE lost_to_followup
      305         2023-04-28        2023-05-05    FALSE   under_followup
      306         2023-04-25        2023-05-06     TRUE             case
      307         2023-04-30        2023-05-08    FALSE   under_followup
      308         2023-04-20        2023-04-24    FALSE   under_followup
      309         2023-04-19        2023-04-26     TRUE             case
      310         2023-04-20        2023-04-27     TRUE             case
      311         2023-04-22        2023-04-23    FALSE          unknown
      312         2023-04-25        2023-04-30     TRUE             case
      313         2023-05-06        2023-05-10    FALSE   under_followup
      314         2023-05-06        2023-05-10    FALSE   under_followup
      315         2023-05-05        2023-05-10     TRUE             case
      316         2023-05-08        2023-05-09    FALSE   under_followup
      317         2023-04-21        2023-04-30    FALSE   under_followup
      318         2023-04-22        2023-05-01    FALSE   under_followup
      319         2023-04-22        2023-04-28     TRUE             case
      320         2023-04-22        2023-04-30    FALSE   under_followup
      321         2023-04-25        2023-04-29    FALSE   under_followup
      322         2023-04-21        2023-04-28    FALSE   under_followup
      323         2023-05-08        2023-05-12    FALSE   under_followup
      324         2023-05-04        2023-05-15    FALSE lost_to_followup
      325         2023-04-27        2023-05-03     TRUE             case
      326         2023-05-03        2023-05-10    FALSE          unknown
      

# sim_outbreak works as expected

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
      $linelist
         id              case_name case_type sex age date_onset date_reporting
      1   1     Jennifer Pritchett confirmed   f   0 2023-01-01     2023-01-01
      2   2           Tyler Payson confirmed   f  28 2023-01-01     2023-01-01
      3   3       Faisal al-Hallal confirmed   m  77 2023-01-01     2023-01-01
      4   5        Collin Johnston confirmed   m  69 2023-01-01     2023-01-01
      5   6               Kaleb Le  probable   m  27 2023-01-01     2023-01-01
      6   8       Muslim el-Radwan suspected   m  60 2023-01-01     2023-01-01
      7  11         Nicholas Black confirmed   m  85 2023-01-01     2023-01-01
      8  12           Olivia Smith  probable   f  70 2023-01-01     2023-01-01
      9  13            Hope Holley  probable   f  50 2023-01-01     2023-01-01
      10 18        Viviana Crespin  probable   f  48 2023-01-02     2023-01-02
      11 20 Cass Montelongo Declay  probable   m  90 2023-01-02     2023-01-02
      12 22            Wyona Flynn confirmed   f  19 2023-01-02     2023-01-02
         date_admission   outcome date_outcome date_first_contact date_last_contact
      1            <NA> recovered         <NA>               <NA>              <NA>
      2            <NA> recovered         <NA>         2022-12-30        2023-01-08
      3      2023-01-02      died   2023-01-10         2022-12-31        2023-01-05
      4            <NA> recovered         <NA>         2022-12-31        2023-01-04
      5            <NA> recovered         <NA>         2022-12-29        2023-01-02
      6      2023-01-14 recovered         <NA>         2022-12-28        2023-01-05
      7            <NA> recovered         <NA>         2022-12-30        2023-01-04
      8            <NA> recovered         <NA>         2022-12-28        2023-01-09
      9            <NA> recovered         <NA>         2022-12-29        2023-01-04
      10           <NA> recovered         <NA>         2022-12-29        2023-01-04
      11           <NA> recovered         <NA>         2022-12-31        2023-01-03
      12           <NA> recovered         <NA>         2022-12-27        2023-01-05
         ct_value
      1      27.1
      2      25.2
      3      24.8
      4      26.2
      5        NA
      6        NA
      7      23.2
      8        NA
      9        NA
      10       NA
      11       NA
      12     25.2
      
      $contacts
                       from                     to age sex date_first_contact
      1  Jennifer Pritchett           Tyler Payson  28   f         2022-12-30
      2  Jennifer Pritchett       Faisal al-Hallal  77   m         2022-12-31
      3        Tyler Payson       Dhaakir al-Safar  21   m         2022-12-30
      4        Tyler Payson        Collin Johnston  69   m         2022-12-31
      5    Faisal al-Hallal               Kaleb Le  27   m         2022-12-29
      6    Faisal al-Hallal         Junaid el-Huda  36   m         2022-12-27
      7    Faisal al-Hallal       Muslim el-Radwan  60   m         2022-12-28
      8     Collin Johnston           Corey Cabral  45   m         2022-12-28
      9            Kaleb Le           Sean Qureshi  66   m         2022-12-29
      10   Muslim el-Radwan         Nicholas Black  85   m         2022-12-30
      11   Muslim el-Radwan           Olivia Smith  70   f         2022-12-28
      12   Muslim el-Radwan            Hope Holley  50   f         2022-12-29
      13     Nicholas Black           Daniel Yoder  43   m         2022-12-28
      14     Nicholas Black        Michiyo Abraham  48   f         2022-12-30
      15     Nicholas Black        Sakeena el-Azer  59   f         2022-12-30
      16       Olivia Smith       Francisco Huerta  55   m         2022-12-24
      17        Hope Holley        Viviana Crespin  48   f         2022-12-29
      18        Hope Holley     Anthony Montgomery  49   m         2022-12-30
      19        Hope Holley Cass Montelongo Declay  90   m         2022-12-31
      20        Hope Holley           Andi Sundara   6   m         2022-12-29
      21    Viviana Crespin            Wyona Flynn  19   f         2022-12-27
         date_last_contact was_case           status
      1         2023-01-08     TRUE             case
      2         2023-01-05     TRUE             case
      3         2023-01-03    FALSE   under_followup
      4         2023-01-04     TRUE             case
      5         2023-01-02     TRUE             case
      6         2023-01-01    FALSE lost_to_followup
      7         2023-01-05     TRUE             case
      8         2023-01-02    FALSE lost_to_followup
      9         2023-01-04    FALSE   under_followup
      10        2023-01-04     TRUE             case
      11        2023-01-09     TRUE             case
      12        2023-01-04     TRUE             case
      13        2023-01-04    FALSE   under_followup
      14        2023-01-02    FALSE   under_followup
      15        2023-01-05    FALSE          unknown
      16        2023-01-04    FALSE lost_to_followup
      17        2023-01-04     TRUE             case
      18        2023-01-03    FALSE lost_to_followup
      19        2023-01-03     TRUE             case
      20        2023-01-04    FALSE          unknown
      21        2023-01-05     TRUE             case
      

# sim_outbreak works as expected with anonymised

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
      $linelist
         id  case_name case_type sex age date_onset date_reporting date_admission
      1   1 rRMCAJFEY3 suspected   f   0 2023-01-01     2023-01-01           <NA>
      2   2 qKY39Zyiuu  probable   f  28 2023-01-01     2023-01-01           <NA>
      3   3 oY8Kxng7Az confirmed   m  77 2023-01-01     2023-01-01     2023-01-02
      4   5 m1SzNbO5h4 suspected   m  69 2023-01-01     2023-01-01           <NA>
      5   6 yEtT6tejRt confirmed   m  27 2023-01-01     2023-01-01           <NA>
      6   8 KFNmydPL7X  probable   m  60 2023-01-01     2023-01-01     2023-01-14
      7  11 9tYeb1elcz confirmed   m  85 2023-01-01     2023-01-01           <NA>
      8  12 XnmE3U4HDz confirmed   f  70 2023-01-01     2023-01-01           <NA>
      9  13 SVgVAWQihv  probable   f  50 2023-01-01     2023-01-01           <NA>
      10 18 LY9VZdzuuT  probable   f  48 2023-01-02     2023-01-02           <NA>
      11 20 3WvUcVV4dJ  probable   m  90 2023-01-02     2023-01-02           <NA>
      12 22 k6RZkfVJ5f confirmed   f  19 2023-01-02     2023-01-02           <NA>
           outcome date_outcome date_first_contact date_last_contact ct_value
      1  recovered         <NA>               <NA>              <NA>       NA
      2  recovered         <NA>         2022-12-30        2023-01-08       NA
      3       died   2023-01-10         2022-12-31        2023-01-05     23.9
      4  recovered         <NA>         2022-12-31        2023-01-04       NA
      5  recovered         <NA>         2022-12-29        2023-01-02     22.3
      6  recovered         <NA>         2022-12-28        2023-01-05       NA
      7  recovered         <NA>         2022-12-30        2023-01-04     24.2
      8  recovered         <NA>         2022-12-28        2023-01-09     25.6
      9  recovered         <NA>         2022-12-29        2023-01-04       NA
      10 recovered         <NA>         2022-12-29        2023-01-04       NA
      11 recovered         <NA>         2022-12-31        2023-01-03       NA
      12 recovered         <NA>         2022-12-27        2023-01-05     23.4
      
      $contacts
               from         to age sex date_first_contact date_last_contact was_case
      1  rRMCAJFEY3 qKY39Zyiuu  28   f         2022-12-30        2023-01-08     TRUE
      2  rRMCAJFEY3 oY8Kxng7Az  77   m         2022-12-31        2023-01-05     TRUE
      3  qKY39Zyiuu DS6oXfHuaq  21   m         2022-12-30        2023-01-03    FALSE
      4  qKY39Zyiuu m1SzNbO5h4  69   m         2022-12-31        2023-01-04     TRUE
      5  oY8Kxng7Az yEtT6tejRt  27   m         2022-12-29        2023-01-02     TRUE
      6  oY8Kxng7Az 34oCba8e6y  36   m         2022-12-27        2023-01-01    FALSE
      7  oY8Kxng7Az KFNmydPL7X  60   m         2022-12-28        2023-01-05     TRUE
      8  m1SzNbO5h4 eZaLTmhWsV  45   m         2022-12-28        2023-01-02    FALSE
      9  yEtT6tejRt UBVWYTLkhw  66   m         2022-12-29        2023-01-04    FALSE
      10 KFNmydPL7X 9tYeb1elcz  85   m         2022-12-30        2023-01-04     TRUE
      11 KFNmydPL7X XnmE3U4HDz  70   f         2022-12-28        2023-01-09     TRUE
      12 KFNmydPL7X SVgVAWQihv  50   f         2022-12-29        2023-01-04     TRUE
      13 9tYeb1elcz SfYVARDjDa  43   m         2022-12-28        2023-01-04    FALSE
      14 9tYeb1elcz fq8m2zbFUJ  48   f         2022-12-30        2023-01-02    FALSE
      15 9tYeb1elcz RewLYtBBlI  59   f         2022-12-30        2023-01-05    FALSE
      16 XnmE3U4HDz dUTzmcTo9H  55   m         2022-12-24        2023-01-04    FALSE
      17 SVgVAWQihv LY9VZdzuuT  48   f         2022-12-29        2023-01-04     TRUE
      18 SVgVAWQihv 3p6KxuczwJ  49   m         2022-12-30        2023-01-03    FALSE
      19 SVgVAWQihv 3WvUcVV4dJ  90   m         2022-12-31        2023-01-03     TRUE
      20 SVgVAWQihv 6ZKaUKvu5A   6   m         2022-12-29        2023-01-04    FALSE
      21 LY9VZdzuuT k6RZkfVJ5f  19   f         2022-12-27        2023-01-05     TRUE
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
         id             case_name case_type sex age date_onset date_reporting
      1   1     Mikhaila Eberhart  probable   f   0 2023-01-01     2023-01-01
      2   2         Naomi Russell  probable   f  28 2023-01-01     2023-01-01
      3   3      Badraan al-Shams confirmed   m  77 2023-01-01     2023-01-01
      4   5        Maazin al-Miah confirmed   m  69 2023-01-01     2023-01-01
      5   6     Faisal al-Youssef suspected   m  27 2023-01-01     2023-01-01
      6   8        Keane Shrestha confirmed   m  60 2023-01-01     2023-01-01
      7  11 Benito Zapata Morales confirmed   m  85 2023-01-01     2023-01-01
      8  12           Annie Watts suspected   f  70 2023-01-01     2023-01-01
      9  13      Amaani al-Masood confirmed   f  50 2023-01-01     2023-01-01
      10 18             Kira Cano confirmed   f  48 2023-01-02     2023-01-02
      11 20      Benjamin Raigoza confirmed   m  90 2023-01-02     2023-01-02
      12 22    Lilibeth Carpenter confirmed   f  19 2023-01-02     2023-01-02
         date_admission   outcome date_outcome date_first_contact date_last_contact
      1            <NA> recovered         <NA>               <NA>              <NA>
      2            <NA> recovered         <NA>         2022-12-30        2023-01-08
      3            <NA> recovered         <NA>         2022-12-31        2023-01-05
      4            <NA> recovered         <NA>         2022-12-31        2023-01-04
      5            <NA> recovered         <NA>         2022-12-29        2023-01-02
      6      2023-01-14 recovered         <NA>         2022-12-28        2023-01-05
      7            <NA> recovered         <NA>         2022-12-30        2023-01-04
      8            <NA> recovered         <NA>         2022-12-28        2023-01-09
      9            <NA> recovered         <NA>         2022-12-29        2023-01-04
      10           <NA> recovered         <NA>         2022-12-29        2023-01-04
      11           <NA> recovered         <NA>         2022-12-31        2023-01-03
      12           <NA> recovered         <NA>         2022-12-27        2023-01-05
         ct_value
      1        NA
      2        NA
      3      27.0
      4      25.3
      5        NA
      6      25.8
      7      24.9
      8        NA
      9      24.5
      10     26.4
      11     27.3
      12     20.2
      
      $contacts
                          from                    to age sex date_first_contact
      1      Mikhaila Eberhart         Naomi Russell  28   f         2022-12-30
      2      Mikhaila Eberhart      Badraan al-Shams  77   m         2022-12-31
      3          Naomi Russell  Anushkaran Natarelli  21   m         2022-12-30
      4          Naomi Russell        Maazin al-Miah  69   m         2022-12-31
      5       Badraan al-Shams     Faisal al-Youssef  27   m         2022-12-29
      6       Badraan al-Shams        Miguel Venrick  36   m         2022-12-27
      7       Badraan al-Shams        Keane Shrestha  60   m         2022-12-28
      8         Maazin al-Miah     Dhaakir al-Hallal  45   m         2022-12-28
      9      Faisal al-Youssef       Junaid al-Safar  66   m         2022-12-29
      10        Keane Shrestha Benito Zapata Morales  85   m         2022-12-30
      11        Keane Shrestha           Annie Watts  70   f         2022-12-28
      12        Keane Shrestha      Amaani al-Masood  50   f         2022-12-29
      13 Benito Zapata Morales             Kevin Lee  43   m         2022-12-28
      14 Benito Zapata Morales        Katelyn Kaiser  48   f         2022-12-30
      15 Benito Zapata Morales     Cheyenne Dorantes  59   f         2022-12-30
      16           Annie Watts          Pierce Niess  55   m         2022-12-24
      17      Amaani al-Masood             Kira Cano  48   f         2022-12-29
      18      Amaani al-Masood       Collin Johnston  49   m         2022-12-30
      19      Amaani al-Masood      Benjamin Raigoza  90   m         2022-12-31
      20      Amaani al-Masood           Jorge Duran   6   m         2022-12-29
      21             Kira Cano    Lilibeth Carpenter  19   f         2022-12-27
         date_last_contact was_case           status
      1         2023-01-08     TRUE             case
      2         2023-01-05     TRUE             case
      3         2023-01-03    FALSE lost_to_followup
      4         2023-01-04     TRUE             case
      5         2023-01-02     TRUE             case
      6         2023-01-01    FALSE   under_followup
      7         2023-01-05     TRUE             case
      8         2023-01-02    FALSE   under_followup
      9         2023-01-04    FALSE   under_followup
      10        2023-01-04     TRUE             case
      11        2023-01-09     TRUE             case
      12        2023-01-04     TRUE             case
      13        2023-01-04    FALSE   under_followup
      14        2023-01-02    FALSE   under_followup
      15        2023-01-05    FALSE lost_to_followup
      16        2023-01-04    FALSE lost_to_followup
      17        2023-01-04     TRUE             case
      18        2023-01-03    FALSE   under_followup
      19        2023-01-03     TRUE             case
      20        2023-01-04    FALSE   under_followup
      21        2023-01-05     TRUE             case
      

# sim_outbreak works as expected with age structure

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
      $linelist
         id          case_name case_type sex age date_onset date_reporting
      1   1  Mikhaila Eberhart  probable   f  11 2023-01-01     2023-01-01
      2   2      Naomi Russell  probable   f  10 2023-01-01     2023-01-01
      3   3     Dominic Mcgill confirmed   m  80 2023-01-01     2023-01-01
      4   5  Alexandre Morales confirmed   m   4 2023-01-01     2023-01-01
      5   6        Gienry Sena suspected   m  84 2023-01-01     2023-01-01
      6   8    Raymond Kennedy confirmed   m  88 2023-01-01     2023-01-01
      7  11    Travis Chambers confirmed   m  71 2023-01-01     2023-01-01
      8  12        Annie Watts suspected   f  78 2023-01-01     2023-01-01
      9  13   Amaani al-Masood confirmed   f  28 2023-01-01     2023-01-01
      10 18          Kira Cano confirmed   f  51 2023-01-02     2023-01-02
      11 20      Wajdi al-Miah confirmed   m  75 2023-01-02     2023-01-02
      12 22 Lilibeth Carpenter confirmed   f  48 2023-01-02     2023-01-02
         date_admission   outcome date_outcome date_first_contact date_last_contact
      1            <NA> recovered         <NA>               <NA>              <NA>
      2            <NA> recovered         <NA>         2022-12-30        2023-01-08
      3            <NA> recovered         <NA>         2022-12-31        2023-01-05
      4            <NA> recovered         <NA>         2022-12-31        2023-01-04
      5            <NA> recovered         <NA>         2022-12-29        2023-01-02
      6            <NA> recovered         <NA>         2022-12-28        2023-01-05
      7            <NA> recovered         <NA>         2022-12-30        2023-01-04
      8      2023-01-04 recovered         <NA>         2022-12-28        2023-01-09
      9            <NA> recovered         <NA>         2022-12-29        2023-01-04
      10           <NA> recovered         <NA>         2022-12-29        2023-01-04
      11     2023-01-06 recovered         <NA>         2022-12-31        2023-01-03
      12           <NA> recovered         <NA>         2022-12-27        2023-01-05
         ct_value
      1        NA
      2        NA
      3      27.0
      4      25.3
      5        NA
      6      25.8
      7      24.9
      8        NA
      9      24.5
      10     26.4
      11     27.3
      12     20.2
      
      $contacts
                      from                 to age sex date_first_contact
      1  Mikhaila Eberhart      Naomi Russell  10   f         2022-12-30
      2  Mikhaila Eberhart     Dominic Mcgill  80   m         2022-12-31
      3      Naomi Russell      Micheal Nault  19   m         2022-12-30
      4      Naomi Russell  Alexandre Morales   4   m         2022-12-31
      5     Dominic Mcgill        Gienry Sena  84   m         2022-12-29
      6     Dominic Mcgill  Ghaamid el-Othman  86   m         2022-12-27
      7     Dominic Mcgill    Raymond Kennedy  88   m         2022-12-28
      8  Alexandre Morales       Jakob Galvan  79   m         2022-12-28
      9        Gienry Sena          Kyle Orio  31   m         2022-12-29
      10   Raymond Kennedy    Travis Chambers  71   m         2022-12-30
      11   Raymond Kennedy        Annie Watts  78   f         2022-12-28
      12   Raymond Kennedy   Amaani al-Masood  28   f         2022-12-29
      13   Travis Chambers   Faatih el-Vaziri   1   m         2022-12-28
      14   Travis Chambers     Katelyn Kaiser  13   f         2022-12-30
      15   Travis Chambers  Cheyenne Dorantes  61   f         2022-12-30
      16       Annie Watts     Aiman al-Shams  24   m         2022-12-24
      17  Amaani al-Masood          Kira Cano  51   f         2022-12-29
      18  Amaani al-Masood     Va'Aahi Nguyen  73   m         2022-12-30
      19  Amaani al-Masood      Wajdi al-Miah  75   m         2022-12-31
      20  Amaani al-Masood   Raaid al-Youssef  25   m         2022-12-29
      21         Kira Cano Lilibeth Carpenter  48   f         2022-12-27
         date_last_contact was_case           status
      1         2023-01-08     TRUE             case
      2         2023-01-05     TRUE             case
      3         2023-01-03    FALSE lost_to_followup
      4         2023-01-04     TRUE             case
      5         2023-01-02     TRUE             case
      6         2023-01-01    FALSE   under_followup
      7         2023-01-05     TRUE             case
      8         2023-01-02    FALSE   under_followup
      9         2023-01-04    FALSE   under_followup
      10        2023-01-04     TRUE             case
      11        2023-01-09     TRUE             case
      12        2023-01-04     TRUE             case
      13        2023-01-04    FALSE   under_followup
      14        2023-01-02    FALSE   under_followup
      15        2023-01-05    FALSE lost_to_followup
      16        2023-01-04    FALSE lost_to_followup
      17        2023-01-04     TRUE             case
      18        2023-01-03    FALSE   under_followup
      19        2023-01-03     TRUE             case
      20        2023-01-04    FALSE   under_followup
      21        2023-01-05     TRUE             case
      

