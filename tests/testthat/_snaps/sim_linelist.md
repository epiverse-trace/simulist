# sim_linelist works as expected with defaults

    Code
      sim_linelist()
    Output
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
      2             <NA> recovered         <NA>         2022-12-29        2023-01-03
      3             <NA> recovered         <NA>         2022-12-28        2023-01-01
      4             <NA> recovered         <NA>         2022-12-28        2023-01-04
      5       2023-01-09      died   2023-01-23         2022-12-31        2023-01-04
      6       2023-01-08 recovered         <NA>         2022-12-31        2023-01-06
      7             <NA> recovered         <NA>         2023-01-02        2023-01-07
      8       2023-01-24      died   2023-01-27         2023-01-03        2023-01-07
      9             <NA> recovered         <NA>         2023-01-03        2023-01-11
      10            <NA> recovered         <NA>         2023-01-04        2023-01-09
      11            <NA> recovered         <NA>         2023-01-09        2023-01-17
      12            <NA> recovered         <NA>         2023-01-07        2023-01-14
      13            <NA> recovered         <NA>         2023-01-07        2023-01-17
      14            <NA> recovered         <NA>         2023-01-08        2023-01-15
      15      2023-01-19      died   2023-01-27         2023-01-09        2023-01-16
      16            <NA> recovered         <NA>         2023-01-08        2023-01-14
      17            <NA> recovered         <NA>         2023-01-07        2023-01-13
      18            <NA> recovered         <NA>         2023-01-10        2023-01-16
      19            <NA> recovered         <NA>         2023-01-12        2023-01-15
      20      2023-02-10 recovered         <NA>         2023-01-12        2023-01-18
      21            <NA>      died   2023-02-05         2023-01-16        2023-01-21
      22            <NA> recovered         <NA>         2023-01-19        2023-01-23
      23            <NA> recovered         <NA>         2023-01-18        2023-01-24
      24            <NA> recovered         <NA>         2023-01-17        2023-01-21
      25            <NA> recovered         <NA>         2023-01-18        2023-01-21
      26            <NA> recovered         <NA>         2023-01-19        2023-01-25
      27            <NA> recovered         <NA>         2023-01-23        2023-01-28
      28      2023-01-30      died   2023-02-16         2023-01-20        2023-01-28
      29            <NA> recovered         <NA>         2023-01-22        2023-01-25
      30      2023-02-11 recovered         <NA>         2023-01-20        2023-01-27
      31            <NA> recovered         <NA>         2023-01-23        2023-01-29
      32            <NA> recovered         <NA>         2023-01-17        2023-01-24
      33            <NA>      died   2023-02-14         2023-01-21        2023-01-26
      34      2023-01-29 recovered         <NA>         2023-01-17        2023-01-22
      35            <NA> recovered         <NA>         2023-01-15        2023-01-22
      36      2023-02-02      died   2023-02-09         2023-01-20        2023-01-23
      37            <NA> recovered         <NA>         2023-01-27        2023-01-31
      38            <NA> recovered         <NA>         2023-01-26        2023-02-01
      39      2023-02-08      died   2023-02-21         2023-01-28        2023-02-02
      40      2023-02-05 recovered         <NA>         2023-01-27        2023-01-30
      41            <NA> recovered         <NA>         2023-01-19        2023-01-28
      42            <NA>      died   2023-02-15         2023-01-25        2023-02-02
      43            <NA> recovered         <NA>         2023-01-26        2023-02-01
      44            <NA> recovered         <NA>         2023-01-26        2023-01-30
      45            <NA> recovered         <NA>         2023-01-31        2023-02-02
      46            <NA> recovered         <NA>         2023-01-30        2023-02-05
      47            <NA> recovered         <NA>         2023-01-28        2023-01-30
      48            <NA> recovered         <NA>         2023-01-24        2023-02-03
      49            <NA> recovered         <NA>         2023-01-28        2023-02-05
      50            <NA> recovered         <NA>         2023-02-03        2023-02-05
      51            <NA>      died   2023-02-14         2023-01-31        2023-02-04
      52            <NA>      died   2023-02-13         2023-01-27        2023-02-02
      53            <NA> recovered         <NA>         2023-01-28        2023-02-09
      54            <NA>      died   2023-02-28         2023-01-31        2023-02-10
      55            <NA> recovered         <NA>         2023-01-31        2023-02-05
      56            <NA> recovered         <NA>         2023-02-04        2023-02-08
      57            <NA> recovered         <NA>         2023-02-10        2023-02-17
      58            <NA> recovered         <NA>         2023-02-08        2023-02-13
      59            <NA> recovered         <NA>         2023-02-10        2023-02-12
      60            <NA> recovered         <NA>         2023-02-10        2023-02-16
      61            <NA> recovered         <NA>         2023-02-24        2023-03-01
      62      2023-03-11      died   2023-03-25         2023-02-21        2023-02-26
      63            <NA> recovered         <NA>         2023-02-20        2023-02-26
      64            <NA> recovered         <NA>         2023-02-22        2023-02-26
      65            <NA> recovered         <NA>         2023-03-01        2023-03-07
      66            <NA> recovered         <NA>         2023-03-01        2023-03-04
      67            <NA> recovered         <NA>         2023-02-27        2023-03-13
      68            <NA> recovered         <NA>         2023-03-09        2023-03-11
      69      2023-03-16      died   2023-03-22         2023-03-09        2023-03-13
      70            <NA> recovered         <NA>         2023-03-15        2023-03-20
      71            <NA> recovered         <NA>         2023-03-16        2023-03-23
      72            <NA> recovered         <NA>         2023-03-08        2023-03-15
      73            <NA> recovered         <NA>         2023-03-07        2023-03-14
      74      2023-03-17 recovered         <NA>         2023-03-09        2023-03-11
      75            <NA> recovered         <NA>         2023-03-03        2023-03-13
      76            <NA> recovered         <NA>         2023-03-11        2023-03-22
      77      2023-03-31 recovered         <NA>         2023-03-14        2023-03-19
      78            <NA> recovered         <NA>         2023-03-14        2023-03-16
      79            <NA> recovered         <NA>         2023-03-09        2023-03-18
      80            <NA> recovered         <NA>         2023-03-08        2023-03-16
      81            <NA> recovered         <NA>         2023-03-11        2023-03-18
      82            <NA> recovered         <NA>         2023-03-10        2023-03-18
      83            <NA> recovered         <NA>         2023-03-14        2023-03-19
      84            <NA> recovered         <NA>         2023-03-20        2023-03-26
      85            <NA> recovered         <NA>         2023-03-15        2023-03-19
      86            <NA> recovered         <NA>         2023-03-13        2023-03-20
      87      2023-03-22      died   2023-04-03         2023-03-14        2023-03-16
      88            <NA> recovered         <NA>         2023-03-13        2023-03-15
      89            <NA> recovered         <NA>         2023-03-24        2023-03-28
      90            <NA> recovered         <NA>         2023-03-20        2023-03-27
      91            <NA> recovered         <NA>         2023-03-18        2023-03-23
      92            <NA> recovered         <NA>         2023-03-17        2023-03-23
      93            <NA> recovered         <NA>         2023-03-12        2023-03-21
      94            <NA>      died   2023-04-12         2023-03-23        2023-03-28
      95            <NA>      died   2023-04-20         2023-03-22        2023-03-30
      96            <NA> recovered         <NA>         2023-03-24        2023-03-27
      97      2023-04-03 recovered         <NA>         2023-03-22        2023-03-27
      98      2023-04-03 recovered         <NA>         2023-03-23        2023-04-01
      99            <NA> recovered         <NA>         2023-04-03        2023-04-06
      100           <NA> recovered         <NA>         2023-03-31        2023-04-07
      101     2023-04-12 recovered         <NA>         2023-04-01        2023-04-04
      102           <NA> recovered         <NA>         2023-03-26        2023-04-02
      103           <NA> recovered         <NA>         2023-03-24        2023-04-02
      104     2023-04-12 recovered         <NA>         2023-03-24        2023-04-01
      105           <NA> recovered         <NA>         2023-03-26        2023-04-03
      106           <NA> recovered         <NA>         2023-03-29        2023-03-31
      107     2023-04-13      died   2023-04-14         2023-04-04        2023-04-10
      108     2023-04-20      died   2023-04-28         2023-04-02        2023-04-05
      109           <NA> recovered         <NA>         2023-03-30        2023-04-07
      110           <NA> recovered         <NA>         2023-03-31        2023-04-03
      111           <NA>      died   2023-04-19         2023-04-02        2023-04-08
      112           <NA> recovered         <NA>         2023-03-31        2023-04-04
      113           <NA> recovered         <NA>         2023-04-09        2023-04-12
      114           <NA> recovered         <NA>         2023-04-06        2023-04-11
      115           <NA> recovered         <NA>         2023-04-01        2023-04-10
      116           <NA> recovered         <NA>         2023-04-02        2023-04-06
      117     2023-04-13      died   2023-04-18         2023-04-03        2023-04-09
      118           <NA> recovered         <NA>         2023-04-06        2023-04-11
      119           <NA> recovered         <NA>         2023-04-03        2023-04-11
      120           <NA> recovered         <NA>         2023-04-09        2023-04-14
      121           <NA> recovered         <NA>         2023-03-30        2023-04-08
      122           <NA> recovered         <NA>         2023-04-02        2023-04-15
      123           <NA> recovered         <NA>         2023-04-08        2023-04-12
      124           <NA> recovered         <NA>         2023-04-09        2023-04-17
      125           <NA> recovered         <NA>         2023-04-09        2023-04-11
      126           <NA> recovered         <NA>         2023-04-08        2023-04-13
      127           <NA> recovered         <NA>         2023-04-06        2023-04-14
      128           <NA>      died   2023-04-25         2023-04-11        2023-04-15
      129           <NA> recovered         <NA>         2023-04-13        2023-04-19
      130           <NA> recovered         <NA>         2023-04-11        2023-04-20
      131           <NA> recovered         <NA>         2023-04-13        2023-04-21
      132     2023-04-18      died   2023-05-02         2023-04-10        2023-04-20
      133     2023-04-27 recovered         <NA>         2023-04-14        2023-04-22
      134           <NA> recovered         <NA>         2023-04-15        2023-04-26
      135     2023-04-24 recovered         <NA>         2023-04-19        2023-04-27
      136     2023-04-29      died   2023-05-05         2023-04-20        2023-04-23
      137           <NA> recovered         <NA>         2023-04-11        2023-04-14
      138     2023-05-01 recovered         <NA>         2023-04-23        2023-04-29
      139           <NA> recovered         <NA>         2023-04-15        2023-04-24
      140           <NA> recovered         <NA>         2023-04-16        2023-04-24
      141     2023-04-26 recovered         <NA>         2023-04-16        2023-04-22
      142           <NA> recovered         <NA>         2023-04-28        2023-05-01
      143           <NA> recovered         <NA>         2023-04-23        2023-05-01
      144           <NA> recovered         <NA>         2023-04-19        2023-04-23
      145           <NA> recovered         <NA>         2023-04-16        2023-04-22
      146           <NA> recovered         <NA>         2023-04-29        2023-05-09
      147           <NA> recovered         <NA>         2023-05-03        2023-05-07
      148           <NA> recovered         <NA>         2023-04-25        2023-05-05
      149           <NA> recovered         <NA>         2023-04-19        2023-05-02
      150           <NA> recovered         <NA>         2023-04-18        2023-04-25
      151     2023-05-11 recovered         <NA>         2023-05-01        2023-05-07
      152           <NA> recovered         <NA>         2023-04-25        2023-05-06
      153           <NA> recovered         <NA>         2023-04-19        2023-04-26
      154           <NA> recovered         <NA>         2023-04-20        2023-04-27
      155           <NA> recovered         <NA>         2023-04-25        2023-04-30
      156           <NA> recovered         <NA>         2023-05-05        2023-05-10
      157           <NA> recovered         <NA>         2023-04-22        2023-04-28
      158     2023-05-21      died   2023-05-22         2023-04-27        2023-05-03
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

# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
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
      2      2023-01-02      died   2023-02-09         2022-12-30        2023-01-08
      3            <NA> recovered         <NA>         2022-12-31        2023-01-05
      4      2023-01-05 recovered         <NA>         2022-12-31        2023-01-04
      5      2023-01-14 recovered         <NA>         2022-12-29        2023-01-02
      6            <NA> recovered         <NA>         2022-12-28        2023-01-05
      7            <NA> recovered         <NA>         2022-12-30        2023-01-04
      8      2023-01-02 recovered         <NA>         2022-12-28        2023-01-09
      9            <NA> recovered         <NA>         2022-12-29        2023-01-04
      10           <NA> recovered         <NA>         2022-12-29        2023-01-04
      11           <NA> recovered         <NA>         2022-12-31        2023-01-03
      12           <NA> recovered         <NA>         2022-12-27        2023-01-05
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

# sim_linelist works as expected with age-strat risks

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
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
      2            <NA> recovered         <NA>         2022-12-30        2023-01-08
      3            <NA> recovered         <NA>         2022-12-31        2023-01-05
      4      2023-01-05 recovered         <NA>         2022-12-31        2023-01-04
      5      2023-01-14 recovered         <NA>         2022-12-29        2023-01-02
      6            <NA> recovered         <NA>         2022-12-28        2023-01-05
      7            <NA> recovered         <NA>         2022-12-30        2023-01-04
      8            <NA> recovered         <NA>         2022-12-28        2023-01-09
      9            <NA> recovered         <NA>         2022-12-29        2023-01-04
      10           <NA> recovered         <NA>         2022-12-29        2023-01-04
      11           <NA> recovered         <NA>         2022-12-31        2023-01-03
      12           <NA> recovered         <NA>         2022-12-27        2023-01-05
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

# sim_linelist works as expected with anonymous

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
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
      2       died   2023-02-09         2022-12-30        2023-01-08       NA
      3  recovered         <NA>         2022-12-31        2023-01-05     26.1
      4  recovered         <NA>         2022-12-31        2023-01-04       NA
      5  recovered         <NA>         2022-12-29        2023-01-02       NA
      6  recovered         <NA>         2022-12-28        2023-01-05       NA
      7  recovered         <NA>         2022-12-30        2023-01-04     23.9
      8  recovered         <NA>         2022-12-28        2023-01-09       NA
      9  recovered         <NA>         2022-12-29        2023-01-04     22.3
      10 recovered         <NA>         2022-12-29        2023-01-04       NA
      11 recovered         <NA>         2022-12-31        2023-01-03     24.2
      12 recovered         <NA>         2022-12-27        2023-01-05     25.6

# sim_linelist works as expected with age structure

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        population_age = age_struct)
    Output
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

# sim_linelist works as expected with age-strat risks & age struct

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, population_age = age_struct)
    Output
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

# sim_linelist works as expected with modified config

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution = function(n) stats::rgeom(
          n = n, prob = 0.5)))
    Output
         id             case_name case_type sex age date_onset date_reporting
      1   1          Claire Hicks confirmed   f  44 2023-01-01     2023-01-01
      2   2           Ashwini Ali confirmed   f  77 2023-01-01     2023-01-01
      3   3         Danielle Kuhn  probable   f  90 2023-01-01     2023-01-01
      4   5       Treven Gallegos confirmed   m  19 2023-01-01     2023-01-01
      5   6         Lauren Nguyen suspected   f  17 2023-01-01     2023-01-01
      6   8        Mahdi al-Amini  probable   m  75 2023-01-01     2023-01-01
      7  11      Brandon O'Reilly confirmed   m  46 2023-01-01     2023-01-01
      8  12           Selena Chun confirmed   f  19 2023-01-01     2023-01-01
      9  13          Royse Galvan confirmed   m  75 2023-01-01     2023-01-01
      10 18       Fahmi al-Masood suspected   m  24 2023-01-02     2023-01-02
      11 20      Kifaaya el-Ameen confirmed   f  79 2023-01-02     2023-01-02
      12 22 Martin Cavazos Castro  probable   m  39 2023-01-02     2023-01-02
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
      1      25.4
      2      27.6
      3        NA
      4      24.4
      5        NA
      6        NA
      7      21.7
      8      26.9
      9      22.8
      10       NA
      11     26.2
      12       NA

# sim_linelist works as expected with modified config parameters

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(last_contact_distribution = function(n) stats::rpois(
          n = n, lambda = 5)))
    Output
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
      2      2023-01-02      died   2023-02-09         2022-12-30        2023-01-11
      3            <NA> recovered         <NA>         2022-12-31        2023-01-07
      4      2023-01-05 recovered         <NA>         2022-12-31        2023-01-05
      5      2023-01-14 recovered         <NA>         2022-12-29        2023-01-04
      6            <NA> recovered         <NA>         2022-12-28        2023-01-07
      7            <NA> recovered         <NA>         2022-12-30        2023-01-07
      8      2023-01-02 recovered         <NA>         2022-12-28        2023-01-12
      9            <NA> recovered         <NA>         2022-12-29        2023-01-06
      10           <NA> recovered         <NA>         2022-12-29        2023-01-06
      11           <NA> recovered         <NA>         2022-12-31        2023-01-04
      12           <NA> recovered         <NA>         2022-12-27        2023-01-07
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

# sim_linelist works as expected with time-varying cfr

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        config = create_config(time_varying_death_risk = function(risk, time) risk *
          exp(-time)))
    Output
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
      2      2023-01-02      died   2023-02-09         2022-12-30        2023-01-08
      3            <NA> recovered         <NA>         2022-12-31        2023-01-05
      4      2023-01-05 recovered         <NA>         2022-12-31        2023-01-04
      5      2023-01-14 recovered         <NA>         2022-12-29        2023-01-02
      6            <NA> recovered         <NA>         2022-12-28        2023-01-05
      7            <NA> recovered         <NA>         2022-12-30        2023-01-04
      8      2023-01-02 recovered         <NA>         2022-12-28        2023-01-09
      9            <NA> recovered         <NA>         2022-12-29        2023-01-04
      10           <NA> recovered         <NA>         2022-12-29        2023-01-04
      11           <NA> recovered         <NA>         2022-12-31        2023-01-03
      12           <NA> recovered         <NA>         2022-12-27        2023-01-05
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

# sim_linelist works as expected with time-varying cfr & age-strat

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_death_risk = age_dep_hosp_death_risk, config = create_config(
          time_varying_death_risk = function(risk, time) risk * exp(-time)))
    Output
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
      2      2023-01-02 recovered         <NA>         2022-12-30        2023-01-08
      3            <NA> recovered         <NA>         2022-12-31        2023-01-05
      4      2023-01-05 recovered         <NA>         2022-12-31        2023-01-04
      5      2023-01-14 recovered         <NA>         2022-12-29        2023-01-02
      6            <NA> recovered         <NA>         2022-12-28        2023-01-05
      7            <NA> recovered         <NA>         2022-12-30        2023-01-04
      8      2023-01-02 recovered         <NA>         2022-12-28        2023-01-09
      9            <NA> recovered         <NA>         2022-12-29        2023-01-04
      10           <NA> recovered         <NA>         2022-12-29        2023-01-04
      11           <NA> recovered         <NA>         2022-12-31        2023-01-03
      12           <NA> recovered         <NA>         2022-12-27        2023-01-05
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

