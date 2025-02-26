# sim_outbreak works as expected with defaults

    Code
      sim_outbreak()
    Output
      $linelist
           id                   case_name case_type sex age date_onset date_reporting
      1     1            Lolette Phillips suspected   f  59 2023-01-01     2023-01-01
      2     2                  James Jack suspected   m  90 2023-01-01     2023-01-01
      3     3                 Chen Kantha confirmed   m   4 2023-01-02     2023-01-02
      4     5             Saleema al-Zaki  probable   f  29 2023-01-04     2023-01-04
      5     6                David Ponzio confirmed   m  14 2023-01-05     2023-01-05
      6     7            Christopher Ward  probable   m  85 2023-01-06     2023-01-06
      7    10                 Laura Ilaoa confirmed   f  25 2023-01-13     2023-01-13
      8    11                Morgan Mason suspected   f  34 2023-01-11     2023-01-11
      9    12            Cornelius Turner confirmed   m  89 2023-01-13     2023-01-13
      10   14          Shaddaad el-Younes suspected   m  63 2023-01-11     2023-01-11
      11   18         Carlo Ceazar Corpuz confirmed   m  74 2023-01-14     2023-01-14
      12   19              Bishr al-Qasim confirmed   m  34 2023-01-12     2023-01-12
      13   22           Nichole Mcfarland confirmed   f  29 2023-01-12     2023-01-12
      14   24               Jubair el-Aly confirmed   m  46 2023-01-13     2023-01-13
      15   27            Hafsa al-Massoud  probable   f  24 2023-01-14     2023-01-14
      16   29                Trever Manis confirmed   m  41 2023-01-21     2023-01-21
      17   30          Maiya Vathanavarin suspected   f  72 2023-01-19     2023-01-19
      18   31            Ghaamid el-Zafar  probable   m   6 2023-01-20     2023-01-20
      19   33      Kelly Runningbear-Paul confirmed   f  61 2023-01-14     2023-01-14
      20   34                James Welter  probable   m  44 2023-01-14     2023-01-14
      21   35            Austin Manheimer confirmed   m  71 2023-01-27     2023-01-27
      22   38         Orville Stadelbauer confirmed   m  69 2023-01-23     2023-01-23
      23   39                Jennifer Ouk  probable   f  61 2023-01-23     2023-01-23
      24   41            Nafeesa al-Zaher confirmed   f  64 2023-01-24     2023-01-24
      25   44           Nawwaara el-Pasha  probable   f  61 2023-01-22     2023-01-22
      26   45          Saleet el-Mohammed  probable   m  66 2023-01-22     2023-01-22
      27   47           Christian Mendoza  probable   m  81 2023-01-28     2023-01-28
      28   50                Eraina Mcgee confirmed   f  53 2023-01-28     2023-01-28
      29   51                   Mia Floyd  probable   f  45 2023-01-29     2023-01-29
      30   53               Collin Chavez confirmed   m  42 2023-02-02     2023-02-02
      31   54              Itzel Gonzales confirmed   f  78 2023-02-03     2023-02-03
      32   55            Alexis Caramillo confirmed   f  35 2023-01-24     2023-01-24
      33   56             Ronnie Scurlock suspected   m  54 2023-01-26     2023-01-26
      34   58                 Shane Ahmad confirmed   m  68 2023-01-25     2023-01-25
      35   59         Ghaaliya al-Shaheed  probable   f   3 2023-01-23     2023-01-23
      36   60               Exzinia Smith  probable   f  44 2023-01-29     2023-01-29
      37   63           Rhiannon Freeland  probable   f  62 2023-01-31     2023-01-31
      38   64              Deisha Beckner confirmed   f  35 2023-01-29     2023-01-29
      39   65                 Nelly Reyez confirmed   f  90 2023-02-03     2023-02-03
      40   66       Nadheera el-Mohiuddin  probable   f  25 2023-02-01     2023-02-01
      41   71        Caroline Vargas Pena  probable   f  46 2023-01-29     2023-01-29
      42   73             Mathurin Curtis confirmed   m   8 2023-02-01     2023-02-01
      43   77                 Kevin Shahi confirmed   m  63 2023-01-30     2023-01-30
      44   78              Diksha Reichal suspected   f  54 2023-01-29     2023-01-29
      45   80            Jazmine Sturgeon  probable   f  67 2023-02-03     2023-02-03
      46   85            Sally Richardson  probable   f  37 2023-02-02     2023-02-02
      47   88              Laraena Batson confirmed   f  73 2023-01-30     2023-01-30
      48   89                   Monica Ye  probable   f  13 2023-02-02     2023-02-02
      49   90              Kashauna Yorks  probable   f  72 2023-02-01     2023-02-01
      50   93           Carmelita Montoya  probable   f  61 2023-02-04     2023-02-04
      51   97            Aliyya el-Yassin  probable   f  22 2023-02-05     2023-02-05
      52   98                  Alicia Vue confirmed   f  29 2023-02-04     2023-02-04
      53  101            Rashele Williams confirmed   f  17 2023-02-07     2023-02-07
      54  108             Isabella Medina  probable   f  71 2023-02-14     2023-02-14
      55  111           Samuel Goodfellow confirmed   m  90 2023-02-09     2023-02-09
      56  113                Bertha Mohar  probable   f  23 2023-02-12     2023-02-12
      57  114           Mu,Aawiya al-Kaba confirmed   m  35 2023-02-16     2023-02-16
      58  116               Andrew Garcia confirmed   m  62 2023-02-24     2023-02-24
      59  119             Trevor Colligan confirmed   m  57 2023-02-23     2023-02-23
      60  120               Taaj el-Sarah suspected   m  44 2023-02-18     2023-02-18
      61  122              Savannah Cohen confirmed   f  57 2023-03-02     2023-03-02
      62  123              Nawfa el-Anwar suspected   f  63 2023-03-08     2023-03-08
      63  125                  Ryan Zheng suspected   m  46 2023-02-28     2023-02-28
      64  126              Henry Reichman suspected   m  66 2023-02-26     2023-02-26
      65  130            Shannon Armbrust  probable   f  68 2023-03-07     2023-03-07
      66  131                Orilea Diego  probable   f  12 2023-03-09     2023-03-09
      67  133                  Kloe Avila confirmed   f  51 2023-03-18     2023-03-18
      68  138              Sarah Griffith confirmed   f   2 2023-03-10     2023-03-10
      69  139                 Kara Finken  probable   f  53 2023-03-09     2023-03-09
      70  142         Raul Aguirre Molina  probable   m  76 2023-03-23     2023-03-23
      71  143               Mikayla Smith confirmed   f  82 2023-03-21     2023-03-21
      72  145         Mansoor al-Siddique confirmed   m  25 2023-03-15     2023-03-15
      73  146            Nizaam al-Salame suspected   m  76 2023-03-13     2023-03-13
      74  147              Alexis Harding confirmed   f  14 2023-03-13     2023-03-13
      75  150                Unique Vigil confirmed   f  76 2023-03-11     2023-03-11
      76  153                Tanya Mcadoo confirmed   f  78 2023-03-15     2023-03-15
      77  154                Shawn Morgan confirmed   m  75 2023-03-24     2023-03-24
      78  155              Asysa Robinson confirmed   f  76 2023-03-24     2023-03-24
      79  157            Sakeena al-Abdoo suspected   f  80 2023-03-18     2023-03-18
      80  158                Richard Prum confirmed   m  41 2023-03-18     2023-03-18
      81  159            Shahla al-Jaffer confirmed   f  78 2023-03-19     2023-03-19
      82  163               Kailey Braden suspected   f  28 2023-03-15     2023-03-15
      83  164          Raadiya el-Chahine confirmed   f   2 2023-03-21     2023-03-21
      84  166            Janie Santa Cruz  probable   f  82 2023-03-26     2023-03-26
      85  171               Alvaro Romero  probable   m   5 2023-03-22     2023-03-22
      86  172              Lane Rodriguez confirmed   m   1 2023-03-20     2023-03-20
      87  173                      Ka Lee confirmed   m  44 2023-03-19     2023-03-19
      88  174             Qaaid al-Shaker suspected   m  76 2023-03-16     2023-03-16
      89  175              Munsif al-Ozer suspected   m   3 2023-03-29     2023-03-29
      90  176               Sharon Watson  probable   f  15 2023-03-25     2023-03-25
      91  177          Danielle Ouellette confirmed   f  19 2023-03-26     2023-03-26
      92  178 Abdur Rasheed al-Salahuddin confirmed   m  76 2023-03-25     2023-03-25
      93  182             Samuel Videtzky confirmed   m  90 2023-03-27     2023-03-27
      94  186        Shalise Peters-Maloy confirmed   f  64 2023-04-03     2023-04-03
      95  189                  Jay Herman confirmed   m  35 2023-03-29     2023-03-29
      96  195             Manaara el-Saba confirmed   f  84 2023-03-27     2023-03-27
      97  196             Amelia Gallegos confirmed   f  18 2023-03-30     2023-03-30
      98  197             Brieannah Coles suspected   f  79 2023-03-28     2023-03-28
      99  199                    Sarah Vu suspected   f  49 2023-04-07     2023-04-07
      100 200               Mason Powells  probable   m  56 2023-04-05     2023-04-05
      101 201               Ashley Dotson confirmed   f  76 2023-04-07     2023-04-07
      102 202     Abdul Ghafoor al-Firman confirmed   m  41 2023-04-03     2023-04-03
      103 205              Vincent Arnick suspected   m  29 2023-04-01     2023-04-01
      104 209              Razeen al-Sala suspected   m  39 2023-04-05     2023-04-05
      105 210              Rusty Figueroa confirmed   m  32 2023-04-01     2023-04-01
      106 211                  Emma Jones suspected   f   9 2023-04-06     2023-04-06
      107 213               Cam Tu Quilon confirmed   f  39 2023-04-11     2023-04-11
      108 214              Fisayo Wallace confirmed   m  12 2023-04-17     2023-04-17
      109 219           Alejandra Purdham confirmed   f  52 2023-04-10     2023-04-10
      110 221              Yahya el-Aslam confirmed   m  22 2023-04-02     2023-04-02
      111 224             Nabeel el-Karam  probable   m  68 2023-04-08     2023-04-08
      112 226            Sandra Rodriquez confirmed   f  57 2023-04-06     2023-04-06
      113 229             Ameen al-Shakir confirmed   m   8 2023-04-12     2023-04-12
      114 230               Azmi el-Safar confirmed   m  28 2023-04-12     2023-04-12
      115 232             Laaiqa el-Azizi suspected   f   2 2023-04-02     2023-04-02
      116 233                  Jose Lopez confirmed   m  84 2023-04-09     2023-04-09
      117 234             Mreenal Solberg confirmed   f  52 2023-04-09     2023-04-09
      118 235                  Kevin Behr confirmed   m  58 2023-04-12     2023-04-12
      119 236               Khyleah Jones suspected   f  29 2023-04-10     2023-04-10
      120 238               Quinn Barrett confirmed   m  30 2023-04-14     2023-04-14
      121 240             Bryanna Medrano confirmed   f  71 2023-04-15     2023-04-15
      122 243                Marques Rice suspected   m  43 2023-04-13     2023-04-13
      123 245      Andrew Zaragoza-Madrid confirmed   m  40 2023-04-15     2023-04-15
      124 250             Julanne El-Amin suspected   f  46 2023-04-16     2023-04-16
      125 251               Jason Sowards suspected   m  69 2023-04-11     2023-04-11
      126 252                Yeeleng Tran suspected   m  69 2023-04-20     2023-04-20
      127 253                  Isaac Reid  probable   m  38 2023-04-20     2023-04-20
      128 254           Lawrence Williams  probable   m  28 2023-04-16     2023-04-16
      129 255                Adrian Anaya confirmed   m  82 2023-04-16     2023-04-16
      130 258              Colette Torres confirmed   f  19 2023-04-14     2023-04-14
      131 261                   Jose Luna confirmed   m  46 2023-04-26     2023-04-26
      132 262   Ummu Kulthoom al-Ghaffari confirmed   f  71 2023-04-13     2023-04-13
      133 264                  Luna Vigil confirmed   f   4 2023-04-25     2023-04-25
      134 265               Jasmine Evans confirmed   f  31 2023-04-25     2023-04-25
      135 267               Javon Jenkins  probable   m  16 2023-04-20     2023-04-20
      136 268             Clifton Charron confirmed   m  53 2023-04-21     2023-04-21
      137 277              Zachary Stuart confirmed   m  14 2023-05-01     2023-05-01
      138 278             Naseer el-Javed confirmed   m  48 2023-04-28     2023-04-28
      139 279             Alexis Stafford confirmed   f  89 2023-04-25     2023-04-25
      140 280              Razeen el-Azad suspected   m  39 2023-04-26     2023-04-26
      141 282             Jordan Marshall  probable   f  20 2023-04-21     2023-04-21
      142 284                Marcus Erman  probable   m   6 2023-05-03     2023-05-03
      143 285             Ismad al-Badour  probable   m  28 2023-05-05     2023-05-05
      144 291            Firdaus el-Farha suspected   f  42 2023-05-01     2023-05-01
      145 292                  Jane David confirmed   f  71 2023-04-23     2023-04-23
      146 293              Corina Morales  probable   f   9 2023-05-05     2023-05-05
      147 296               Justin Delori suspected   m  61 2023-05-06     2023-05-06
      148 298              Janalen Nguyen confirmed   f  53 2023-05-02     2023-05-02
      149 301             Naseera al-Arif confirmed   f  76 2023-04-23     2023-04-23
      150 302                  Andrew Sun confirmed   m  69 2023-04-26     2023-04-26
      151 304                    Ty Rains confirmed   m  50 2023-05-07     2023-05-07
      152 307               Javier Valdez  probable   m   7 2023-05-09     2023-05-09
      153 310                Kyana Ludwig confirmed   f  45 2023-04-24     2023-04-24
      154 311                Jessie Berry confirmed   f  83 2023-04-25     2023-04-25
      155 313               Jazmyn Guyton confirmed   f  41 2023-04-27     2023-04-27
      156 316                  Gia Garcia confirmed   f  88 2023-05-10     2023-05-10
      157 320               John Trujillo  probable   m  79 2023-05-01     2023-05-01
      158 326                Haley Hamlin  probable   f  82 2023-05-08     2023-05-08
          date_admission   outcome date_outcome date_first_contact date_last_contact
      1       2023-01-09      died   2023-01-13               <NA>              <NA>
      2             <NA> recovered         <NA>         2022-12-30        2023-01-01
      3             <NA> recovered         <NA>         2023-01-04        2023-01-04
      4             <NA> recovered         <NA>         2023-01-04        2023-01-07
      5       2023-01-09      died   2023-01-23         2023-01-04        2023-01-06
      6       2023-01-08 recovered         <NA>         2022-12-31        2023-01-04
      7             <NA> recovered         <NA>         2023-01-04        2023-01-06
      8       2023-01-24      died   2023-01-27         2023-01-06        2023-01-08
      9             <NA> recovered         <NA>         2023-01-01        2023-01-07
      10            <NA> recovered         <NA>         2023-01-09        2023-01-12
      11            <NA> recovered         <NA>         2023-01-09        2023-01-13
      12            <NA> recovered         <NA>         2023-01-12        2023-01-15
      13            <NA> recovered         <NA>         2023-01-07        2023-01-13
      14            <NA> recovered         <NA>         2023-01-11        2023-01-14
      15      2023-01-19      died   2023-01-27         2023-01-12        2023-01-16
      16            <NA> recovered         <NA>         2023-01-15        2023-01-17
      17            <NA> recovered         <NA>         2023-01-15        2023-01-16
      18            <NA> recovered         <NA>         2023-01-13        2023-01-17
      19            <NA> recovered         <NA>         2023-01-16        2023-01-17
      20      2023-02-10 recovered         <NA>         2023-01-12        2023-01-16
      21            <NA>      died   2023-02-05         2023-01-23        2023-01-23
      22            <NA> recovered         <NA>         2023-01-21        2023-01-23
      23            <NA> recovered         <NA>         2023-01-20        2023-01-23
      24            <NA> recovered         <NA>         2023-01-18        2023-01-20
      25            <NA> recovered         <NA>         2023-01-24        2023-01-25
      26            <NA> recovered         <NA>         2023-01-17        2023-01-22
      27            <NA> recovered         <NA>         2023-01-28        2023-01-29
      28      2023-01-30      died   2023-02-16         2023-01-22        2023-01-27
      29            <NA> recovered         <NA>         2023-01-26        2023-01-27
      30      2023-02-11 recovered         <NA>         2023-01-23        2023-01-26
      31            <NA> recovered         <NA>         2023-01-23        2023-01-28
      32            <NA> recovered         <NA>         2023-01-21        2023-01-23
      33            <NA>      died   2023-02-14         2023-01-23        2023-01-27
      34      2023-01-29 recovered         <NA>         2023-01-26        2023-01-26
      35            <NA> recovered         <NA>         2023-01-27        2023-01-27
      36      2023-02-02      died   2023-02-09         2023-01-28        2023-01-29
      37            <NA> recovered         <NA>         2023-01-27        2023-01-30
      38            <NA> recovered         <NA>         2023-01-25        2023-01-29
      39      2023-02-08      died   2023-02-21         2023-01-27        2023-01-31
      40      2023-02-05 recovered         <NA>         2023-01-29        2023-01-30
      41            <NA> recovered         <NA>         2023-01-24        2023-01-27
      42            <NA>      died   2023-02-15         2023-01-27        2023-01-31
      43            <NA> recovered         <NA>         2023-01-30        2023-02-02
      44            <NA> recovered         <NA>         2023-01-31        2023-02-01
      45            <NA> recovered         <NA>         2023-02-04        2023-02-05
      46            <NA> recovered         <NA>         2023-01-28        2023-02-01
      47            <NA> recovered         <NA>         2023-02-02        2023-02-02
      48            <NA> recovered         <NA>         2023-01-28        2023-02-01
      49            <NA> recovered         <NA>         2023-01-28        2023-02-04
      50            <NA> recovered         <NA>         2023-02-04        2023-02-06
      51            <NA>      died   2023-02-14         2023-02-06        2023-02-08
      52            <NA>      died   2023-02-13         2023-01-29        2023-02-01
      53            <NA> recovered         <NA>         2023-02-01        2023-02-08
      54            <NA>      died   2023-02-28         2023-02-04        2023-02-10
      55            <NA> recovered         <NA>         2023-02-08        2023-02-09
      56            <NA> recovered         <NA>         2023-02-11        2023-02-12
      57            <NA> recovered         <NA>         2023-02-14        2023-02-17
      58            <NA> recovered         <NA>         2023-02-12        2023-02-13
      59            <NA> recovered         <NA>         2023-02-14        2023-02-14
      60            <NA> recovered         <NA>         2023-02-18        2023-02-18
      61            <NA> recovered         <NA>         2023-02-26        2023-03-03
      62      2023-03-11      died   2023-03-25         2023-02-22        2023-02-24
      63            <NA> recovered         <NA>         2023-02-20        2023-02-23
      64            <NA> recovered         <NA>         2023-02-23        2023-02-26
      65            <NA> recovered         <NA>         2023-02-27        2023-03-04
      66            <NA> recovered         <NA>         2023-03-01        2023-03-03
      67            <NA> recovered         <NA>         2023-03-05        2023-03-10
      68            <NA> recovered         <NA>         2023-03-09        2023-03-11
      69      2023-03-16      died   2023-03-22         2023-03-05        2023-03-09
      70            <NA> recovered         <NA>         2023-03-18        2023-03-20
      71            <NA> recovered         <NA>         2023-03-16        2023-03-21
      72            <NA> recovered         <NA>         2023-03-09        2023-03-14
      73            <NA> recovered         <NA>         2023-03-08        2023-03-12
      74      2023-03-17 recovered         <NA>         2023-03-10        2023-03-12
      75            <NA> recovered         <NA>         2023-03-11        2023-03-15
      76            <NA> recovered         <NA>         2023-03-12        2023-03-19
      77      2023-03-31 recovered         <NA>         2023-03-15        2023-03-19
      78            <NA> recovered         <NA>         2023-03-15        2023-03-16
      79            <NA> recovered         <NA>         2023-03-09        2023-03-14
      80            <NA> recovered         <NA>         2023-03-14        2023-03-17
      81            <NA> recovered         <NA>         2023-03-13        2023-03-18
      82            <NA> recovered         <NA>         2023-03-15        2023-03-18
      83            <NA> recovered         <NA>         2023-03-16        2023-03-20
      84            <NA> recovered         <NA>         2023-03-23        2023-03-25
      85            <NA> recovered         <NA>         2023-03-19        2023-03-20
      86            <NA> recovered         <NA>         2023-03-21        2023-03-22
      87      2023-03-22      died   2023-04-03         2023-03-20        2023-03-21
      88            <NA> recovered         <NA>         2023-03-16        2023-03-16
      89            <NA> recovered         <NA>         2023-03-26        2023-03-28
      90            <NA> recovered         <NA>         2023-03-19        2023-03-24
      91            <NA> recovered         <NA>         2023-03-23        2023-03-24
      92            <NA> recovered         <NA>         2023-03-25        2023-03-26
      93            <NA> recovered         <NA>         2023-03-12        2023-03-17
      94            <NA>      died   2023-04-12         2023-03-24        2023-03-26
      95            <NA>      died   2023-04-20         2023-03-26        2023-03-30
      96            <NA> recovered         <NA>         2023-03-25        2023-03-27
      97      2023-04-03 recovered         <NA>         2023-03-28        2023-03-28
      98      2023-04-03 recovered         <NA>         2023-03-27        2023-04-01
      99            <NA> recovered         <NA>         2023-04-03        2023-04-06
      100           <NA> recovered         <NA>         2023-03-30        2023-04-03
      101     2023-04-12 recovered         <NA>         2023-04-05        2023-04-06
      102           <NA> recovered         <NA>         2023-03-27        2023-03-31
      103           <NA> recovered         <NA>         2023-03-21        2023-03-27
      104     2023-04-12 recovered         <NA>         2023-04-04        2023-04-06
      105           <NA> recovered         <NA>         2023-04-01        2023-04-05
      106           <NA> recovered         <NA>         2023-04-02        2023-04-03
      107     2023-04-13      died   2023-04-14         2023-04-07        2023-04-10
      108     2023-04-20      died   2023-04-28         2023-04-08        2023-04-08
      109           <NA> recovered         <NA>         2023-04-03        2023-04-07
      110           <NA> recovered         <NA>         2023-04-03        2023-04-05
      111           <NA>      died   2023-04-19         2023-04-06        2023-04-09
      112           <NA> recovered         <NA>         2023-04-01        2023-04-04
      113           <NA> recovered         <NA>         2023-04-12        2023-04-13
      114           <NA> recovered         <NA>         2023-04-11        2023-04-12
      115           <NA> recovered         <NA>         2023-03-26        2023-04-03
      116           <NA> recovered         <NA>         2023-03-30        2023-04-03
      117     2023-04-13      died   2023-04-18         2023-04-07        2023-04-08
      118           <NA> recovered         <NA>         2023-04-10        2023-04-13
      119           <NA> recovered         <NA>         2023-04-07        2023-04-10
      120           <NA> recovered         <NA>         2023-04-11        2023-04-13
      121           <NA> recovered         <NA>         2023-03-31        2023-04-06
      122           <NA> recovered         <NA>         2023-04-08        2023-04-14
      123           <NA> recovered         <NA>         2023-04-08        2023-04-11
      124           <NA> recovered         <NA>         2023-04-05        2023-04-12
      125           <NA> recovered         <NA>         2023-04-10        2023-04-11
      126           <NA> recovered         <NA>         2023-04-08        2023-04-11
      127           <NA> recovered         <NA>         2023-04-08        2023-04-12
      128           <NA>      died   2023-04-25         2023-04-17        2023-04-18
      129           <NA> recovered         <NA>         2023-04-12        2023-04-17
      130           <NA> recovered         <NA>         2023-04-07        2023-04-14
      131           <NA> recovered         <NA>         2023-04-14        2023-04-19
      132     2023-04-18      died   2023-05-02         2023-04-05        2023-04-14
      133     2023-04-27 recovered         <NA>         2023-04-19        2023-04-21
      134           <NA> recovered         <NA>         2023-04-20        2023-04-26
      135     2023-04-24 recovered         <NA>         2023-04-18        2023-04-25
      136     2023-04-29      died   2023-05-05         2023-04-18        2023-04-21
      137           <NA> recovered         <NA>         2023-04-13        2023-04-14
      138     2023-05-01 recovered         <NA>         2023-04-23        2023-04-27
      139           <NA> recovered         <NA>         2023-04-18        2023-04-22
      140           <NA> recovered         <NA>         2023-04-21        2023-04-25
      141     2023-04-26 recovered         <NA>         2023-04-26        2023-04-27
      142           <NA> recovered         <NA>         2023-05-02        2023-05-02
      143           <NA> recovered         <NA>         2023-04-28        2023-05-01
      144           <NA> recovered         <NA>         2023-04-21        2023-04-23
      145           <NA> recovered         <NA>         2023-04-22        2023-04-23
      146           <NA> recovered         <NA>         2023-05-02        2023-05-08
      147           <NA> recovered         <NA>         2023-05-06        2023-05-08
      148           <NA> recovered         <NA>         2023-04-27        2023-05-01
      149           <NA> recovered         <NA>         2023-04-16        2023-04-25
      150           <NA> recovered         <NA>         2023-04-25        2023-04-27
      151     2023-05-11 recovered         <NA>         2023-05-05        2023-05-07
      152           <NA> recovered         <NA>         2023-05-02        2023-05-06
      153           <NA> recovered         <NA>         2023-04-23        2023-04-26
      154           <NA> recovered         <NA>         2023-04-23        2023-04-27
      155           <NA> recovered         <NA>         2023-04-23        2023-04-27
      156           <NA> recovered         <NA>         2023-05-05        2023-05-08
      157           <NA> recovered         <NA>         2023-04-24        2023-04-27
      158     2023-05-21      died   2023-05-22         2023-05-05        2023-05-07
          ct_value
      1         NA
      2         NA
      3       24.8
      4         NA
      5       24.6
      6         NA
      7       26.5
      8         NA
      9       24.7
      10        NA
      11      24.5
      12      21.7
      13      21.5
      14      24.2
      15        NA
      16      23.1
      17        NA
      18        NA
      19      21.5
      20        NA
      21      21.5
      22      26.4
      23        NA
      24      25.2
      25        NA
      26        NA
      27        NA
      28      25.8
      29        NA
      30      21.7
      31      23.7
      32      24.8
      33        NA
      34      23.6
      35        NA
      36        NA
      37        NA
      38      25.3
      39      23.9
      40        NA
      41        NA
      42      27.8
      43      26.1
      44        NA
      45        NA
      46        NA
      47      24.3
      48        NA
      49        NA
      50        NA
      51        NA
      52      25.9
      53      24.2
      54        NA
      55      27.1
      56        NA
      57      27.1
      58      24.3
      59      24.5
      60        NA
      61      30.3
      62        NA
      63        NA
      64        NA
      65        NA
      66        NA
      67      25.2
      68      23.0
      69        NA
      70        NA
      71      25.7
      72      25.1
      73        NA
      74      20.0
      75      25.7
      76      27.2
      77      24.2
      78      27.5
      79        NA
      80      25.3
      81      27.2
      82        NA
      83      24.9
      84        NA
      85        NA
      86      25.2
      87      24.0
      88        NA
      89        NA
      90        NA
      91      26.8
      92      24.2
      93      29.1
      94      24.1
      95      23.7
      96      23.4
      97      25.2
      98        NA
      99        NA
      100       NA
      101     26.7
      102     27.8
      103       NA
      104       NA
      105     26.4
      106       NA
      107     20.5
      108     26.4
      109     28.1
      110     25.6
      111       NA
      112     18.6
      113     25.9
      114     23.8
      115       NA
      116     24.9
      117     23.2
      118     24.0
      119       NA
      120     25.3
      121     22.3
      122       NA
      123     25.3
      124       NA
      125       NA
      126       NA
      127       NA
      128       NA
      129     23.9
      130     25.8
      131     22.5
      132     27.2
      133     25.1
      134     18.6
      135       NA
      136     23.1
      137     24.6
      138     25.7
      139     26.2
      140       NA
      141       NA
      142       NA
      143       NA
      144       NA
      145     28.1
      146       NA
      147       NA
      148     23.7
      149     26.7
      150     22.0
      151     24.2
      152       NA
      153     23.7
      154     25.4
      155     22.5
      156     29.0
      157       NA
      158       NA
      
      $contacts
                                 from                          to age sex
      1              Lolette Phillips                  James Jack  90   m
      2              Lolette Phillips                 Chen Kantha   4   m
      3                    James Jack               Anisa Wilkins  86   f
      4                    James Jack             Saleema al-Zaki  29   f
      5                   Chen Kantha                David Ponzio  14   m
      6                   Chen Kantha            Christopher Ward  85   m
      7                   Chen Kantha               Yutitham Moua  18   m
      8               Saleema al-Zaki      Crystal Estrada-Chavez  59   f
      9                  David Ponzio                 Laura Ilaoa  25   f
      10                 David Ponzio                Morgan Mason  34   f
      11                 David Ponzio            Cornelius Turner  89   m
      12                 David Ponzio               Desmond Angel   5   m
      13             Christopher Ward          Shaddaad el-Younes  63   m
      14                 Morgan Mason           Jameela al-Arshad  50   f
      15                 Morgan Mason             Junaid el-Zaman   5   m
      16                 Morgan Mason             Sameeha el-Ally  89   f
      17             Cornelius Turner         Carlo Ceazar Corpuz  74   m
      18           Shaddaad el-Younes              Bishr al-Qasim  34   m
      19           Shaddaad el-Younes                  Sade Smith  47   f
      20           Shaddaad el-Younes             Edward Estrella  85   m
      21           Shaddaad el-Younes           Nichole Mcfarland  29   f
      22          Carlo Ceazar Corpuz            Aabdeen al-Hoque  24   m
      23               Bishr al-Qasim               Jubair el-Aly  46   m
      24               Bishr al-Qasim           Dalicia O'Donnell  63   f
      25               Bishr al-Qasim       Abdul Jaleel al-Amara  19   m
      26               Bishr al-Qasim            Hafsa al-Massoud  24   f
      27            Nichole Mcfarland            Qamraaa al-Rahim   9   f
      28            Nichole Mcfarland                Trever Manis  41   m
      29            Nichole Mcfarland          Maiya Vathanavarin  72   f
      30            Nichole Mcfarland            Ghaamid el-Zafar   6   m
      31                Jubair el-Aly           Nimesha Grossaint   9   f
      32             Hafsa al-Massoud      Kelly Runningbear-Paul  61   f
      33             Hafsa al-Massoud                James Welter  44   m
      34                 Trever Manis            Austin Manheimer  71   m
      35                 Trever Manis              Marco Martinez  34   m
      36                 Trever Manis          Utkarsh Strausburg  75   m
      37                 Trever Manis         Orville Stadelbauer  69   m
      38                 Trever Manis                Jennifer Ouk  61   f
      39                 Trever Manis               Amanda Cooper  67   f
      40           Maiya Vathanavarin            Nafeesa al-Zaher  64   f
      41           Maiya Vathanavarin        Sulaimaan al-Shabazz  11   m
      42           Maiya Vathanavarin    Savanna Gonzalez-Sanchez  59   f
      43             Ghaamid el-Zafar           Nawwaara el-Pasha  61   f
      44             Ghaamid el-Zafar          Saleet el-Mohammed  66   m
      45                 James Welter            Shuaib al-Farooq  16   m
      46             Austin Manheimer           Christian Mendoza  81   m
      47             Austin Manheimer            Alexander Rivera  88   m
      48                 Jennifer Ouk               Jameel Mosher  53   m
      49                 Jennifer Ouk                Eraina Mcgee  53   f
      50             Nafeesa al-Zaher                   Mia Floyd  45   f
      51             Nafeesa al-Zaher           Khongmong Hammond  42   m
      52             Nafeesa al-Zaher               Collin Chavez  42   m
      53             Nafeesa al-Zaher              Itzel Gonzales  78   f
      54            Nawwaara el-Pasha            Alexis Caramillo  35   f
      55            Nawwaara el-Pasha             Ronnie Scurlock  54   m
      56            Nawwaara el-Pasha            Brandon Maryland  54   m
      57           Saleet el-Mohammed                 Shane Ahmad  68   m
      58           Saleet el-Mohammed         Ghaaliya al-Shaheed   3   f
      59           Saleet el-Mohammed               Exzinia Smith  44   f
      60            Christian Mendoza          Jamaal el-Shehadeh  35   m
      61                 Eraina Mcgee          Joshua Nava Quiroz  23   m
      62                 Eraina Mcgee           Rhiannon Freeland  62   f
      63                 Eraina Mcgee              Deisha Beckner  35   f
      64                    Mia Floyd                 Nelly Reyez  90   f
      65                    Mia Floyd       Nadheera el-Mohiuddin  25   f
      66               Itzel Gonzales                 Renae Joyce  41   f
      67              Ronnie Scurlock             Cairra Trammell  17   m
      68              Ronnie Scurlock      Nakrista Ramirez-Solis  26   f
      69                  Shane Ahmad            Madelyn Mckinney  61   f
      70                  Shane Ahmad        Caroline Vargas Pena  46   f
      71          Ghaaliya al-Shaheed                 Whitney Kim  57   f
      72                Exzinia Smith             Mathurin Curtis   8   m
      73                Exzinia Smith             Hissa al-Hammad  11   f
      74            Rhiannon Freeland                Yuvorn Huang  56   m
      75               Deisha Beckner              Chandel Duling  32   f
      76               Deisha Beckner                 Kevin Shahi  63   m
      77               Deisha Beckner              Diksha Reichal  54   f
      78               Deisha Beckner                   Yusuf Cha  22   m
      79        Nadheera el-Mohiuddin            Jazmine Sturgeon  67   f
      80        Nadheera el-Mohiuddin               Afaaf al-Azzi  83   f
      81        Nadheera el-Mohiuddin              Medhavi Nguyen  16   f
      82        Nadheera el-Mohiuddin             Russell Lathrop  38   m
      83         Caroline Vargas Pena             Kimiko Thompson  19   f
      84              Mathurin Curtis            Sally Richardson  37   f
      85              Mathurin Curtis             Markese Labadie  46   m
      86              Mathurin Curtis         Christian Maldonado  64   m
      87                  Kevin Shahi              Laraena Batson  73   f
      88                  Kevin Shahi                   Monica Ye  13   f
      89               Diksha Reichal              Kashauna Yorks  72   f
      90               Diksha Reichal                 Mark Miller  12   m
      91             Jazmine Sturgeon                Taylor Lange  52   f
      92             Jazmine Sturgeon           Carmelita Montoya  61   f
      93             Jazmine Sturgeon              Gloria Johnson   9   f
      94             Jazmine Sturgeon               Alexander Roy   9   m
      95             Jazmine Sturgeon            Habeeba el-Ahmad  42   f
      96             Sally Richardson            Aliyya el-Yassin  22   f
      97               Laraena Batson                  Alicia Vue  29   f
      98                    Monica Ye                    Micah La  15   m
      99                    Monica Ye               Cassandra Lor  69   f
      100                   Monica Ye            Rashele Williams  17   f
      101                   Monica Ye             Deviny Mcdonald  21   f
      102                   Monica Ye                  Daniel San  54   m
      103                   Monica Ye                Shamari Bean  20   f
      104                   Monica Ye            De'Chelle Norman   9   f
      105           Carmelita Montoya               Connor Bailey  26   m
      106           Carmelita Montoya             Lafaith Hopkins  80   f
      107           Carmelita Montoya             Isabella Medina  71   f
      108           Carmelita Montoya              Lauren Etsitty  57   f
      109           Carmelita Montoya               Shelby Tinoco  77   f
      110                  Alicia Vue           Samuel Goodfellow  90   m
      111            Rashele Williams              Sapphire Bison  58   f
      112            Rashele Williams                Bertha Mohar  23   f
      113             Isabella Medina           Mu,Aawiya al-Kaba  35   m
      114           Samuel Goodfellow              Joshua Johnson  66   m
      115                Bertha Mohar               Andrew Garcia  62   m
      116                Bertha Mohar              Jennifer Silva  62   f
      117                Bertha Mohar                 Megan Begay  34   f
      118                Bertha Mohar             Trevor Colligan  57   m
      119           Mu,Aawiya al-Kaba               Taaj el-Sarah  44   m
      120           Mu,Aawiya al-Kaba               Wen Kang Khan  22   m
      121               Andrew Garcia              Savannah Cohen  57   f
      122               Andrew Garcia              Nawfa el-Anwar  63   f
      123             Trevor Colligan              Yusri al-Amiri   7   m
      124             Trevor Colligan                  Ryan Zheng  46   m
      125             Trevor Colligan              Henry Reichman  66   m
      126               Taaj el-Sarah             Sidqi al-Rahimi   4   m
      127               Taaj el-Sarah             Mastoor al-Imam  10   m
      128              Savannah Cohen            Muhaajir el-Reza  68   m
      129              Savannah Cohen            Shannon Armbrust  68   f
      130              Savannah Cohen                Orilea Diego  12   f
      131              Nawfa el-Anwar            Jez-Mas Marchman  51   m
      132              Nawfa el-Anwar                  Kloe Avila  51   f
      133                  Ryan Zheng           Weston Feuerstein   8   m
      134              Henry Reichman            Rebekah Jones Jr  55   f
      135            Shannon Armbrust                Madison Osse  77   f
      136            Shannon Armbrust            Merrill Jr Woods  22   m
      137                Orilea Diego              Sarah Griffith   2   f
      138                Orilea Diego                 Kara Finken  53   f
      139                  Kloe Avila                  Elyse Tran  31   f
      140                  Kloe Avila             Jumail al-Murad  77   m
      141                  Kloe Avila         Raul Aguirre Molina  76   m
      142                  Kloe Avila               Mikayla Smith  82   f
      143                  Kloe Avila           Marissa Tollivoro  12   f
      144              Sarah Griffith         Mansoor al-Siddique  25   m
      145              Sarah Griffith            Nizaam al-Salame  76   m
      146                 Kara Finken              Alexis Harding  14   f
      147                 Kara Finken            Amanda Scharnell  31   f
      148                 Kara Finken              Jaesung Fukuda  90   m
      149                 Kara Finken                Unique Vigil  76   f
      150         Raul Aguirre Molina         Aldo Rodriguez-Ruiz  30   m
      151               Mikayla Smith         Rosemary Thammarath  32   f
      152         Mansoor al-Siddique                Tanya Mcadoo  78   f
      153         Mansoor al-Siddique                Shawn Morgan  75   m
      154         Mansoor al-Siddique              Asysa Robinson  76   f
      155            Nizaam al-Salame             Najlaa al-Salam  88   f
      156              Alexis Harding            Sakeena al-Abdoo  80   f
      157              Alexis Harding                Richard Prum  41   m
      158              Alexis Harding            Shahla al-Jaffer  78   f
      159              Alexis Harding                Jaycee Baker  11   m
      160              Alexis Harding             Rida al-Hussein  57   m
      161                Unique Vigil              Deliah Vannice  79   f
      162                Tanya Mcadoo               Kailey Braden  28   f
      163                Tanya Mcadoo          Raadiya el-Chahine   2   f
      164                Shawn Morgan                 Payton Dodd  16   f
      165              Asysa Robinson            Janie Santa Cruz  82   f
      166            Sakeena al-Abdoo             Maritza Winkler  51   f
      167            Sakeena al-Abdoo          Shabeeba al-Jafari  54   f
      168                Richard Prum               Keeman Naylor  76   m
      169                Richard Prum           Yesenia Alexander  56   f
      170                Richard Prum               Alvaro Romero   5   m
      171            Shahla al-Jaffer              Lane Rodriguez   1   m
      172               Kailey Braden                      Ka Lee  44   m
      173               Kailey Braden             Qaaid al-Shaker  76   m
      174            Janie Santa Cruz              Munsif al-Ozer   3   m
      175               Alvaro Romero               Sharon Watson  15   f
      176               Alvaro Romero          Danielle Ouellette  19   f
      177               Alvaro Romero Abdur Rasheed al-Salahuddin  76   m
      178              Lane Rodriguez                 Trevor Hahs  12   m
      179             Qaaid al-Shaker       Abdul Kareem el-Salem  43   m
      180             Qaaid al-Shaker            Sharaf al-Akbari   9   m
      181             Qaaid al-Shaker             Samuel Videtzky  90   m
      182             Qaaid al-Shaker              Fikra el-Bilal   7   f
      183              Munsif al-Ozer           Jeremy Stockinger  15   m
      184              Munsif al-Ozer                 Raul Chavez  54   m
      185          Danielle Ouellette        Shalise Peters-Maloy  64   f
      186          Danielle Ouellette             Lizbeth Herrera  21   f
      187          Danielle Ouellette                 Yael Pruitt  37   f
      188          Danielle Ouellette                  Jay Herman  35   m
      189          Danielle Ouellette          Nadheera al-Farrah  70   f
      190 Abdur Rasheed al-Salahuddin                 Jason Ahsan  70   m
      191 Abdur Rasheed al-Salahuddin                 Grant Jiron  59   m
      192 Abdur Rasheed al-Salahuddin              Brittany Myers  77   f
      193 Abdur Rasheed al-Salahuddin               Tracy Conners  75   m
      194 Abdur Rasheed al-Salahuddin             Manaara el-Saba  84   f
      195             Samuel Videtzky             Amelia Gallegos  18   f
      196             Samuel Videtzky             Brieannah Coles  79   f
      197        Shalise Peters-Maloy              T'Koia Waddles  14   f
      198        Shalise Peters-Maloy                    Sarah Vu  49   f
      199        Shalise Peters-Maloy               Mason Powells  56   m
      200        Shalise Peters-Maloy               Ashley Dotson  76   f
      201                  Jay Herman     Abdul Ghafoor al-Firman  41   m
      202                  Jay Herman              Chasity Suetos  16   f
      203                  Jay Herman                 Tyler Vigil   3   m
      204             Manaara el-Saba              Vincent Arnick  29   m
      205             Manaara el-Saba            Billye Dalrymple  89   f
      206             Manaara el-Saba          Devundrick Mcgrier  24   m
      207             Manaara el-Saba               Damian Sotelo  31   m
      208             Amelia Gallegos              Razeen al-Sala  39   m
      209             Amelia Gallegos              Rusty Figueroa  32   m
      210             Amelia Gallegos                  Emma Jones   9   f
      211             Brieannah Coles                Randall Asad  82   m
      212                    Sarah Vu               Cam Tu Quilon  39   f
      213               Mason Powells              Fisayo Wallace  12   m
      214               Ashley Dotson               Bianca Gaytan  54   f
      215               Ashley Dotson           Bao-Tran Hasegawa  68   f
      216     Abdul Ghafoor al-Firman            Antonio John III  73   m
      217     Abdul Ghafoor al-Firman                Jacob Helfer  85   m
      218     Abdul Ghafoor al-Firman           Alejandra Purdham  52   f
      219     Abdul Ghafoor al-Firman           Frankie Armstrong   3   f
      220              Vincent Arnick              Yahya el-Aslam  22   m
      221              Vincent Arnick          Katherine Redhorse   5   f
      222              Razeen al-Sala                  Oscar Mora  66   m
      223              Razeen al-Sala             Nabeel el-Karam  68   m
      224              Rusty Figueroa       Kamaaluddeen al-Saidi  38   m
      225              Rusty Figueroa            Sandra Rodriquez  57   f
      226              Rusty Figueroa              Joshua Henzler  48   m
      227                  Emma Jones               Julisa Cortez  75   f
      228               Cam Tu Quilon             Ameen al-Shakir   8   m
      229           Alejandra Purdham               Azmi el-Safar  28   m
      230           Alejandra Purdham             Khampane Kazemi  21   m
      231              Yahya el-Aslam             Laaiqa el-Azizi   2   f
      232              Yahya el-Aslam                  Jose Lopez  84   m
      233             Nabeel el-Karam             Mreenal Solberg  52   f
      234             Nabeel el-Karam                  Kevin Behr  58   m
      235             Nabeel el-Karam               Khyleah Jones  29   f
      236            Sandra Rodriquez              Eliora Baldwin   7   f
      237             Ameen al-Shakir               Quinn Barrett  30   m
      238             Ameen al-Shakir               Gina Mcmaster  11   f
      239             Laaiqa el-Azizi             Bryanna Medrano  71   f
      240             Laaiqa el-Azizi                  Alex Salaz  50   m
      241                  Jose Lopez               Abeer el-Kazi  77   f
      242                  Jose Lopez                Marques Rice  43   m
      243                  Jose Lopez            Haakima el-Kanan  19   f
      244                  Jose Lopez      Andrew Zaragoza-Madrid  40   m
      245                  Jose Lopez                  Alec Cross  49   m
      246                  Jose Lopez             Braxton Lefholz  11   m
      247                  Jose Lopez              Richard Miller  15   m
      248                  Jose Lopez                 Roy Coleman  61   m
      249               Khyleah Jones             Julanne El-Amin  46   f
      250               Khyleah Jones               Jason Sowards  69   m
      251               Khyleah Jones                Yeeleng Tran  69   m
      252               Khyleah Jones                  Isaac Reid  38   m
      253               Quinn Barrett           Lawrence Williams  28   m
      254               Quinn Barrett                Adrian Anaya  82   m
      255             Bryanna Medrano               Amanda Wilson  45   f
      256             Bryanna Medrano              Azza el-Husain  47   f
      257                Marques Rice              Colette Torres  19   f
      258      Andrew Zaragoza-Madrid      Kamaaluddeen al-Semaan  85   m
      259             Julanne El-Amin           Esmeralda Escobar  24   f
      260             Julanne El-Amin                   Jose Luna  46   m
      261               Jason Sowards   Ummu Kulthoom al-Ghaffari  71   f
      262               Jason Sowards            Samuel Mcclaskey  69   m
      263                Yeeleng Tran                  Luna Vigil   4   f
      264                Yeeleng Tran               Jasmine Evans  31   f
      265                  Isaac Reid              Gericko Griego  18   m
      266                  Isaac Reid               Javon Jenkins  16   m
      267                  Isaac Reid             Clifton Charron  53   m
      268           Lawrence Williams                Ashley Allen  62   f
      269           Lawrence Williams           Saeed el-Abdallah  87   m
      270                Adrian Anaya            Yeun Jung Khanom  28   f
      271                Adrian Anaya               Jazmine Berry  42   f
      272              Colette Torres                Tyree Reeves  42   m
      273                   Jose Luna         Cuauhtemoc Martinez  84   m
      274                   Jose Luna          Tawheed al-Noorani  29   m
      275   Ummu Kulthoom al-Ghaffari          Zuhaira al-Mohamed  47   f
      276   Ummu Kulthoom al-Ghaffari              Zachary Stuart  14   m
      277                  Luna Vigil             Naseer el-Javed  48   m
      278               Javon Jenkins             Alexis Stafford  89   f
      279               Javon Jenkins              Razeen el-Azad  39   m
      280               Javon Jenkins             Kaylee Valverde  17   f
      281             Clifton Charron             Jordan Marshall  20   f
      282             Clifton Charron   Marissa Iron Cloud-Gresko  61   f
      283              Zachary Stuart                Marcus Erman   6   m
      284             Naseer el-Javed             Ismad al-Badour  28   m
      285             Alexis Stafford                Colin Moreno  83   m
      286             Alexis Stafford                 Lydia Major  68   f
      287             Alexis Stafford             Fidda el-Satter  47   f
      288             Jordan Marshall          Daifallah al-Shaer  73   m
      289             Jordan Marshall             Farhat al-Masih  24   f
      290             Jordan Marshall            Firdaus el-Farha  42   f
      291             Jordan Marshall                  Jane David  71   f
      292                Marcus Erman              Corina Morales   9   f
      293                Marcus Erman            Alexandra Lucero  78   f
      294             Ismad al-Badour             Raabia el-Saidi  24   f
      295             Ismad al-Badour               Justin Delori  61   m
      296            Firdaus el-Farha                Lael Holguin  49   f
      297            Firdaus el-Farha              Janalen Nguyen  53   f
      298            Firdaus el-Farha           Sanaaa el-Mohamed  63   f
      299                  Jane David                  Judy Ahuna  29   f
      300                  Jane David             Naseera al-Arif  76   f
      301                  Jane David                  Andrew Sun  69   m
      302              Corina Morales               Bailey Walker  63   f
      303              Corina Morales                    Ty Rains  50   m
      304              Corina Morales              Maribel Rangel  58   f
      305              Janalen Nguyen                 Logan Major  88   m
      306              Janalen Nguyen               Javier Valdez   7   m
      307              Janalen Nguyen             Jennifer Mallot  51   f
      308             Naseera al-Arif            Richard Kelemeni  47   m
      309             Naseera al-Arif                Kyana Ludwig  45   f
      310             Naseera al-Arif                Jessie Berry  83   f
      311             Naseera al-Arif                  Luis Ellis  30   m
      312                  Andrew Sun               Jazmyn Guyton  41   f
      313                    Ty Rains              Asiah Sheppard  15   f
      314                    Ty Rains             Katryna Stevens  27   f
      315                    Ty Rains                  Gia Garcia  88   f
      316               Javier Valdez               Hannah Wright  74   f
      317                Kyana Ludwig              Ryan Gutierrez   1   m
      318                Kyana Ludwig         Autumn Perez-Lozano  84   f
      319                Jessie Berry               John Trujillo  79   m
      320               Jazmyn Guyton              Azzaam al-Azad  54   m
      321               Jazmyn Guyton           Saafiyya el-Idris  24   f
      322               Jazmyn Guyton             Nicholas Taylor  37   m
      323                  Gia Garcia            Mujahid el-Zaman   3   m
      324                  Gia Garcia          Stephanie Vincelet  48   f
      325               John Trujillo                Haley Hamlin  82   f
      326                Haley Hamlin             Larissa Herrera  30   f
          date_first_contact date_last_contact was_case           status
      1           2022-12-30        2023-01-01        Y             case
      2           2023-01-04        2023-01-04        Y             case
      3           2023-01-04        2023-01-05        N lost_to_followup
      4           2023-01-04        2023-01-07        Y             case
      5           2023-01-04        2023-01-06        Y             case
      6           2022-12-31        2023-01-04        Y             case
      7           2023-01-04        2023-01-04        N   under_followup
      8           2022-12-31        2023-01-05        N   under_followup
      9           2023-01-04        2023-01-06        Y             case
      10          2023-01-06        2023-01-08        Y             case
      11          2023-01-01        2023-01-07        Y             case
      12          2023-01-04        2023-01-07        N   under_followup
      13          2023-01-09        2023-01-12        Y             case
      14          2023-01-07        2023-01-13        N   under_followup
      15          2023-01-08        2023-01-13        N   under_followup
      16          2023-01-13        2023-01-15        N   under_followup
      17          2023-01-09        2023-01-13        Y             case
      18          2023-01-12        2023-01-15        Y             case
      19          2023-01-13        2023-01-15        N   under_followup
      20          2023-01-10        2023-01-14        N   under_followup
      21          2023-01-07        2023-01-13        Y             case
      22          2023-01-16        2023-01-18        N   under_followup
      23          2023-01-11        2023-01-14        Y             case
      24          2023-01-14        2023-01-16        N   under_followup
      25          2023-01-12        2023-01-13        N lost_to_followup
      26          2023-01-12        2023-01-16        Y             case
      27          2023-01-12        2023-01-15        N   under_followup
      28          2023-01-15        2023-01-17        Y             case
      29          2023-01-15        2023-01-16        Y             case
      30          2023-01-13        2023-01-17        Y             case
      31          2023-01-11        2023-01-15        N   under_followup
      32          2023-01-16        2023-01-17        Y             case
      33          2023-01-12        2023-01-16        Y             case
      34          2023-01-23        2023-01-23        Y             case
      35          2023-01-24        2023-01-26        N lost_to_followup
      36          2023-01-18        2023-01-22        N lost_to_followup
      37          2023-01-21        2023-01-23        Y             case
      38          2023-01-20        2023-01-23        Y             case
      39          2023-01-19        2023-01-24        N lost_to_followup
      40          2023-01-18        2023-01-20        Y             case
      41          2023-01-20        2023-01-21        N   under_followup
      42          2023-01-21        2023-01-23        N   under_followup
      43          2023-01-24        2023-01-25        Y             case
      44          2023-01-17        2023-01-22        Y             case
      45          2023-01-11        2023-01-15        N   under_followup
      46          2023-01-28        2023-01-29        Y             case
      47          2023-01-29        2023-01-31        N   under_followup
      48          2023-01-19        2023-01-24        N lost_to_followup
      49          2023-01-22        2023-01-27        Y             case
      50          2023-01-26        2023-01-27        Y             case
      51          2023-01-24        2023-01-26        N   under_followup
      52          2023-01-23        2023-01-26        Y             case
      53          2023-01-23        2023-01-28        Y             case
      54          2023-01-21        2023-01-23        Y             case
      55          2023-01-23        2023-01-27        Y             case
      56          2023-01-19        2023-01-23        N   under_followup
      57          2023-01-26        2023-01-26        Y             case
      58          2023-01-27        2023-01-27        Y             case
      59          2023-01-28        2023-01-29        Y             case
      60          2023-01-28        2023-01-30        N   under_followup
      61          2023-01-23        2023-01-28        N          unknown
      62          2023-01-27        2023-01-30        Y             case
      63          2023-01-25        2023-01-29        Y             case
      64          2023-01-27        2023-01-31        Y             case
      65          2023-01-29        2023-01-30        Y             case
      66          2023-01-31        2023-02-05        N   under_followup
      67          2023-01-28        2023-01-29        N   under_followup
      68          2023-01-27        2023-01-28        N lost_to_followup
      69          2023-01-26        2023-01-31        N   under_followup
      70          2023-01-24        2023-01-27        Y             case
      71          2023-01-27        2023-01-29        N lost_to_followup
      72          2023-01-27        2023-01-31        Y             case
      73          2023-01-27        2023-02-02        N lost_to_followup
      74          2023-01-27        2023-02-01        N   under_followup
      75          2023-01-27        2023-02-02        N   under_followup
      76          2023-01-30        2023-02-02        Y             case
      77          2023-01-31        2023-02-01        Y             case
      78          2023-01-27        2023-02-01        N lost_to_followup
      79          2023-02-04        2023-02-05        Y             case
      80          2023-01-30        2023-02-02        N   under_followup
      81          2023-02-03        2023-02-04        N   under_followup
      82          2023-02-03        2023-02-05        N   under_followup
      83          2023-01-27        2023-01-31        N   under_followup
      84          2023-01-28        2023-02-01        Y             case
      85          2023-02-02        2023-02-03        N   under_followup
      86          2023-01-31        2023-02-03        N          unknown
      87          2023-02-02        2023-02-02        Y             case
      88          2023-01-28        2023-02-01        Y             case
      89          2023-01-28        2023-02-04        Y             case
      90          2023-01-25        2023-01-30        N   under_followup
      91          2023-01-30        2023-02-04        N          unknown
      92          2023-02-04        2023-02-06        Y             case
      93          2023-01-30        2023-02-03        N   under_followup
      94          2023-02-02        2023-02-04        N lost_to_followup
      95          2023-02-05        2023-02-07        N   under_followup
      96          2023-02-06        2023-02-08        Y             case
      97          2023-01-29        2023-02-01        Y             case
      98          2023-01-31        2023-02-05        N   under_followup
      99          2023-01-31        2023-02-04        N   under_followup
      100         2023-02-01        2023-02-08        Y             case
      101         2023-02-06        2023-02-07        N   under_followup
      102         2023-02-01        2023-02-06        N lost_to_followup
      103         2023-02-01        2023-02-04        N   under_followup
      104         2023-01-28        2023-02-02        N   under_followup
      105         2023-02-03        2023-02-06        N   under_followup
      106         2023-02-02        2023-02-08        N   under_followup
      107         2023-02-04        2023-02-10        Y             case
      108         2023-02-06        2023-02-08        N   under_followup
      109         2023-02-04        2023-02-08        N   under_followup
      110         2023-02-08        2023-02-09        Y             case
      111         2023-02-06        2023-02-11        N   under_followup
      112         2023-02-11        2023-02-12        Y             case
      113         2023-02-14        2023-02-17        Y             case
      114         2023-02-10        2023-02-13        N lost_to_followup
      115         2023-02-12        2023-02-13        Y             case
      116         2023-02-13        2023-02-16        N   under_followup
      117         2023-02-11        2023-02-13        N   under_followup
      118         2023-02-14        2023-02-14        Y             case
      119         2023-02-18        2023-02-18        Y             case
      120         2023-02-17        2023-02-22        N   under_followup
      121         2023-02-26        2023-03-03        Y             case
      122         2023-02-22        2023-02-24        Y             case
      123         2023-02-20        2023-02-26        N lost_to_followup
      124         2023-02-20        2023-02-23        Y             case
      125         2023-02-23        2023-02-26        Y             case
      126         2023-02-15        2023-02-19        N          unknown
      127         2023-02-20        2023-02-21        N   under_followup
      128         2023-03-06        2023-03-07        N   under_followup
      129         2023-02-27        2023-03-04        Y             case
      130         2023-03-01        2023-03-03        Y             case
      131         2023-03-06        2023-03-09        N   under_followup
      132         2023-03-05        2023-03-10        Y             case
      133         2023-03-07        2023-03-09        N   under_followup
      134         2023-02-22        2023-03-01        N   under_followup
      135         2023-03-04        2023-03-09        N   under_followup
      136         2023-03-05        2023-03-09        N   under_followup
      137         2023-03-09        2023-03-11        Y             case
      138         2023-03-05        2023-03-09        Y             case
      139         2023-03-13        2023-03-18        N lost_to_followup
      140         2023-03-23        2023-03-23        N lost_to_followup
      141         2023-03-18        2023-03-20        Y             case
      142         2023-03-16        2023-03-21        Y             case
      143         2023-03-16        2023-03-20        N   under_followup
      144         2023-03-09        2023-03-14        Y             case
      145         2023-03-08        2023-03-12        Y             case
      146         2023-03-10        2023-03-12        Y             case
      147         2023-03-08        2023-03-09        N   under_followup
      148         2023-03-08        2023-03-11        N          unknown
      149         2023-03-11        2023-03-15        Y             case
      150         2023-03-24        2023-03-29        N   under_followup
      151         2023-03-24        2023-03-27        N   under_followup
      152         2023-03-12        2023-03-19        Y             case
      153         2023-03-15        2023-03-19        Y             case
      154         2023-03-15        2023-03-16        Y             case
      155         2023-03-12        2023-03-14        N   under_followup
      156         2023-03-09        2023-03-14        Y             case
      157         2023-03-14        2023-03-17        Y             case
      158         2023-03-13        2023-03-18        Y             case
      159         2023-03-09        2023-03-15        N   under_followup
      160         2023-03-09        2023-03-14        N   under_followup
      161         2023-03-10        2023-03-13        N   under_followup
      162         2023-03-15        2023-03-18        Y             case
      163         2023-03-16        2023-03-20        Y             case
      164         2023-03-22        2023-03-25        N lost_to_followup
      165         2023-03-23        2023-03-25        Y             case
      166         2023-03-19        2023-03-22        N   under_followup
      167         2023-03-19        2023-03-20        N   under_followup
      168         2023-03-18        2023-03-22        N   under_followup
      169         2023-03-17        2023-03-20        N   under_followup
      170         2023-03-19        2023-03-20        Y             case
      171         2023-03-21        2023-03-22        Y             case
      172         2023-03-20        2023-03-21        Y             case
      173         2023-03-16        2023-03-16        Y             case
      174         2023-03-26        2023-03-28        Y             case
      175         2023-03-19        2023-03-24        Y             case
      176         2023-03-23        2023-03-24        Y             case
      177         2023-03-25        2023-03-26        Y             case
      178         2023-03-25        2023-03-25        N   under_followup
      179         2023-03-20        2023-03-20        N   under_followup
      180         2023-03-14        2023-03-20        N   under_followup
      181         2023-03-12        2023-03-17        Y             case
      182         2023-03-19        2023-03-20        N   under_followup
      183         2023-03-30        2023-04-02        N lost_to_followup
      184         2023-04-02        2023-04-04        N lost_to_followup
      185         2023-03-24        2023-03-26        Y             case
      186         2023-03-28        2023-03-29        N          unknown
      187         2023-03-25        2023-03-28        N   under_followup
      188         2023-03-26        2023-03-30        Y             case
      189         2023-03-28        2023-03-30        N   under_followup
      190         2023-03-23        2023-03-27        N   under_followup
      191         2023-03-22        2023-03-27        N   under_followup
      192         2023-03-24        2023-03-29        N   under_followup
      193         2023-03-24        2023-03-28        N   under_followup
      194         2023-03-25        2023-03-27        Y             case
      195         2023-03-28        2023-03-28        Y             case
      196         2023-03-27        2023-04-01        Y             case
      197         2023-04-04        2023-04-07        N   under_followup
      198         2023-04-03        2023-04-06        Y             case
      199         2023-03-30        2023-04-03        Y             case
      200         2023-04-05        2023-04-06        Y             case
      201         2023-03-27        2023-03-31        Y             case
      202         2023-03-27        2023-04-01        N   under_followup
      203         2023-03-31        2023-03-31        N   under_followup
      204         2023-03-21        2023-03-27        Y             case
      205         2023-03-28        2023-03-30        N   under_followup
      206         2023-03-24        2023-03-28        N   under_followup
      207         2023-03-22        2023-03-29        N   under_followup
      208         2023-04-04        2023-04-06        Y             case
      209         2023-04-01        2023-04-05        Y             case
      210         2023-04-02        2023-04-03        Y             case
      211         2023-03-29        2023-03-29        N   under_followup
      212         2023-04-07        2023-04-10        Y             case
      213         2023-04-08        2023-04-08        Y             case
      214         2023-04-09        2023-04-10        N   under_followup
      215         2023-04-03        2023-04-07        N   under_followup
      216         2023-04-06        2023-04-06        N   under_followup
      217         2023-04-03        2023-04-06        N   under_followup
      218         2023-04-03        2023-04-07        Y             case
      219         2023-04-02        2023-04-07        N   under_followup
      220         2023-04-03        2023-04-05        Y             case
      221         2023-03-30        2023-04-02        N lost_to_followup
      222         2023-04-04        2023-04-06        N   under_followup
      223         2023-04-06        2023-04-09        Y             case
      224         2023-04-02        2023-04-04        N lost_to_followup
      225         2023-04-01        2023-04-04        Y             case
      226         2023-03-28        2023-04-02        N   under_followup
      227         2023-04-08        2023-04-11        N   under_followup
      228         2023-04-12        2023-04-13        Y             case
      229         2023-04-11        2023-04-12        Y             case
      230         2023-04-12        2023-04-14        N   under_followup
      231         2023-03-26        2023-04-03        Y             case
      232         2023-03-30        2023-04-03        Y             case
      233         2023-04-07        2023-04-08        Y             case
      234         2023-04-10        2023-04-13        Y             case
      235         2023-04-07        2023-04-10        Y             case
      236         2023-04-09        2023-04-11        N          unknown
      237         2023-04-11        2023-04-13        Y             case
      238         2023-04-12        2023-04-15        N          unknown
      239         2023-03-31        2023-04-06        Y             case
      240         2023-04-02        2023-04-05        N lost_to_followup
      241         2023-04-07        2023-04-12        N   under_followup
      242         2023-04-08        2023-04-14        Y             case
      243         2023-04-14        2023-04-16        N          unknown
      244         2023-04-08        2023-04-11        Y             case
      245         2023-04-07        2023-04-10        N   under_followup
      246         2023-04-08        2023-04-10        N   under_followup
      247         2023-04-09        2023-04-14        N   under_followup
      248         2023-04-05        2023-04-10        N lost_to_followup
      249         2023-04-05        2023-04-12        Y             case
      250         2023-04-10        2023-04-11        Y             case
      251         2023-04-08        2023-04-11        Y             case
      252         2023-04-08        2023-04-12        Y             case
      253         2023-04-17        2023-04-18        Y             case
      254         2023-04-12        2023-04-17        Y             case
      255         2023-04-15        2023-04-16        N lost_to_followup
      256         2023-04-15        2023-04-16        N   under_followup
      257         2023-04-07        2023-04-14        Y             case
      258         2023-04-14        2023-04-17        N lost_to_followup
      259         2023-04-18        2023-04-18        N   under_followup
      260         2023-04-14        2023-04-19        Y             case
      261         2023-04-05        2023-04-14        Y             case
      262         2023-04-07        2023-04-12        N          unknown
      263         2023-04-19        2023-04-21        Y             case
      264         2023-04-20        2023-04-26        Y             case
      265         2023-04-23        2023-04-25        N          unknown
      266         2023-04-18        2023-04-25        Y             case
      267         2023-04-18        2023-04-21        Y             case
      268         2023-04-13        2023-04-16        N lost_to_followup
      269         2023-04-14        2023-04-19        N   under_followup
      270         2023-04-17        2023-04-18        N   under_followup
      271         2023-04-16        2023-04-19        N   under_followup
      272         2023-04-14        2023-04-16        N lost_to_followup
      273         2023-04-27        2023-04-27        N   under_followup
      274         2023-04-25        2023-04-29        N   under_followup
      275         2023-04-12        2023-04-15        N   under_followup
      276         2023-04-13        2023-04-14        Y             case
      277         2023-04-23        2023-04-27        Y             case
      278         2023-04-18        2023-04-22        Y             case
      279         2023-04-21        2023-04-25        Y             case
      280         2023-04-23        2023-04-24        N          unknown
      281         2023-04-26        2023-04-27        Y             case
      282         2023-04-25        2023-04-26        N   under_followup
      283         2023-05-02        2023-05-02        Y             case
      284         2023-04-28        2023-05-01        Y             case
      285         2023-04-28        2023-04-30        N   under_followup
      286         2023-04-26        2023-04-28        N   under_followup
      287         2023-04-27        2023-04-28        N   under_followup
      288         2023-04-21        2023-04-23        N   under_followup
      289         2023-04-19        2023-04-21        N   under_followup
      290         2023-04-21        2023-04-23        Y             case
      291         2023-04-22        2023-04-23        Y             case
      292         2023-05-02        2023-05-08        Y             case
      293         2023-05-05        2023-05-07        N   under_followup
      294         2023-05-07        2023-05-08        N   under_followup
      295         2023-05-06        2023-05-08        Y             case
      296         2023-04-30        2023-05-03        N   under_followup
      297         2023-04-27        2023-05-01        Y             case
      298         2023-05-05        2023-05-07        N lost_to_followup
      299         2023-04-22        2023-04-27        N          unknown
      300         2023-04-16        2023-04-25        Y             case
      301         2023-04-25        2023-04-27        Y             case
      302         2023-05-07        2023-05-10        N          unknown
      303         2023-05-05        2023-05-07        Y             case
      304         2023-05-03        2023-05-09        N          unknown
      305         2023-05-01        2023-05-04        N lost_to_followup
      306         2023-05-02        2023-05-06        Y             case
      307         2023-05-03        2023-05-09        N   under_followup
      308         2023-04-24        2023-04-25        N lost_to_followup
      309         2023-04-23        2023-04-26        Y             case
      310         2023-04-23        2023-04-27        Y             case
      311         2023-04-26        2023-04-26        N   under_followup
      312         2023-04-23        2023-04-27        Y             case
      313         2023-05-05        2023-05-08        N lost_to_followup
      314         2023-05-05        2023-05-08        N lost_to_followup
      315         2023-05-05        2023-05-08        Y             case
      316         2023-05-11        2023-05-11        N   under_followup
      317         2023-04-19        2023-04-25        N   under_followup
      318         2023-04-20        2023-04-27        N   under_followup
      319         2023-04-24        2023-04-27        Y             case
      320         2023-04-27        2023-04-30        N   under_followup
      321         2023-04-30        2023-05-02        N   under_followup
      322         2023-04-28        2023-04-29        N lost_to_followup
      323         2023-05-14        2023-05-16        N   under_followup
      324         2023-05-07        2023-05-12        N          unknown
      325         2023-05-05        2023-05-07        Y             case
      326         2023-05-10        2023-05-12        N   under_followup
      

# sim_outbreak works as expected

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
      $linelist
         id              case_name case_type sex age date_onset date_reporting
      1   1           Kevin Pullen suspected   m   1 2023-01-01     2023-01-01
      2   2 Carisa Flores-Gonzalez confirmed   f  29 2023-01-01     2023-01-01
      3   3       Maazin el-Othman confirmed   m  78 2023-01-01     2023-01-01
      4   5       Faisal el-Vaziri suspected   m  70 2023-01-01     2023-01-01
      5   6           Lynsey Duron confirmed   f  28 2023-01-01     2023-01-01
      6   8         Lilibeth Black confirmed   f  61 2023-01-01     2023-01-01
      7  11        Kaleb Natarelli confirmed   m  86 2023-01-01     2023-01-01
      8  12         Collin Stimack confirmed   m  71 2023-01-01     2023-01-01
      9  13       Marquaja Johnson confirmed   f  51 2023-01-01     2023-01-01
      10 18           Corey Alcala  probable   m  49 2023-01-02     2023-01-02
      11 20            Erin Payson suspected   f   7 2023-01-02     2023-01-02
      12 22          Sean Shrestha confirmed   m  24 2023-01-02     2023-01-02
         date_admission   outcome date_outcome date_first_contact date_last_contact
      1      2023-01-04      died   2023-01-18               <NA>              <NA>
      2      2023-01-02      died   2023-02-09         2022-12-26        2023-01-02
      3            <NA> recovered         <NA>         2022-12-30        2023-01-03
      4      2023-01-05 recovered         <NA>         2022-12-31        2023-01-03
      5      2023-01-14 recovered         <NA>         2023-01-01        2023-01-02
      6            <NA> recovered         <NA>         2023-01-02        2023-01-06
      7            <NA> recovered         <NA>         2023-01-01        2023-01-04
      8      2023-01-02 recovered         <NA>         2022-12-26        2023-01-03
      9            <NA> recovered         <NA>         2023-01-02        2023-01-05
      10           <NA> recovered         <NA>         2023-01-06        2023-01-09
      11           <NA> recovered         <NA>         2023-01-01        2023-01-03
      12           <NA> recovered         <NA>         2023-01-02        2023-01-05
         ct_value
      1        NA
      2      25.8
      3      24.9
      4        NA
      5      24.5
      6      26.4
      7      27.3
      8      20.2
      9      26.1
      10       NA
      11       NA
      12     25.7
      
      $contacts
                           from                       to age sex date_first_contact
      1            Kevin Pullen   Carisa Flores-Gonzalez  29   f         2022-12-26
      2            Kevin Pullen         Maazin el-Othman  78   m         2022-12-30
      3  Carisa Flores-Gonzalez           Katelyn Catlin  22   f         2022-12-31
      4  Carisa Flores-Gonzalez         Faisal el-Vaziri  70   m         2022-12-31
      5        Maazin el-Othman             Lynsey Duron  28   f         2023-01-01
      6        Maazin el-Othman          Amaani al-Gaber  37   f         2023-01-04
      7        Maazin el-Othman           Lilibeth Black  61   f         2023-01-02
      8        Faisal el-Vaziri             Jorge Marten  46   m         2023-01-04
      9            Lynsey Duron             Jacy Cousins  67   f         2023-01-02
      10         Lilibeth Black          Kaleb Natarelli  86   m         2023-01-01
      11         Lilibeth Black           Collin Stimack  71   m         2022-12-26
      12         Lilibeth Black         Marquaja Johnson  51   f         2023-01-02
      13        Kaleb Natarelli          Nicholas Orgill  44   m         2023-01-01
      14        Kaleb Natarelli              Kayla Tudor  49   f         2023-01-04
      15        Kaleb Natarelli           Maria Eberhart  60   f         2022-12-30
      16         Collin Stimack              Katja Muetz  56   f         2022-12-31
      17       Marquaja Johnson             Corey Alcala  49   m         2023-01-06
      18       Marquaja Johnson Francisco Zapata Morales  50   m         2023-01-02
      19       Marquaja Johnson              Erin Payson   7   f         2023-01-01
      20       Marquaja Johnson               Kevin Waid  20   m         2022-12-30
      21           Corey Alcala            Sean Shrestha  24   m         2023-01-02
         date_last_contact was_case           status
      1         2023-01-02        Y             case
      2         2023-01-03        Y             case
      3         2023-01-02        N   under_followup
      4         2023-01-03        Y             case
      5         2023-01-02        Y             case
      6         2023-01-04        N   under_followup
      7         2023-01-06        Y             case
      8         2023-01-05        N lost_to_followup
      9         2023-01-05        N lost_to_followup
      10        2023-01-04        Y             case
      11        2023-01-03        Y             case
      12        2023-01-05        Y             case
      13        2023-01-04        N   under_followup
      14        2023-01-05        N   under_followup
      15        2023-01-03        N   under_followup
      16        2023-01-03        N          unknown
      17        2023-01-09        Y             case
      18        2023-01-04        N lost_to_followup
      19        2023-01-03        Y             case
      20        2023-01-02        N lost_to_followup
      21        2023-01-05        Y             case
      

# sim_outbreak works as expected with anonymised

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
      $linelist
         id  case_name case_type sex age date_onset date_reporting date_admission
      1   1 OvsRrRMCAJ confirmed   m   1 2023-01-01     2023-01-01     2023-01-04
      2   2 FEY3qKY39Z  probable   f  29 2023-01-01     2023-01-01     2023-01-02
      3   3 yiuuoY8Kxn confirmed   m  78 2023-01-01     2023-01-01           <NA>
      4   5 Huaqm1SzNb  probable   m  70 2023-01-01     2023-01-01     2023-01-05
      5   6 O5h4yEtT6t suspected   f  28 2023-01-01     2023-01-01     2023-01-14
      6   8 8e6yKFNmyd  probable   f  61 2023-01-01     2023-01-01           <NA>
      7  11 Lkhw9tYeb1 confirmed   m  86 2023-01-01     2023-01-01           <NA>
      8  12 elczXnmE3U suspected   m  71 2023-01-01     2023-01-01     2023-01-02
      9  13 4HDzSVgVAW confirmed   f  51 2023-01-01     2023-01-01           <NA>
      10 18 To9HLY9VZd  probable   m  49 2023-01-02     2023-01-02           <NA>
      11 20 czwJ3WvUcV confirmed   f   7 2023-01-02     2023-01-02           <NA>
      12 22 vu5Ak6RZkf confirmed   m  24 2023-01-02     2023-01-02           <NA>
           outcome date_outcome date_first_contact date_last_contact ct_value
      1       died   2023-01-18               <NA>              <NA>     26.4
      2       died   2023-02-09         2022-12-26        2023-01-02       NA
      3  recovered         <NA>         2022-12-30        2023-01-03     26.1
      4  recovered         <NA>         2022-12-31        2023-01-03       NA
      5  recovered         <NA>         2023-01-01        2023-01-02       NA
      6  recovered         <NA>         2023-01-02        2023-01-06       NA
      7  recovered         <NA>         2023-01-01        2023-01-04     23.9
      8  recovered         <NA>         2022-12-26        2023-01-03       NA
      9  recovered         <NA>         2023-01-02        2023-01-05     22.3
      10 recovered         <NA>         2023-01-06        2023-01-09       NA
      11 recovered         <NA>         2023-01-01        2023-01-03     24.2
      12 recovered         <NA>         2023-01-02        2023-01-05     25.6
      
      $contacts
               from         to age sex date_first_contact date_last_contact was_case
      1  OvsRrRMCAJ FEY3qKY39Z  29   f         2022-12-26        2023-01-02        Y
      2  OvsRrRMCAJ yiuuoY8Kxn  78   m         2022-12-30        2023-01-03        Y
      3  FEY3qKY39Z g7AzDS6oXf  22   f         2022-12-31        2023-01-02        N
      4  FEY3qKY39Z Huaqm1SzNb  70   m         2022-12-31        2023-01-03        Y
      5  yiuuoY8Kxn O5h4yEtT6t  28   f         2023-01-01        2023-01-02        Y
      6  yiuuoY8Kxn ejRt34oCba  37   f         2023-01-04        2023-01-04        N
      7  yiuuoY8Kxn 8e6yKFNmyd  61   f         2023-01-02        2023-01-06        Y
      8  Huaqm1SzNb PL7XeZaLTm  46   m         2023-01-04        2023-01-05        N
      9  O5h4yEtT6t hWsVUBVWYT  67   f         2023-01-02        2023-01-05        N
      10 8e6yKFNmyd Lkhw9tYeb1  86   m         2023-01-01        2023-01-04        Y
      11 8e6yKFNmyd elczXnmE3U  71   m         2022-12-26        2023-01-03        Y
      12 8e6yKFNmyd 4HDzSVgVAW  51   f         2023-01-02        2023-01-05        Y
      13 Lkhw9tYeb1 QihvSfYVAR  44   m         2023-01-01        2023-01-04        N
      14 Lkhw9tYeb1 DjDafq8m2z  49   f         2023-01-04        2023-01-05        N
      15 Lkhw9tYeb1 bFUJRewLYt  60   f         2022-12-30        2023-01-03        N
      16 elczXnmE3U BBlIdUTzmc  56   f         2022-12-31        2023-01-03        N
      17 4HDzSVgVAW To9HLY9VZd  49   m         2023-01-06        2023-01-09        Y
      18 4HDzSVgVAW zuuT3p6Kxu  50   m         2023-01-02        2023-01-04        N
      19 4HDzSVgVAW czwJ3WvUcV   7   f         2023-01-01        2023-01-03        Y
      20 4HDzSVgVAW V4dJ6ZKaUK  20   m         2022-12-30        2023-01-02        N
      21 To9HLY9VZd vu5Ak6RZkf  24   m         2023-01-02        2023-01-05        Y
                   status
      1              case
      2              case
      3    under_followup
      4              case
      5              case
      6    under_followup
      7              case
      8    under_followup
      9  lost_to_followup
      10             case
      11             case
      12             case
      13   under_followup
      14   under_followup
      15   under_followup
      16          unknown
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
         id         case_name case_type sex age date_onset date_reporting
      1   1   Wajdi al-Demian  probable   m   1 2023-01-01     2023-01-01
      2   2       Durine Cobb confirmed   f  29 2023-01-01     2023-01-01
      3   3     Raaid el-Diab suspected   m  78 2023-01-01     2023-01-01
      4   5    Nickolas Nault confirmed   m  70 2023-01-01     2023-01-01
      5   6    Shanta Holiday suspected   f  28 2023-01-01     2023-01-01
      6   8     Mackenzie Ahn  probable   f  61 2023-01-01     2023-01-01
      7  11 Mubarak el-Vaziri  probable   m  86 2023-01-01     2023-01-01
      8  12  Raakaan al-Shams suspected   m  71 2023-01-01     2023-01-01
      9  13  Mikhaila Carlson confirmed   f  51 2023-01-01     2023-01-01
      10 18    Tae Woo Nguyen confirmed   m  49 2023-01-02     2023-01-02
      11 20      Annie Carter  probable   f   7 2023-01-02     2023-01-02
      12 22    Thomas Morales  probable   m  24 2023-01-02     2023-01-02
         date_admission   outcome date_outcome date_first_contact date_last_contact
      1      2023-01-04 recovered         <NA>               <NA>              <NA>
      2            <NA> recovered         <NA>         2022-12-26        2023-01-02
      3            <NA> recovered         <NA>         2022-12-30        2023-01-03
      4      2023-01-05 recovered         <NA>         2022-12-31        2023-01-03
      5      2023-01-14 recovered         <NA>         2023-01-01        2023-01-02
      6            <NA> recovered         <NA>         2023-01-02        2023-01-06
      7            <NA> recovered         <NA>         2023-01-01        2023-01-04
      8            <NA> recovered         <NA>         2022-12-26        2023-01-03
      9            <NA> recovered         <NA>         2023-01-02        2023-01-05
      10           <NA> recovered         <NA>         2023-01-06        2023-01-09
      11           <NA> recovered         <NA>         2023-01-01        2023-01-03
      12           <NA> recovered         <NA>         2023-01-02        2023-01-05
         ct_value
      1        NA
      2      25.2
      3        NA
      4      25.7
      5        NA
      6        NA
      7        NA
      8        NA
      9      26.1
      10     22.7
      11       NA
      12       NA
      
      $contacts
                      from                     to age sex date_first_contact
      1    Wajdi al-Demian            Durine Cobb  29   f         2022-12-26
      2    Wajdi al-Demian          Raaid el-Diab  78   m         2022-12-30
      3        Durine Cobb            Hope Arshad  22   f         2022-12-31
      4        Durine Cobb         Nickolas Nault  70   m         2022-12-31
      5      Raaid el-Diab         Shanta Holiday  28   f         2023-01-01
      6      Raaid el-Diab           Darian Guyon  37   f         2023-01-04
      7      Raaid el-Diab          Mackenzie Ahn  61   f         2023-01-02
      8     Nickolas Nault            Hee Kennedy  46   m         2023-01-04
      9     Shanta Holiday         Chandra Kilian  67   f         2023-01-02
      10     Mackenzie Ahn      Mubarak el-Vaziri  86   m         2023-01-01
      11     Mackenzie Ahn       Raakaan al-Shams  71   m         2022-12-26
      12     Mackenzie Ahn       Mikhaila Carlson  51   f         2023-01-02
      13 Mubarak el-Vaziri        Ricardo Sanchez  44   m         2023-01-01
      14 Mubarak el-Vaziri      Alexandra Johnson  49   f         2023-01-04
      15 Mubarak el-Vaziri          Kanani Nguyen  60   f         2022-12-30
      16  Raakaan al-Shams Nirvana Elizalde Villa  56   f         2022-12-31
      17  Mikhaila Carlson         Tae Woo Nguyen  49   m         2023-01-06
      18  Mikhaila Carlson         Alexander Orio  50   m         2023-01-02
      19  Mikhaila Carlson           Annie Carter   7   f         2023-01-01
      20  Mikhaila Carlson         Jared Chambers  20   m         2022-12-30
      21    Tae Woo Nguyen         Thomas Morales  24   m         2023-01-02
         date_last_contact was_case           status
      1         2023-01-02        Y             case
      2         2023-01-03        Y             case
      3         2023-01-02        N          unknown
      4         2023-01-03        Y             case
      5         2023-01-02        Y             case
      6         2023-01-04        N lost_to_followup
      7         2023-01-06        Y             case
      8         2023-01-05        N lost_to_followup
      9         2023-01-05        N          unknown
      10        2023-01-04        Y             case
      11        2023-01-03        Y             case
      12        2023-01-05        Y             case
      13        2023-01-04        N          unknown
      14        2023-01-05        N   under_followup
      15        2023-01-03        N   under_followup
      16        2023-01-03        N   under_followup
      17        2023-01-09        Y             case
      18        2023-01-04        N   under_followup
      19        2023-01-03        Y             case
      20        2023-01-02        N   under_followup
      21        2023-01-05        Y             case
      

# sim_outbreak works as expected with age structure

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
      $linelist
         id                 case_name case_type sex age date_onset date_reporting
      1   1             Gabriel Black  probable   m  11 2023-01-01     2023-01-01
      2   2             Taylor Graves confirmed   f  10 2023-01-01     2023-01-01
      3   3              Tyler Kelley suspected   m  80 2023-01-01     2023-01-01
      4   5              Cody Morales  probable   m   4 2023-01-01     2023-01-01
      5   6         Cheyenne Sayavong confirmed   f  84 2023-01-01     2023-01-01
      6   8 Chantelle Vazquez-Luevano confirmed   f  88 2023-01-01     2023-01-01
      7  11           Rushdi al-Ishak confirmed   m  71 2023-01-01     2023-01-01
      8  12        Pierce Khanthavong suspected   m  78 2023-01-01     2023-01-01
      9  13               Megan Hayes confirmed   f  28 2023-01-01     2023-01-01
      10 18           Jackson Carlson confirmed   m  51 2023-01-02     2023-01-02
      11 20             Susana Varela  probable   f  75 2023-01-02     2023-01-02
      12 22           Qaaid al-Madani  probable   m  48 2023-01-02     2023-01-02
         date_admission   outcome date_outcome date_first_contact date_last_contact
      1            <NA> recovered         <NA>               <NA>              <NA>
      2            <NA> recovered         <NA>         2022-12-26        2023-01-02
      3            <NA> recovered         <NA>         2022-12-30        2023-01-03
      4            <NA> recovered         <NA>         2022-12-31        2023-01-03
      5            <NA> recovered         <NA>         2023-01-01        2023-01-02
      6            <NA> recovered         <NA>         2023-01-02        2023-01-06
      7            <NA> recovered         <NA>         2023-01-01        2023-01-04
      8      2023-01-04 recovered         <NA>         2022-12-26        2023-01-03
      9            <NA> recovered         <NA>         2023-01-02        2023-01-05
      10           <NA> recovered         <NA>         2023-01-06        2023-01-09
      11     2023-01-06 recovered         <NA>         2023-01-01        2023-01-03
      12           <NA> recovered         <NA>         2023-01-02        2023-01-05
         ct_value
      1        NA
      2      28.2
      3        NA
      4        NA
      5      25.0
      6      19.2
      7      22.8
      8        NA
      9      28.1
      10     23.0
      11       NA
      12       NA
      
      $contacts
                              from                        to age sex
      1              Gabriel Black             Taylor Graves  10   f
      2              Gabriel Black              Tyler Kelley  80   m
      3              Taylor Graves             Carolyn Moore  19   f
      4              Taylor Graves              Cody Morales   4   m
      5               Tyler Kelley         Cheyenne Sayavong  84   f
      6               Tyler Kelley         Mercedes Lovelace  86   f
      7               Tyler Kelley Chantelle Vazquez-Luevano  88   f
      8               Cody Morales                 Joewid Le  79   m
      9          Cheyenne Sayavong                 Kendra To  31   f
      10 Chantelle Vazquez-Luevano           Rushdi al-Ishak  71   m
      11 Chantelle Vazquez-Luevano        Pierce Khanthavong  78   m
      12 Chantelle Vazquez-Luevano               Megan Hayes  28   f
      13           Rushdi al-Ishak         Preston Barringer   1   m
      14           Rushdi al-Ishak         Amanda Larochelle  13   f
      15           Rushdi al-Ishak         Dominique Raymond  61   f
      16        Pierce Khanthavong            Natalie Newton  24   f
      17               Megan Hayes           Jackson Carlson  51   m
      18               Megan Hayes               Sam Spencer  73   m
      19               Megan Hayes             Susana Varela  75   f
      20               Megan Hayes          Bassaam el-Majid  25   m
      21           Jackson Carlson           Qaaid al-Madani  48   m
         date_first_contact date_last_contact was_case           status
      1          2022-12-26        2023-01-02        Y             case
      2          2022-12-30        2023-01-03        Y             case
      3          2022-12-31        2023-01-02        N   under_followup
      4          2022-12-31        2023-01-03        Y             case
      5          2023-01-01        2023-01-02        Y             case
      6          2023-01-04        2023-01-04        N   under_followup
      7          2023-01-02        2023-01-06        Y             case
      8          2023-01-04        2023-01-05        N   under_followup
      9          2023-01-02        2023-01-05        N lost_to_followup
      10         2023-01-01        2023-01-04        Y             case
      11         2022-12-26        2023-01-03        Y             case
      12         2023-01-02        2023-01-05        Y             case
      13         2023-01-01        2023-01-04        N   under_followup
      14         2023-01-04        2023-01-05        N   under_followup
      15         2022-12-30        2023-01-03        N   under_followup
      16         2022-12-31        2023-01-03        N   under_followup
      17         2023-01-06        2023-01-09        Y             case
      18         2023-01-02        2023-01-04        N   under_followup
      19         2023-01-01        2023-01-03        Y             case
      20         2022-12-30        2023-01-02        N   under_followup
      21         2023-01-02        2023-01-05        Y             case
      

