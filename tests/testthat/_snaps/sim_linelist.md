# sim_linelist works as expected with defaults

    Code
      sim_linelist()
    Output
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

# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
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

# sim_linelist works as expected with age-strat risks

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
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

# sim_linelist works as expected with anonymous

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
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

# sim_linelist works as expected with age structure

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
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

# sim_linelist works as expected with age-strat risks & age struct

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, population_age = age_struct)
    Output
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

# sim_linelist works as expected with modified config

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution = function(n) stats::rgeom(
          n = n, prob = 0.5)))
    Output
         id               case_name case_type sex age date_onset date_reporting
      1   1          Victor Charles suspected   m  43 2023-01-01     2023-01-01
      2   2            Zachery Pena confirmed   m  76 2023-01-01     2023-01-01
      3   3          Noori al-Rassi  probable   m  89 2023-01-01     2023-01-01
      4   5            Taylor Allen  probable   m  18 2023-01-01     2023-01-01
      5   6         Destinee Harvie suspected   f  16 2023-01-01     2023-01-01
      6   8         Chengleng Xiong  probable   m  74 2023-01-01     2023-01-01
      7  11      Faseeha el-Chahine confirmed   f  45 2023-01-01     2023-01-01
      8  12          Zane Melendrez suspected   m  18 2023-01-01     2023-01-01
      9  13        Kaamil al-Elamin  probable   m  74 2023-01-01     2023-01-01
      10 18                Maia Xue confirmed   f  23 2023-01-02     2023-01-02
      11 20 Nicole Chavez Rodriguez confirmed   f  78 2023-01-02     2023-01-02
      12 22           Alizea Bailey confirmed   f  38 2023-01-02     2023-01-02
         date_admission   outcome date_outcome date_first_contact date_last_contact
      1            <NA> recovered         <NA>               <NA>              <NA>
      2            <NA> recovered         <NA>         2022-12-31        2023-01-07
      3            <NA> recovered         <NA>         2022-12-30        2023-01-03
      4            <NA> recovered         <NA>         2022-12-29        2023-01-02
      5            <NA>      died   2023-01-16         2022-12-27        2023-01-01
      6            <NA> recovered         <NA>         2022-12-28        2023-01-04
      7            <NA> recovered         <NA>         2022-12-28        2023-01-02
      8            <NA> recovered         <NA>         2022-12-29        2023-01-01
      9            <NA> recovered         <NA>         2022-12-28        2023-01-01
      10           <NA> recovered         <NA>         2022-12-30        2023-01-01
      11           <NA> recovered         <NA>         2022-12-29        2023-01-02
      12           <NA> recovered         <NA>         2022-12-30        2023-01-03
         ct_value
      1        NA
      2      25.8
      3        NA
      4        NA
      5        NA
      6        NA
      7      24.2
      8        NA
      9        NA
      10     27.6
      11     23.6
      12     23.8

# sim_linelist works as expected with modified config parameters

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution = function(n) stats::rpois(
          n = n, lambda = 5)))
    Output
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
      2            <NA> recovered         <NA>         2022-12-30        2023-01-11
      3      2023-01-02      died   2023-01-10         2022-12-31        2023-01-07
      4            <NA> recovered         <NA>         2022-12-31        2023-01-05
      5            <NA> recovered         <NA>         2022-12-29        2023-01-04
      6      2023-01-14 recovered         <NA>         2022-12-28        2023-01-07
      7            <NA> recovered         <NA>         2022-12-30        2023-01-07
      8            <NA> recovered         <NA>         2022-12-28        2023-01-12
      9            <NA> recovered         <NA>         2022-12-29        2023-01-06
      10           <NA> recovered         <NA>         2022-12-29        2023-01-06
      11           <NA> recovered         <NA>         2022-12-31        2023-01-04
      12           <NA> recovered         <NA>         2022-12-27        2023-01-07
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

# sim_linelist works as expected with time-varying cfr

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(time_varying_death_risk = function(risk, time) risk *
          exp(-time)))
    Output
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

# sim_linelist works as expected with time-varying cfr & age-strat

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_death_risk = age_dep_hosp_death_risk, config = create_config(
          time_varying_death_risk = function(risk, time) risk * exp(-time)))
    Output
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
      3      2023-01-02 recovered         <NA>         2022-12-31        2023-01-05
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

