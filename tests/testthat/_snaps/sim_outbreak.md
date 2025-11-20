# sim_outbreak works as expected with defaults

    Code
      sim_outbreak()
    Output
      $linelist
           id                case_name case_type sex age date_onset date_reporting
      1     1              James Manis suspected   m  59 2023-01-01     2023-01-01
      2     2                Chen Moua confirmed   m  90 2023-01-01     2023-01-01
      3     3             David Welter confirmed   m   4 2023-01-02     2023-01-02
      4     5       Christopher Turner confirmed   m  29 2023-01-04     2023-01-04
      5     6              Morgan Bohn suspected   f  14 2023-01-05     2023-01-05
      6     7          Yutitham Corpuz  probable   m  85 2023-01-06     2023-01-06
      7    10    Cornelius Stadelbauer  probable   m  25 2023-01-13     2023-01-13
      8    11          Hafsa al-Arshad confirmed   f  34 2023-01-11     2023-01-11
      9    12                Maiya Kim suspected   f  89 2023-01-13     2023-01-13
      10   14          Junaid al-Hoque suspected   m  63 2023-01-11     2023-01-11
      11   18         Aabdeen al-Amara confirmed   m  74 2023-01-14     2023-01-14
      12   19            Edward Castro  probable   m  34 2023-01-12     2023-01-12
      13   22    Jennifer Vathanavarin confirmed   f  29 2023-01-12     2023-01-12
      14   24          Qamraaa el-Ally  probable   f  46 2023-01-13     2023-01-13
      15   27       Nafeesa al-Massoud confirmed   f  24 2023-01-14     2023-01-14
      16   29      Ghaamid el-Mohammed suspected   m  41 2023-01-21     2023-01-21
      17   30            Mia Grossaint confirmed   f  72 2023-01-19     2023-01-19
      18   31            Trever Bailey suspected   m   6 2023-01-20     2023-01-20
      19   33        Chandel Aviado II confirmed   f  61 2023-01-14     2023-01-14
      20   34        Nawwaara al-Rahim confirmed   f  44 2023-01-14     2023-01-14
      21   35      Sulaimaan al-Farooq confirmed   m  71 2023-01-27     2023-01-27
      22   38         Lauren Caramillo confirmed   f  69 2023-01-23     2023-01-23
      23   39           James Colligan  probable   m  61 2023-01-23     2023-01-23
      24   41             Savanna Sena confirmed   f  64 2023-01-24     2023-01-24
      25   44          Utkarsh Hammond suspected   m  61 2023-01-22     2023-01-22
      26   45           Orville Mosher  probable   m  66 2023-01-22     2023-01-22
      27   47              Itzel Jiron confirmed   f  81 2023-01-28     2023-01-28
      28   50              Whitney Ouk  probable   f  53 2023-01-28     2023-01-28
      29   51        Nadheera el-Pasha confirmed   f  45 2023-01-29     2023-01-29
      30   53       Saleet el-Shehadeh confirmed   m  42 2023-02-02     2023-02-02
      31   54           Shuaib al-Kaba  probable   m  78 2023-02-03     2023-02-03
      32   55          Jamaal el-Sarah confirmed   m  35 2023-01-24     2023-01-24
      33   56             Diksha Floyd  probable   f  54 2023-01-26     2023-01-26
      34   58 Christian Gomez-Buchanan  probable   m  68 2023-01-25     2023-01-25
      35   59      Alexander Rodriguez  probable   m   3 2023-01-23     2023-01-23
      36   60         Hissa al-Shaheed confirmed   f  44 2023-01-29     2023-01-29
      37   63          Jameel Scurlock  probable   m  62 2023-01-31     2023-01-31
      38   64        Madelyn Mcfarland confirmed   f  35 2023-01-29     2023-01-29
      39   65          Khongmong Ahmad confirmed   m  90 2023-02-03     2023-02-03
      40   66             Kimiko Smith confirmed   f  25 2023-02-01     2023-02-01
      41   71              Shane Huang suspected   m  46 2023-01-29     2023-01-29
      42   73         Laraena Sturgeon confirmed   f   8 2023-02-01     2023-02-01
      43   77         Mathurin Labadie  probable   m  63 2023-01-30     2023-01-30
      44   78          Nakrista Chacon  probable   f  54 2023-01-29     2023-01-29
      45   80                Kevin Cha  probable   m  67 2023-02-03     2023-02-03
      46   85         Markese Marchman confirmed   m  37 2023-02-02     2023-02-02
      47   88            Mark Espinosa confirmed   m  73 2023-01-30     2023-01-30
      48   89         Alexander Naylor  probable   m  13 2023-02-02     2023-02-02
      49   90                Alicia Ye  probable   f  72 2023-02-01     2023-02-01
      50   93          Connor Reichman confirmed   m  61 2023-02-04     2023-02-04
      51   97            Megan Beckner confirmed   f  22 2023-02-05     2023-02-05
      52   98              Sally Joyce suspected   f  29 2023-02-04     2023-02-04
      53  101           Shamari Batson  probable   f  17 2023-02-07     2023-02-07
      54  108           Wen Kang Zheng  probable   m  71 2023-02-14     2023-02-14
      55  111             Henry Morgan confirmed   m  90 2023-02-09     2023-02-09
      56  113         Mastoor al-Murad  probable   m  23 2023-02-12     2023-02-12
      57  114     Muhaajir al-Siddique  probable   m  35 2023-02-16     2023-02-16
      58  116         Isabella Alvarez  probable   f  62 2023-02-24     2023-02-24
      59  119         Jumail al-Salame  probable   m  57 2023-02-23     2023-02-23
      60  120            Jez-Mas Woods confirmed   m  44 2023-02-18     2023-02-18
      61  122         Merrill Jr Baker confirmed   m  57 2023-03-02     2023-03-02
      62  123       Mansoor al-Hussein  probable   m  63 2023-03-08     2023-03-08
      63  125             Deliah Bison confirmed   f  46 2023-02-28     2023-02-28
      64  126           Aliyya al-Azzi  probable   f  66 2023-02-26     2023-02-26
      65  130         Nizaam al-Shaker confirmed   m  68 2023-03-07     2023-03-07
      66  131             Lafaith Bean confirmed   f  12 2023-03-09     2023-03-09
      67  133             Jaesung Prum confirmed   m  51 2023-03-18     2023-03-18
      68  138         Madison Mcdonald suspected   f   2 2023-03-10     2023-03-10
      69  139                Elyse Vue confirmed   f  53 2023-03-09     2023-03-09
      70  142            Kara Armbrust suspected   f  76 2023-03-23     2023-03-23
      71  143           Jaycee Conners suspected   m  82 2023-03-21     2023-03-21
      72  145      Qaaid al-Salahuddin suspected   m  25 2023-03-15     2023-03-15
      73  146        Keeman Stockinger  probable   m  76 2023-03-13     2023-03-13
      74  147             Marissa Osse  probable   f  14 2023-03-13     2023-03-13
      75  150             Rosemary Lor confirmed   f  76 2023-03-11     2023-03-11
      76  153          Alexis Jones Jr confirmed   f  78 2023-03-15     2023-03-15
      77  154                 Ka Ahsan  probable   m  75 2023-03-24     2023-03-24
      78  155          Munsif el-Salem  probable   m  76 2023-03-24     2023-03-24
      79  157  Abdur Rasheed al-Akbari confirmed   m  80 2023-03-18     2023-03-18
      80  158   Abdul Kareem al-Firman confirmed   m  41 2023-03-18     2023-03-18
      81  159         Najlaa el-Yassin suspected   f  78 2023-03-19     2023-03-19
      82  163           Sharaf al-Sala confirmed   m  28 2023-03-15     2023-03-15
      83  164          Tanya Tollivoro confirmed   f   2 2023-03-21     2023-03-21
      84  166          Shahla al-Salam confirmed   f  82 2023-03-26     2023-03-26
      85  171         Raadiya al-Abdoo confirmed   f   5 2023-03-22     2023-03-22
      86  172            Jeremy Herman confirmed   m   1 2023-03-20     2023-03-20
      87  173              Janie Mohar suspected   f  44 2023-03-19     2023-03-19
      88  174           Raul Rodriguez confirmed   m  76 2023-03-16     2023-03-16
      89  175              Asysa Smith confirmed   f   3 2023-03-29     2023-03-29
      90  176         Frankie Griffith suspected   f  15 2023-03-25     2023-03-25
      91  177                Jay Jiron confirmed   m  19 2023-03-26     2023-03-26
      92  178           Jason Figueroa  probable   m  76 2023-03-25     2023-03-25
      93  182            Maritza Silva  probable   f  90 2023-03-27     2023-03-27
      94  186          Razeen el-Karam confirmed   m  64 2023-04-03     2023-04-03
      95  189              Yael Watson confirmed   f  35 2023-03-29     2023-03-29
      96  195    Brittany Peters-Maloy suspected   f  84 2023-03-27     2023-03-27
      97  196         Brieannah Pruitt suspected   f  18 2023-03-30     2023-03-30
      98  197               Sarah Tran  probable   f  79 2023-03-28     2023-03-28
      99  199             T'Koia Myers confirmed   f  49 2023-04-07     2023-04-07
      100 200       Chasity Thammarath confirmed   f  56 2023-04-05     2023-04-05
      101 201        Katherine Vannice confirmed   f  76 2023-04-07     2023-04-07
      102 202             Ashley Coles confirmed   f  41 2023-04-03     2023-04-03
      103 205           Randall Kazemi confirmed   m  29 2023-04-01     2023-04-01
      104 209           Antonio Helfer confirmed   m  39 2023-04-05     2023-04-05
      105 210         Sandra Ouellette confirmed   f  32 2023-04-01     2023-04-01
      106 211            Jacob Barrett suspected   m   9 2023-04-06     2023-04-06
      107 213         Nabeel al-Shakir suspected   m  39 2023-04-11     2023-04-11
      108 214            Oscar Salazar  probable   m  12 2023-04-17     2023-04-17
      109 219              Joshua Reid confirmed   m  52 2023-04-10     2023-04-10
      110 221  Kamaaluddeen al-Noorani confirmed   m  22 2023-04-02     2023-04-02
      111 224         Manaara el-Bilal suspected   f  68 2023-04-08     2023-04-08
      112 226             Emma Waddles suspected   f  57 2023-04-06     2023-04-06
      113 229               Kevin Tran confirmed   m   8 2023-04-12     2023-04-12
      114 230              Quinn Salaz suspected   m  28 2023-04-12     2023-04-12
      115 232     Alex Zaragoza-Madrid confirmed   m   2 2023-04-02     2023-04-02
      116 233           Bianca Winkler confirmed   f  84 2023-04-09     2023-04-09
      117 234         Laaiqa al-Farrah confirmed   f  52 2023-04-09     2023-04-09
      118 235            Marques Cross confirmed   m  58 2023-04-12     2023-04-12
      119 236            Abeer el-Saba  probable   f  29 2023-04-10     2023-04-10
      120 238             Alec Coleman confirmed   m  30 2023-04-14     2023-04-14
      121 240        Richard Mcclaskey confirmed   m  71 2023-04-15     2023-04-15
      122 243         Haakima el-Azizi confirmed   f  43 2023-04-13     2023-04-13
      123 245              Amanda Dodd suspected   f  40 2023-04-15     2023-04-15
      124 250            Julanne Jones confirmed   f  46 2023-04-16     2023-04-16
      125 251              Yeeleng Sun confirmed   m  69 2023-04-11     2023-04-11
      126 252             Isaac Stuart confirmed   m  69 2023-04-20     2023-04-20
      127 253         Lawrence Jenkins suspected   m  38 2023-04-20     2023-04-20
      128 254           Lydia Mcmaster confirmed   f  28 2023-04-16     2023-04-16
      129 255       Yeun Jung Hasegawa confirmed   f  82 2023-04-16     2023-04-16
      130 258   Ummu Kulthoom el-Kanan suspected   f  19 2023-04-14     2023-04-14
      131 261          Bryanna Herrera confirmed   f  46 2023-04-26     2023-04-26
      132 262                Jose Maez suspected   m  71 2023-04-13     2023-04-13
      133 264         Gericko Martinez suspected   m   4 2023-04-25     2023-04-25
      134 265               Lael Vigil suspected   f  31 2023-04-25     2023-04-25
      135 267           Asiah Marshall  probable   f  16 2023-04-20     2023-04-20
      136 268        Zuhaira el-Husain  probable   f  53 2023-04-21     2023-04-21
      137 277        Firdaus el-Satter confirmed   f  14 2023-05-01     2023-05-01
      138 278  Haley Iron Cloud-Gresko confirmed   f  48 2023-04-28     2023-04-28
      139 279              Tyree Erman confirmed   m  89 2023-04-25     2023-04-25
      140 280           Janalen Khanom confirmed   f  39 2023-04-26     2023-04-26
      141 282               Judy David confirmed   f  20 2023-04-21     2023-04-21
      142 284        Cuauhtemoc Moreno confirmed   m   6 2023-05-03     2023-05-03
      143 285            Alexis Wilson  probable   f  28 2023-05-05     2023-05-05
      144 291            Kristin Major confirmed   f  42 2023-05-01     2023-05-01
      145 292          Jazmine El-Amin confirmed   f  71 2023-04-23     2023-04-23
      146 293          Razeen al-Shaer confirmed   m   9 2023-05-05     2023-05-05
      147 296             Jazmyn Evans confirmed   f  61 2023-05-06     2023-05-06
      148 298          Maribel Escobar suspected   f  53 2023-05-02     2023-05-02
      149 301           Kyana Stafford  probable   f  76 2023-04-23     2023-04-23
      150 302          Azzaam el-Mousa  probable   m  69 2023-04-26     2023-04-26
      151 304         Naseera el-Saidi  probable   f  50 2023-05-07     2023-05-07
      152 307         Stephanie Nguyen suspected   f   7 2023-05-09     2023-05-09
      153 310              Gia Morales confirmed   f  45 2023-04-24     2023-04-24
      154 311            Laneece Ahuna  probable   f  83 2023-04-25     2023-04-25
      155 313           Binyu Vincelet suspected   f  41 2023-04-27     2023-04-27
      156 316           Richard Lawson confirmed   m  88 2023-05-10     2023-05-10
      157 320           Jacey Sheppard confirmed   f  79 2023-05-01     2023-05-01
      158 326      Saafiyya el-Mohamed confirmed   f  82 2023-05-08     2023-05-08
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
      2       24.5
      3       24.8
      4       25.4
      5         NA
      6         NA
      7         NA
      8       24.5
      9         NA
      10        NA
      11      24.8
      12        NA
      13      24.6
      14        NA
      15      26.5
      16        NA
      17      24.7
      18        NA
      19      24.5
      20      21.7
      21      21.5
      22      24.2
      23        NA
      24      23.1
      25        NA
      26        NA
      27      21.5
      28        NA
      29      21.5
      30      26.4
      31        NA
      32      25.2
      33        NA
      34        NA
      35        NA
      36      25.8
      37        NA
      38      21.7
      39      23.7
      40      24.8
      41        NA
      42      23.6
      43        NA
      44        NA
      45        NA
      46      25.3
      47      23.9
      48        NA
      49        NA
      50      27.8
      51      26.1
      52        NA
      53        NA
      54        NA
      55      24.3
      56        NA
      57        NA
      58        NA
      59        NA
      60      25.9
      61      24.2
      62        NA
      63      27.1
      64        NA
      65      27.1
      66      24.3
      67      24.5
      68        NA
      69      30.3
      70        NA
      71        NA
      72        NA
      73        NA
      74        NA
      75      25.2
      76      23.0
      77        NA
      78        NA
      79      25.7
      80      25.1
      81        NA
      82      20.0
      83      25.7
      84      27.2
      85      24.2
      86      27.5
      87        NA
      88      25.3
      89      27.2
      90        NA
      91      24.9
      92        NA
      93        NA
      94      25.2
      95      24.0
      96        NA
      97        NA
      98        NA
      99      26.8
      100     24.2
      101     29.1
      102     24.1
      103     23.7
      104     23.4
      105     25.2
      106       NA
      107       NA
      108       NA
      109     26.7
      110     27.8
      111       NA
      112       NA
      113     26.4
      114       NA
      115     20.5
      116     26.4
      117     28.1
      118     25.6
      119       NA
      120     18.6
      121     25.9
      122     23.8
      123       NA
      124     24.9
      125     23.2
      126     24.0
      127       NA
      128     25.3
      129     22.3
      130       NA
      131     25.3
      132       NA
      133       NA
      134       NA
      135       NA
      136       NA
      137     23.9
      138     25.8
      139     22.5
      140     27.2
      141     25.1
      142     18.6
      143       NA
      144     23.1
      145     24.6
      146     25.7
      147     26.2
      148       NA
      149       NA
      150       NA
      151       NA
      152       NA
      153     28.1
      154       NA
      155       NA
      156     23.7
      157     26.7
      158     22.0
      
      $contacts
                              from                       to age sex
      1                James Manis                Chen Moua  90   m
      2                James Manis             David Welter   4   m
      3                  Chen Moua            Anisa Hatcher  86   f
      4                  Chen Moua       Christopher Turner  29   m
      5               David Welter              Morgan Bohn  14   f
      6               David Welter          Yutitham Corpuz  85   m
      7               David Welter            Sade Phillips  18   f
      8         Christopher Turner          Sameeha al-Zaki  59   f
      9                Morgan Bohn    Cornelius Stadelbauer  25   m
      10               Morgan Bohn          Hafsa al-Arshad  34   f
      11               Morgan Bohn                Maiya Kim  89   f
      12               Morgan Bohn           Desmond Ibarra   5   m
      13           Yutitham Corpuz          Junaid al-Hoque  63   m
      14           Hafsa al-Arshad            Nimesha Ilaoa  50   f
      15           Hafsa al-Arshad             Bishr el-Aly   5   m
      16           Hafsa al-Arshad  Carlo Ceazar Strausburg  89   m
      17                 Maiya Kim         Aabdeen al-Amara  74   m
      18           Junaid al-Hoque            Edward Castro  34   m
      19           Junaid al-Hoque            Kaile Shaheen  47   f
      20           Junaid al-Hoque          Jubair el-Zafar  85   m
      21           Junaid al-Hoque    Jennifer Vathanavarin  29   f
      22          Aabdeen al-Amara              Deisha Wall  24   f
      23             Edward Castro          Qamraaa el-Ally  46   f
      24             Edward Castro  Abdul Jaleel al-Shabazz  63   m
      25             Edward Castro          Jaylynn Baldwin  19   f
      26             Edward Castro       Nafeesa al-Massoud  24   f
      27     Jennifer Vathanavarin          Dalicia Wilkins   9   f
      28     Jennifer Vathanavarin      Ghaamid el-Mohammed  41   m
      29     Jennifer Vathanavarin            Mia Grossaint  72   f
      30     Jennifer Vathanavarin            Trever Bailey   6   m
      31           Qamraaa el-Ally         Crystal Sandoval   9   f
      32        Nafeesa al-Massoud        Chandel Aviado II  61   f
      33        Nafeesa al-Massoud        Nawwaara al-Rahim  44   f
      34       Ghaamid el-Mohammed      Sulaimaan al-Farooq  71   m
      35       Ghaamid el-Mohammed             Eraina Smith  34   f
      36       Ghaamid el-Mohammed           Rashele Cooper  75   f
      37       Ghaamid el-Mohammed         Lauren Caramillo  69   f
      38       Ghaamid el-Mohammed           James Colligan  61   m
      39       Ghaamid el-Mohammed           Austin Lathrop  67   m
      40             Mia Grossaint             Savanna Sena  64   f
      41             Mia Grossaint              Marco Lopez  11   m
      42             Mia Grossaint        Ghaaliya al-Zaher  59   f
      43             Trever Bailey          Utkarsh Hammond  61   m
      44             Trever Bailey           Orville Mosher  66   m
      45         Nawwaara al-Rahim           Nichole Gilroy  16   f
      46       Sulaimaan al-Farooq              Itzel Jiron  81   f
      47       Sulaimaan al-Farooq              Renae Mason  88   f
      48            James Colligan          Nelly Andreatta  53   f
      49            James Colligan              Whitney Ouk  53   f
      50              Savanna Sena        Nadheera el-Pasha  45   f
      51              Savanna Sena        Sapphire Freeland  42   f
      52              Savanna Sena       Saleet el-Shehadeh  42   m
      53              Savanna Sena           Shuaib al-Kaba  78   m
      54           Utkarsh Hammond          Jamaal el-Sarah  35   m
      55           Utkarsh Hammond             Diksha Floyd  54   f
      56           Utkarsh Hammond        Exzinia O'Donnell  54   f
      57            Orville Mosher Christian Gomez-Buchanan  68   m
      58            Orville Mosher      Alexander Rodriguez   3   m
      59            Orville Mosher         Hissa al-Shaheed  44   f
      60               Itzel Jiron              Medhavi Kim  35   f
      61               Whitney Ouk            Jazmine Mcgee  23   f
      62               Whitney Ouk          Jameel Scurlock  62   m
      63               Whitney Ouk        Madelyn Mcfarland  35   f
      64         Nadheera el-Pasha          Khongmong Ahmad  90   m
      65         Nadheera el-Pasha             Kimiko Smith  25   f
      66            Shuaib al-Kaba     Collin Rangel Mendez  41   m
      67              Diksha Floyd          Ronnie Maryland  17   m
      68              Diksha Floyd           Monica Reichal  26   f
      69  Christian Gomez-Buchanan         Brandon Trammell  61   m
      70  Christian Gomez-Buchanan              Shane Huang  46   m
      71       Alexander Rodriguez       Mu,Aawiya al-Amiri  57   m
      72          Hissa al-Shaheed         Laraena Sturgeon   8   f
      73          Hissa al-Shaheed Joshua Valencia Anchondo  11   m
      74           Jameel Scurlock            Taylor Nguyen  56   f
      75         Madelyn Mcfarland            Cairra Curtis  32   m
      76         Madelyn Mcfarland         Mathurin Labadie  63   m
      77         Madelyn Mcfarland          Nakrista Chacon  54   f
      78         Madelyn Mcfarland             Yuvorn Shahi  22   m
      79              Kimiko Smith                Kevin Cha  67   m
      80              Kimiko Smith            Caroline Cano  83   f
      81              Kimiko Smith                 Yusuf La  16   m
      82              Kimiko Smith       Afaaf el-Mohiuddin  38   f
      83               Shane Huang              Russell Roy  19   m
      84          Laraena Sturgeon         Markese Marchman  37   m
      85          Laraena Sturgeon        Habeeba al-Hammad  46   f
      86          Laraena Sturgeon         Christian Molina  64   m
      87          Mathurin Labadie            Mark Espinosa  73   m
      88          Mathurin Labadie         Alexander Naylor  13   m
      89           Nakrista Chacon                Alicia Ye  72   f
      90           Nakrista Chacon                Micah San  12   m
      91                 Kevin Cha        Daniel Goodfellow  52   m
      92                 Kevin Cha          Connor Reichman  61   m
      93                 Kevin Cha           Samuel Johnson   9   m
      94                 Kevin Cha           Taaj al-Rahimi   9   m
      95                 Kevin Cha          Cassandra Lange  42   f
      96          Markese Marchman            Megan Beckner  22   f
      97             Mark Espinosa              Sally Joyce  29   f
      98          Alexander Naylor              Joshua Khan  15   m
      99          Alexander Naylor        Kashauna Thompson  69   f
      100         Alexander Naylor           Shamari Batson  17   f
      101         Alexander Naylor          De'Chelle Yorks  21   f
      102         Alexander Naylor         Carmelita Huizar  54   f
      103         Alexander Naylor   Andrew Macias-Monarrez  20   m
      104         Alexander Naylor          Savannah Duling   9   f
      105          Connor Reichman        Trevor Feuerstein  26   m
      106          Connor Reichman            Yusri al-Imam  80   m
      107          Connor Reichman           Wen Kang Zheng  71   m
      108          Connor Reichman            Sidqi el-Reza  57   m
      109          Connor Reichman              Ryan Fukuda  77   m
      110              Sally Joyce             Henry Morgan  90   m
      111           Shamari Batson          Gloria Zaragoza  58   f
      112           Shamari Batson         Mastoor al-Murad  23   m
      113           Wen Kang Zheng     Muhaajir al-Siddique  35   m
      114             Henry Morgan            Kloe Williams  66   f
      115         Mastoor al-Murad         Isabella Alvarez  62   f
      116         Mastoor al-Murad       Shelby Vargas Pena  62   f
      117         Mastoor al-Murad            Sarah Etsitty  34   f
      118         Mastoor al-Murad         Jumail al-Salame  57   m
      119     Muhaajir al-Siddique            Jez-Mas Woods  44   m
      120     Muhaajir al-Siddique              Weston Hahs  22   m
      121         Isabella Alvarez         Merrill Jr Baker  57   m
      122         Isabella Alvarez       Mansoor al-Hussein  63   m
      123         Jumail al-Salame              Raul Millan   7   m
      124         Jumail al-Salame             Deliah Bison  46   f
      125         Jumail al-Salame           Aliyya al-Azzi  66   f
      126            Jez-Mas Woods          Deviny Mckinney   4   f
      127            Jez-Mas Woods           Bertha Montoya  10   f
      128         Merrill Jr Baker           Danielle Begay  68   f
      129         Merrill Jr Baker         Nizaam al-Shaker  68   m
      130         Merrill Jr Baker             Lafaith Bean  12   f
      131       Mansoor al-Hussein             Rida al-Ozer  51   m
      132       Mansoor al-Hussein             Jaesung Prum  51   m
      133             Deliah Bison       Shannon Richardson   8   f
      134           Aliyya al-Azzi              Aldo Campos  55   m
      135         Nizaam al-Shaker             Billye Cohen  77   f
      136         Nizaam al-Shaker           Shawn Videtzky  22   m
      137             Lafaith Bean         Madison Mcdonald   2   f
      138             Lafaith Bean                Elyse Vue  53   f
      139             Jaesung Prum           Rebekah Norman  31   f
      140             Jaesung Prum              Richard Lee  77   m
      141             Jaesung Prum            Kara Armbrust  76   f
      142             Jaesung Prum           Jaycee Conners  82   m
      143             Jaesung Prum          Mikayla Hopkins  12   f
      144         Madison Mcdonald      Qaaid al-Salahuddin  25   m
      145         Madison Mcdonald        Keeman Stockinger  76   m
      146                Elyse Vue             Marissa Osse  14   f
      147                Elyse Vue         Jennifer Johnson  31   f
      148                Elyse Vue          Alvaro Vikingur  90   m
      149                Elyse Vue             Rosemary Lor  76   f
      150            Kara Armbrust     Lane Martinez-Deleon  30   m
      151           Jaycee Conners            Amanda Finken  32   f
      152      Qaaid al-Salahuddin          Alexis Jones Jr  78   f
      153      Qaaid al-Salahuddin                 Ka Ahsan  75   m
      154      Qaaid al-Salahuddin          Munsif el-Salem  76   m
      155        Keeman Stockinger           Nawfa el-Ahmad  88   f
      156             Marissa Osse  Abdur Rasheed al-Akbari  80   m
      157             Marissa Osse   Abdul Kareem al-Firman  41   m
      158             Marissa Osse         Najlaa el-Yassin  78   f
      159             Marissa Osse         Sakeena el-Anwar  11   f
      160             Marissa Osse            Trevor Arnick  57   m
      161             Rosemary Lor          Alejandra Avila  79   f
      162          Alexis Jones Jr           Sharaf al-Sala  28   m
      163          Alexis Jones Jr          Tanya Tollivoro   2   f
      164                 Ka Ahsan   Abdul Ghafoor el-Aslam  16   m
      165          Munsif el-Salem          Shahla al-Salam  82   f
      166  Abdur Rasheed al-Akbari         Kailey Scharnell  51   f
      167  Abdur Rasheed al-Akbari           Samuel Henzler  54   m
      168   Abdul Kareem al-Firman            Orilea Medina  76   f
      169   Abdul Kareem al-Firman            Unique Tinoco  56   f
      170   Abdul Kareem al-Firman         Raadiya al-Abdoo   5   f
      171         Najlaa el-Yassin            Jeremy Herman   1   m
      172           Sharaf al-Sala              Janie Mohar  44   f
      173           Sharaf al-Sala           Raul Rodriguez  76   m
      174          Shahla al-Salam              Asysa Smith   3   f
      175         Raadiya al-Abdoo         Frankie Griffith  15   f
      176         Raadiya al-Abdoo                Jay Jiron  19   m
      177         Raadiya al-Abdoo           Jason Figueroa  76   m
      178            Jeremy Herman       Shabeeba al-Jaffer  12   f
      179           Raul Rodriguez              Grant Vigil  43   m
      180           Raul Rodriguez           Sharon Harding   9   f
      181           Raul Rodriguez            Maritza Silva  90   f
      182           Raul Rodriguez            Tracy Powells   7   m
      183              Asysa Smith            Mason Mcgrier  15   m
      184              Asysa Smith         Shalise Robinson  54   f
      185                Jay Jiron          Razeen el-Karam  64   m
      186                Jay Jiron           Tyler John III  21   m
      187                Jay Jiron         Fikra el-Chahine  37   f
      188                Jay Jiron              Yael Watson  35   f
      189                Jay Jiron       Nadheera al-Jafari  70   f
      190           Jason Figueroa           Vincent Miller  70   m
      191           Jason Figueroa       Devundrick Wallace  59   m
      192           Jason Figueroa      Damian Murillo-Soto  77   m
      193           Jason Figueroa            Yesenia Diego  75   f
      194           Jason Figueroa    Brittany Peters-Maloy  84   f
      195            Maritza Silva         Brieannah Pruitt  18   f
      196            Maritza Silva               Sarah Tran  79   f
      197          Razeen el-Karam           Yahya al-Saidi  14   m
      198          Razeen el-Karam             T'Koia Myers  49   f
      199          Razeen el-Karam       Chasity Thammarath  56   f
      200          Razeen el-Karam        Katherine Vannice  76   f
      201              Yael Watson             Ashley Coles  41   f
      202              Yael Watson               Rusty Asad  16   m
      203              Yael Watson                Cam Tu Vu   3   f
      204    Brittany Peters-Maloy           Randall Kazemi  29   m
      205    Brittany Peters-Maloy            Lizbeth Vigil  89   f
      206    Brittany Peters-Maloy              Fisayo Rice  24   m
      207    Brittany Peters-Maloy          Bao-Tran Suetos  31   f
      208         Brieannah Pruitt           Antonio Helfer  39   m
      209         Brieannah Pruitt         Sandra Ouellette  32   f
      210         Brieannah Pruitt            Jacob Barrett   9   m
      211               Sarah Tran           Gina Dalrymple  82   f
      212             T'Koia Myers         Nabeel al-Shakir  39   m
      213       Chasity Thammarath            Oscar Salazar  12   m
      214        Katherine Vannice             Luna Purdham  54   f
      215        Katherine Vannice    Kamaaluddeen el-Safar  68   m
      216             Ashley Coles          Ameen al-Semaan  73   m
      217             Ashley Coles         Ashley Armstrong  85   f
      218             Ashley Coles              Joshua Reid  52   m
      219             Ashley Coles         Azmi el-Abdallah   3   m
      220           Randall Kazemi  Kamaaluddeen al-Noorani  22   m
      221           Randall Kazemi            Khampane Behr   5   m
      222           Antonio Helfer        Amelia Santa Cruz  66   f
      223           Antonio Helfer         Manaara el-Bilal  68   f
      224         Sandra Ouellette           Mreenal Quilon  38   f
      225         Sandra Ouellette             Emma Waddles  57   f
      226         Sandra Ouellette        Jose Delgado Diaz  48   m
      227            Jacob Barrett            Payton Mcadoo  75   f
      228         Nabeel al-Shakir               Kevin Tran   8   m
      229              Joshua Reid              Quinn Salaz  28   m
      230              Joshua Reid          Jordan Redhorse  21   f
      231  Kamaaluddeen al-Noorani     Alex Zaragoza-Madrid   2   m
      232  Kamaaluddeen al-Noorani           Bianca Winkler  84   f
      233         Manaara el-Bilal         Laaiqa al-Farrah  52   f
      234         Manaara el-Bilal            Marques Cross  58   m
      235         Manaara el-Bilal            Abeer el-Saba  29   f
      236             Emma Waddles           Andrew Lefholz   7   m
      237               Kevin Tran             Alec Coleman  30   m
      238               Kevin Tran           Braxton Griego  11   m
      239     Alex Zaragoza-Madrid        Richard Mcclaskey  71   m
      240     Alex Zaragoza-Madrid           Khyleah Dotson  50   f
      241           Bianca Winkler            Eliora Braden  77   f
      242           Bianca Winkler         Haakima el-Azizi  43   f
      243           Bianca Winkler             Roy Williams  19   m
      244           Bianca Winkler              Amanda Dodd  40   f
      245           Bianca Winkler              Jason Hoyle  49   m
      246           Bianca Winkler         Julisa Alexander  11   f
      247           Bianca Winkler             Azza el-Kazi  15   f
      248           Bianca Winkler        Marissa Rodriquez  61   f
      249            Abeer el-Saba            Julanne Jones  46   f
      250            Abeer el-Saba              Yeeleng Sun  69   m
      251            Abeer el-Saba             Isaac Stuart  69   m
      252            Abeer el-Saba         Lawrence Jenkins  38   m
      253             Alec Coleman           Lydia Mcmaster  28   f
      254             Alec Coleman       Yeun Jung Hasegawa  82   f
      255        Richard Mcclaskey            Jasmine Jones  45   f
      256        Richard Mcclaskey            Adrian Romero  47   m
      257         Haakima el-Azizi   Ummu Kulthoom el-Kanan  19   f
      258              Amanda Dodd           Saeed el-Javed  85   m
      259            Julanne Jones          Colette Baldwin  24   f
      260            Julanne Jones          Bryanna Herrera  46   f
      261              Yeeleng Sun                Jose Maez  71   m
      262              Yeeleng Sun            Samuel Delori  69   m
      263             Isaac Stuart         Gericko Martinez   4   m
      264             Isaac Stuart               Lael Vigil  31   f
      265         Lawrence Jenkins             Jessie Allen  18   f
      266         Lawrence Jenkins           Asiah Marshall  16   f
      267         Lawrence Jenkins        Zuhaira el-Husain  53   f
      268           Lydia Mcmaster             Javon Reeves  62   m
      269           Lydia Mcmaster        Fidda al-Ghaffari  87   f
      270       Yeun Jung Hasegawa        Farhat al-Mohamed  28   f
      271       Yeun Jung Hasegawa             Clifton Haro  42   m
      272   Ummu Kulthoom el-Kanan             Jane Solberg  42   f
      273          Bryanna Herrera       Esmeralda Gallegos  84   f
      274          Bryanna Herrera            Kaylee Gaytan  29   f
      275                Jose Maez          Tawheed el-Azad  47   m
      276                Jose Maez        Firdaus el-Satter  14   f
      277         Gericko Martinez  Haley Iron Cloud-Gresko  48   f
      278           Asiah Marshall              Tyree Erman  89   m
      279           Asiah Marshall           Janalen Khanom  39   f
      280           Asiah Marshall          Raabia al-Masih  17   f
      281        Zuhaira el-Husain               Judy David  20   f
      282        Zuhaira el-Husain          Sanaaa el-Farha  61   f
      283        Firdaus el-Satter        Cuauhtemoc Moreno   6   m
      284  Haley Iron Cloud-Gresko            Alexis Wilson  28   f
      285              Tyree Erman            Corina Cortez  83   f
      286              Tyree Erman        Alexandra Medrano  68   f
      287              Tyree Erman         Naseer al-Badour  47   m
      288               Judy David            Zachary Major  73   m
      289               Judy David            Bailey Torres  24   f
      290               Judy David            Kristin Major  42   f
      291               Judy David          Jazmine El-Amin  71   f
      292        Cuauhtemoc Moreno          Razeen al-Shaer   9   m
      293        Cuauhtemoc Moreno      Alexzandria Holguin  78   f
      294            Alexis Wilson            Ismad al-Azad  24   m
      295            Alexis Wilson             Jazmyn Evans  61   f
      296            Kristin Major             Marcus Ellis  49   m
      297            Kristin Major          Maribel Escobar  53   f
      298            Kristin Major       Daifallah el-Zaman  63   m
      299          Jazmine El-Amin              Colin Rains  29   m
      300          Jazmine El-Amin           Kyana Stafford  76   f
      301          Jazmine El-Amin          Azzaam el-Mousa  69   m
      302          Razeen al-Shaer        Jennifer Valverde  63   f
      303          Razeen al-Shaer         Naseera el-Saidi  50   f
      304          Razeen al-Shaer        Justin Cunningham  58   m
      305          Maribel Escobar          Andrew Kelemeni  88   m
      306          Maribel Escobar         Stephanie Nguyen   7   f
      307          Maribel Escobar              Kylie Berry  51   f
      308           Kyana Stafford             Ty Gutierrez  47   m
      309           Kyana Stafford              Gia Morales  45   f
      310           Kyana Stafford            Laneece Ahuna  83   f
      311           Kyana Stafford            Logan Ehrlich  30   m
      312          Azzaam el-Mousa           Binyu Vincelet  41   f
      313         Naseera el-Saidi            Javier Lucero  15   m
      314         Naseera el-Saidi            Katryna Berry  27   f
      315         Naseera el-Saidi           Richard Lawson  88   m
      316         Stephanie Nguyen            Autumn Lucero  74   f
      317              Gia Morales              Luis Taylor   1   m
      318              Gia Morales           Ryan Singleton  84   m
      319            Laneece Ahuna           Jacey Sheppard  79   f
      320           Binyu Vincelet     John Gonzalez Vargas  54   m
      321           Binyu Vincelet        Mujahid al-Salehi  24   m
      322           Binyu Vincelet            Hannah Hamlin  37   f
      323           Richard Lawson        Nicholas Johnston   3   m
      324           Richard Lawson     Muhyddeen al-Barakat  48   m
      325           Jacey Sheppard      Saafiyya el-Mohamed  82   f
      326      Saafiyya el-Mohamed            Stephon White  30   m
          date_first_contact date_last_contact was_case           status
      1           2022-12-29        2023-01-03     TRUE             case
      2           2022-12-28        2023-01-01     TRUE             case
      3           2022-12-26        2023-01-02    FALSE   under_followup
      4           2022-12-28        2023-01-04     TRUE             case
      5           2022-12-31        2023-01-04     TRUE             case
      6           2022-12-31        2023-01-06     TRUE             case
      7           2023-01-01        2023-01-02    FALSE   under_followup
      8           2023-01-03        2023-01-09    FALSE   under_followup
      9           2023-01-02        2023-01-07     TRUE             case
      10          2023-01-03        2023-01-07     TRUE             case
      11          2023-01-03        2023-01-11     TRUE             case
      12          2022-12-30        2023-01-08    FALSE lost_to_followup
      13          2023-01-04        2023-01-09     TRUE             case
      14          2023-01-09        2023-01-17    FALSE   under_followup
      15          2023-01-07        2023-01-16    FALSE          unknown
      16          2023-01-11        2023-01-13    FALSE   under_followup
      17          2023-01-09        2023-01-17     TRUE             case
      18          2023-01-07        2023-01-14     TRUE             case
      19          2023-01-08        2023-01-13    FALSE lost_to_followup
      20          2023-01-09        2023-01-15    FALSE          unknown
      21          2023-01-07        2023-01-17     TRUE             case
      22          2023-01-12        2023-01-16    FALSE   under_followup
      23          2023-01-08        2023-01-15     TRUE             case
      24          2023-01-11        2023-01-14    FALSE lost_to_followup
      25          2023-01-08        2023-01-13    FALSE   under_followup
      26          2023-01-09        2023-01-16     TRUE             case
      27          2023-01-07        2023-01-15    FALSE   under_followup
      28          2023-01-08        2023-01-14     TRUE             case
      29          2023-01-07        2023-01-13     TRUE             case
      30          2023-01-10        2023-01-16     TRUE             case
      31          2023-01-10        2023-01-17    FALSE   under_followup
      32          2023-01-12        2023-01-15     TRUE             case
      33          2023-01-12        2023-01-18     TRUE             case
      34          2023-01-16        2023-01-21     TRUE             case
      35          2023-01-20        2023-01-23    FALSE   under_followup
      36          2023-01-19        2023-01-25    FALSE   under_followup
      37          2023-01-19        2023-01-23     TRUE             case
      38          2023-01-18        2023-01-24     TRUE             case
      39          2023-01-20        2023-01-26    FALSE   under_followup
      40          2023-01-17        2023-01-21     TRUE             case
      41          2023-01-15        2023-01-20    FALSE   under_followup
      42          2023-01-14        2023-01-21    FALSE   under_followup
      43          2023-01-18        2023-01-21     TRUE             case
      44          2023-01-19        2023-01-25     TRUE             case
      45          2023-01-12        2023-01-18    FALSE   under_followup
      46          2023-01-23        2023-01-28     TRUE             case
      47          2023-01-26        2023-01-29    FALSE   under_followup
      48          2023-01-19        2023-01-28    FALSE lost_to_followup
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
      60          2023-01-28        2023-01-30    FALSE lost_to_followup
      61          2023-01-26        2023-02-02    FALSE lost_to_followup
      62          2023-01-27        2023-01-31     TRUE             case
      63          2023-01-26        2023-02-01     TRUE             case
      64          2023-01-28        2023-02-02     TRUE             case
      65          2023-01-27        2023-01-30     TRUE             case
      66          2023-01-31        2023-02-08    FALSE lost_to_followup
      67          2023-01-24        2023-01-27    FALSE   under_followup
      68          2023-01-20        2023-01-27    FALSE   under_followup
      69          2023-01-23        2023-01-30    FALSE   under_followup
      70          2023-01-19        2023-01-28     TRUE             case
      71          2023-01-21        2023-01-25    FALSE   under_followup
      72          2023-01-25        2023-02-02     TRUE             case
      73          2023-01-28        2023-02-04    FALSE lost_to_followup
      74          2023-01-27        2023-02-05    FALSE   under_followup
      75          2023-01-25        2023-02-04    FALSE   under_followup
      76          2023-01-26        2023-02-01     TRUE             case
      77          2023-01-26        2023-01-30     TRUE             case
      78          2023-01-25        2023-02-03    FALSE   under_followup
      79          2023-01-31        2023-02-02     TRUE             case
      80          2023-01-29        2023-02-04    FALSE          unknown
      81          2023-01-28        2023-02-02    FALSE   under_followup
      82          2023-01-30        2023-02-03    FALSE   under_followup
      83          2023-01-29        2023-02-02    FALSE lost_to_followup
      84          2023-01-30        2023-02-05     TRUE             case
      85          2023-01-30        2023-02-02    FALSE   under_followup
      86          2023-01-29        2023-02-04    FALSE lost_to_followup
      87          2023-01-28        2023-01-30     TRUE             case
      88          2023-01-24        2023-02-03     TRUE             case
      89          2023-01-28        2023-02-05     TRUE             case
      90          2023-01-28        2023-02-03    FALSE lost_to_followup
      91          2023-01-31        2023-02-08    FALSE   under_followup
      92          2023-02-03        2023-02-05     TRUE             case
      93          2023-02-02        2023-02-07    FALSE   under_followup
      94          2023-01-30        2023-02-05    FALSE lost_to_followup
      95          2023-01-28        2023-02-05    FALSE   under_followup
      96          2023-01-31        2023-02-04     TRUE             case
      97          2023-01-27        2023-02-02     TRUE             case
      98          2023-01-31        2023-02-07    FALSE   under_followup
      99          2023-01-27        2023-02-06    FALSE   under_followup
      100         2023-01-28        2023-02-09     TRUE             case
      101         2023-01-29        2023-02-03    FALSE   under_followup
      102         2023-01-31        2023-02-07    FALSE   under_followup
      103         2023-02-02        2023-02-05    FALSE          unknown
      104         2023-01-31        2023-02-07    FALSE   under_followup
      105         2023-01-31        2023-02-07    FALSE          unknown
      106         2023-01-29        2023-02-10    FALSE   under_followup
      107         2023-01-31        2023-02-10     TRUE             case
      108         2023-01-31        2023-02-06    FALSE lost_to_followup
      109         2023-01-30        2023-02-08    FALSE   under_followup
      110         2023-01-31        2023-02-05     TRUE             case
      111         2023-02-02        2023-02-12    FALSE   under_followup
      112         2023-02-04        2023-02-08     TRUE             case
      113         2023-02-10        2023-02-17     TRUE             case
      114         2023-02-08        2023-02-12    FALSE   under_followup
      115         2023-02-08        2023-02-13     TRUE             case
      116         2023-02-11        2023-02-15    FALSE   under_followup
      117         2023-02-10        2023-02-14    FALSE lost_to_followup
      118         2023-02-10        2023-02-12     TRUE             case
      119         2023-02-10        2023-02-16     TRUE             case
      120         2023-02-09        2023-02-21    FALSE   under_followup
      121         2023-02-24        2023-03-01     TRUE             case
      122         2023-02-21        2023-02-26     TRUE             case
      123         2023-02-23        2023-03-01    FALSE   under_followup
      124         2023-02-20        2023-02-26     TRUE             case
      125         2023-02-22        2023-02-26     TRUE             case
      126         2023-02-15        2023-02-22    FALSE   under_followup
      127         2023-02-13        2023-02-19    FALSE   under_followup
      128         2023-02-28        2023-03-03    FALSE   under_followup
      129         2023-03-01        2023-03-07     TRUE             case
      130         2023-03-01        2023-03-04     TRUE             case
      131         2023-03-06        2023-03-11    FALSE   under_followup
      132         2023-02-27        2023-03-13     TRUE             case
      133         2023-02-25        2023-03-02    FALSE   under_followup
      134         2023-02-24        2023-03-05    FALSE lost_to_followup
      135         2023-03-05        2023-03-12    FALSE   under_followup
      136         2023-03-05        2023-03-11    FALSE   under_followup
      137         2023-03-09        2023-03-11     TRUE             case
      138         2023-03-09        2023-03-13     TRUE             case
      139         2023-03-13        2023-03-23    FALSE   under_followup
      140         2023-03-16        2023-03-18    FALSE lost_to_followup
      141         2023-03-15        2023-03-20     TRUE             case
      142         2023-03-16        2023-03-23     TRUE             case
      143         2023-03-14        2023-03-22    FALSE          unknown
      144         2023-03-08        2023-03-15     TRUE             case
      145         2023-03-07        2023-03-14     TRUE             case
      146         2023-03-09        2023-03-11     TRUE             case
      147         2023-03-07        2023-03-10    FALSE   under_followup
      148         2023-03-03        2023-03-12    FALSE   under_followup
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
      159         2023-03-12        2023-03-19    FALSE   under_followup
      160         2023-03-11        2023-03-18    FALSE   under_followup
      161         2023-03-08        2023-03-14    FALSE lost_to_followup
      162         2023-03-10        2023-03-18     TRUE             case
      163         2023-03-14        2023-03-19     TRUE             case
      164         2023-03-23        2023-03-27    FALSE lost_to_followup
      165         2023-03-20        2023-03-26     TRUE             case
      166         2023-03-16        2023-03-21    FALSE   under_followup
      167         2023-03-14        2023-03-19    FALSE   under_followup
      168         2023-03-16        2023-03-22    FALSE          unknown
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
      179         2023-03-12        2023-03-16    FALSE   under_followup
      180         2023-03-15        2023-03-22    FALSE   under_followup
      181         2023-03-12        2023-03-21     TRUE             case
      182         2023-03-12        2023-03-17    FALSE   under_followup
      183         2023-03-23        2023-04-01    FALSE   under_followup
      184         2023-03-29        2023-03-31    FALSE lost_to_followup
      185         2023-03-23        2023-03-28     TRUE             case
      186         2023-03-24        2023-03-27    FALSE   under_followup
      187         2023-03-22        2023-03-29    FALSE   under_followup
      188         2023-03-22        2023-03-30     TRUE             case
      189         2023-03-24        2023-03-28    FALSE   under_followup
      190         2023-03-23        2023-03-29    FALSE   under_followup
      191         2023-03-21        2023-03-30    FALSE   under_followup
      192         2023-03-22        2023-03-30    FALSE   under_followup
      193         2023-03-23        2023-03-29    FALSE   under_followup
      194         2023-03-24        2023-03-27     TRUE             case
      195         2023-03-22        2023-03-27     TRUE             case
      196         2023-03-23        2023-04-01     TRUE             case
      197         2023-03-31        2023-04-06    FALSE   under_followup
      198         2023-04-03        2023-04-06     TRUE             case
      199         2023-03-31        2023-04-07     TRUE             case
      200         2023-04-01        2023-04-04     TRUE             case
      201         2023-03-26        2023-04-02     TRUE             case
      202         2023-03-27        2023-04-03    FALSE lost_to_followup
      203         2023-03-29        2023-03-29    FALSE lost_to_followup
      204         2023-03-24        2023-04-02     TRUE             case
      205         2023-03-26        2023-03-29    FALSE          unknown
      206         2023-03-25        2023-03-31    FALSE   under_followup
      207         2023-03-20        2023-04-03    FALSE   under_followup
      208         2023-03-24        2023-04-01     TRUE             case
      209         2023-03-26        2023-04-03     TRUE             case
      210         2023-03-29        2023-03-31     TRUE             case
      211         2023-03-25        2023-03-28    FALSE   under_followup
      212         2023-04-04        2023-04-10     TRUE             case
      213         2023-04-02        2023-04-05     TRUE             case
      214         2023-04-07        2023-04-08    FALSE   under_followup
      215         2023-04-04        2023-04-11    FALSE   under_followup
      216         2023-03-31        2023-04-03    FALSE   under_followup
      217         2023-03-30        2023-04-06    FALSE   under_followup
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
      243         2023-04-07        2023-04-11    FALSE lost_to_followup
      244         2023-04-08        2023-04-12     TRUE             case
      245         2023-04-08        2023-04-12    FALSE   under_followup
      246         2023-04-04        2023-04-11    FALSE lost_to_followup
      247         2023-04-08        2023-04-14    FALSE   under_followup
      248         2023-04-07        2023-04-14    FALSE   under_followup
      249         2023-04-09        2023-04-17     TRUE             case
      250         2023-04-09        2023-04-11     TRUE             case
      251         2023-04-08        2023-04-13     TRUE             case
      252         2023-04-06        2023-04-14     TRUE             case
      253         2023-04-11        2023-04-15     TRUE             case
      254         2023-04-13        2023-04-19     TRUE             case
      255         2023-04-14        2023-04-16    FALSE   under_followup
      256         2023-04-14        2023-04-16    FALSE          unknown
      257         2023-04-11        2023-04-20     TRUE             case
      258         2023-04-13        2023-04-18    FALSE          unknown
      259         2023-04-13        2023-04-16    FALSE lost_to_followup
      260         2023-04-13        2023-04-21     TRUE             case
      261         2023-04-10        2023-04-20     TRUE             case
      262         2023-04-10        2023-04-16    FALSE   under_followup
      263         2023-04-14        2023-04-22     TRUE             case
      264         2023-04-15        2023-04-26     TRUE             case
      265         2023-04-15        2023-04-22    FALSE          unknown
      266         2023-04-19        2023-04-27     TRUE             case
      267         2023-04-20        2023-04-23     TRUE             case
      268         2023-04-13        2023-04-19    FALSE   under_followup
      269         2023-04-14        2023-04-21    FALSE   under_followup
      270         2023-04-13        2023-04-17    FALSE   under_followup
      271         2023-04-14        2023-04-19    FALSE lost_to_followup
      272         2023-04-13        2023-04-16    FALSE lost_to_followup
      273         2023-04-23        2023-04-26    FALSE   under_followup
      274         2023-04-24        2023-04-30    FALSE lost_to_followup
      275         2023-04-12        2023-04-16    FALSE   under_followup
      276         2023-04-11        2023-04-14     TRUE             case
      277         2023-04-23        2023-04-29     TRUE             case
      278         2023-04-15        2023-04-24     TRUE             case
      279         2023-04-16        2023-04-24     TRUE             case
      280         2023-04-14        2023-04-21    FALSE          unknown
      281         2023-04-16        2023-04-22     TRUE             case
      282         2023-04-20        2023-04-22    FALSE          unknown
      283         2023-04-28        2023-05-01     TRUE             case
      284         2023-04-23        2023-05-01     TRUE             case
      285         2023-04-22        2023-04-27    FALSE lost_to_followup
      286         2023-04-22        2023-04-27    FALSE   under_followup
      287         2023-04-23        2023-04-26    FALSE   under_followup
      288         2023-04-21        2023-04-23    FALSE   under_followup
      289         2023-04-19        2023-04-23    FALSE lost_to_followup
      290         2023-04-19        2023-04-23     TRUE             case
      291         2023-04-16        2023-04-22     TRUE             case
      292         2023-04-29        2023-05-09     TRUE             case
      293         2023-04-30        2023-05-05    FALSE   under_followup
      294         2023-05-02        2023-05-06    FALSE   under_followup
      295         2023-05-03        2023-05-07     TRUE             case
      296         2023-05-01        2023-05-04    FALSE   under_followup
      297         2023-04-25        2023-05-05     TRUE             case
      298         2023-04-27        2023-05-03    FALSE          unknown
      299         2023-04-21        2023-04-28    FALSE   under_followup
      300         2023-04-19        2023-05-02     TRUE             case
      301         2023-04-18        2023-04-25     TRUE             case
      302         2023-05-03        2023-05-08    FALSE   under_followup
      303         2023-05-01        2023-05-07     TRUE             case
      304         2023-05-03        2023-05-11    FALSE   under_followup
      305         2023-04-28        2023-05-05    FALSE   under_followup
      306         2023-04-25        2023-05-06     TRUE             case
      307         2023-04-30        2023-05-08    FALSE   under_followup
      308         2023-04-20        2023-04-24    FALSE   under_followup
      309         2023-04-19        2023-04-26     TRUE             case
      310         2023-04-20        2023-04-27     TRUE             case
      311         2023-04-22        2023-04-23    FALSE   under_followup
      312         2023-04-25        2023-04-30     TRUE             case
      313         2023-05-06        2023-05-10    FALSE   under_followup
      314         2023-05-06        2023-05-10    FALSE   under_followup
      315         2023-05-05        2023-05-10     TRUE             case
      316         2023-05-08        2023-05-09    FALSE lost_to_followup
      317         2023-04-21        2023-04-30    FALSE          unknown
      318         2023-04-22        2023-05-01    FALSE          unknown
      319         2023-04-22        2023-04-28     TRUE             case
      320         2023-04-22        2023-04-30    FALSE          unknown
      321         2023-04-25        2023-04-29    FALSE lost_to_followup
      322         2023-04-21        2023-04-28    FALSE   under_followup
      323         2023-05-08        2023-05-12    FALSE lost_to_followup
      324         2023-05-04        2023-05-15    FALSE   under_followup
      325         2023-04-27        2023-05-03     TRUE             case
      326         2023-05-03        2023-05-10    FALSE lost_to_followup
      

# sim_outbreak works as expected

    Code
      sim_outbreak(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
      $linelist
         id            case_name case_type sex age date_onset date_reporting
      1   1   Jennifer Pritchett confirmed   f   1 2023-01-01     2023-01-01
      2   2         Tyler Payson confirmed   f  29 2023-01-01     2023-01-01
      3   3            Sean Wong confirmed   m  78 2023-01-01     2023-01-01
      4   5       Bishr al-Safar confirmed   m  70 2023-01-01     2023-01-01
      5   6 Francisco Montgomery  probable   m  28 2023-01-01     2023-01-01
      6   8         Jack Millard suspected   m  61 2023-01-01     2023-01-01
      7  11        Robert Abeyta confirmed   m  86 2023-01-01     2023-01-01
      8  12         Olivia Smith  probable   f  71 2023-01-01     2023-01-01
      9  13          Hope Holley  probable   f  51 2023-01-01     2023-01-01
      10 18      Viviana Crespin  probable   f  49 2023-01-02     2023-01-02
      11 20           Codie John  probable   m   7 2023-01-02     2023-01-02
      12 22          Wyona Flynn confirmed   f  24 2023-01-02     2023-01-02
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
                         from                      to age sex date_first_contact
      1    Jennifer Pritchett            Tyler Payson  29   f         2022-12-30
      2    Jennifer Pritchett               Sean Wong  78   m         2022-12-31
      3          Tyler Payson        Muneeb al-Hallal  22   m         2022-12-30
      4          Tyler Payson          Bishr al-Safar  70   m         2022-12-31
      5             Sean Wong    Francisco Montgomery  28   m         2022-12-29
      6             Sean Wong              Andi Trang  37   m         2022-12-27
      7             Sean Wong            Jack Millard  61   m         2022-12-28
      8        Bishr al-Safar        Avery Weitendorf  46   m         2022-12-28
      9  Francisco Montgomery        Anthony Gonzales  67   m         2022-12-29
      10         Jack Millard           Robert Abeyta  86   m         2022-12-30
      11         Jack Millard            Olivia Smith  71   f         2022-12-28
      12         Jack Millard             Hope Holley  51   f         2022-12-29
      13        Robert Abeyta      Bradford Patterson  44   m         2022-12-28
      14        Robert Abeyta         Michiyo Abraham  49   f         2022-12-30
      15        Robert Abeyta         Sakeena el-Azer  60   f         2022-12-30
      16         Olivia Smith                Alex Ngu  56   m         2022-12-24
      17          Hope Holley         Viviana Crespin  49   f         2022-12-29
      18          Hope Holley Preston Salas Dominguez  50   m         2022-12-30
      19          Hope Holley              Codie John   7   m         2022-12-31
      20          Hope Holley           Reece Milburn  20   m         2022-12-29
      21      Viviana Crespin             Wyona Flynn  24   f         2022-12-27
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
      1   1 rRMCAJFEY3 suspected   f   1 2023-01-01     2023-01-01     2023-01-04
      2   2 qKY39Zyiuu  probable   f  29 2023-01-01     2023-01-01     2023-01-02
      3   3 oY8Kxng7Az confirmed   m  78 2023-01-01     2023-01-01           <NA>
      4   5 m1SzNbO5h4 suspected   m  70 2023-01-01     2023-01-01     2023-01-05
      5   6 yEtT6tejRt confirmed   m  28 2023-01-01     2023-01-01     2023-01-14
      6   8 KFNmydPL7X  probable   m  61 2023-01-01     2023-01-01           <NA>
      7  11 9tYeb1elcz confirmed   m  86 2023-01-01     2023-01-01           <NA>
      8  12 XnmE3U4HDz confirmed   f  71 2023-01-01     2023-01-01     2023-01-02
      9  13 SVgVAWQihv  probable   f  51 2023-01-01     2023-01-01           <NA>
      10 18 LY9VZdzuuT  probable   f  49 2023-01-02     2023-01-02           <NA>
      11 20 3WvUcVV4dJ  probable   m   7 2023-01-02     2023-01-02           <NA>
      12 22 k6RZkfVJ5f confirmed   f  24 2023-01-02     2023-01-02           <NA>
           outcome date_outcome date_first_contact date_last_contact ct_value
      1       died   2023-01-18               <NA>              <NA>       NA
      2       died   2023-02-09         2022-12-30        2023-01-08       NA
      3  recovered         <NA>         2022-12-31        2023-01-05     23.9
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
      1  rRMCAJFEY3 qKY39Zyiuu  29   f         2022-12-30        2023-01-08     TRUE
      2  rRMCAJFEY3 oY8Kxng7Az  78   m         2022-12-31        2023-01-05     TRUE
      3  qKY39Zyiuu DS6oXfHuaq  22   m         2022-12-30        2023-01-03    FALSE
      4  qKY39Zyiuu m1SzNbO5h4  70   m         2022-12-31        2023-01-04     TRUE
      5  oY8Kxng7Az yEtT6tejRt  28   m         2022-12-29        2023-01-02     TRUE
      6  oY8Kxng7Az 34oCba8e6y  37   m         2022-12-27        2023-01-01    FALSE
      7  oY8Kxng7Az KFNmydPL7X  61   m         2022-12-28        2023-01-05     TRUE
      8  m1SzNbO5h4 eZaLTmhWsV  46   m         2022-12-28        2023-01-02    FALSE
      9  yEtT6tejRt UBVWYTLkhw  67   m         2022-12-29        2023-01-04    FALSE
      10 KFNmydPL7X 9tYeb1elcz  86   m         2022-12-30        2023-01-04     TRUE
      11 KFNmydPL7X XnmE3U4HDz  71   f         2022-12-28        2023-01-09     TRUE
      12 KFNmydPL7X SVgVAWQihv  51   f         2022-12-29        2023-01-04     TRUE
      13 9tYeb1elcz SfYVARDjDa  44   m         2022-12-28        2023-01-04    FALSE
      14 9tYeb1elcz fq8m2zbFUJ  49   f         2022-12-30        2023-01-02    FALSE
      15 9tYeb1elcz RewLYtBBlI  60   f         2022-12-30        2023-01-05    FALSE
      16 XnmE3U4HDz dUTzmcTo9H  56   m         2022-12-24        2023-01-04    FALSE
      17 SVgVAWQihv LY9VZdzuuT  49   f         2022-12-29        2023-01-04     TRUE
      18 SVgVAWQihv 3p6KxuczwJ  50   m         2022-12-30        2023-01-03    FALSE
      19 SVgVAWQihv 3WvUcVV4dJ   7   m         2022-12-31        2023-01-03     TRUE
      20 SVgVAWQihv 6ZKaUKvu5A  20   m         2022-12-29        2023-01-04    FALSE
      21 LY9VZdzuuT k6RZkfVJ5f  24   f         2022-12-27        2023-01-05     TRUE
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
         id              case_name case_type sex age date_onset date_reporting
      1   1     Jennifer Pritchett confirmed   f   1 2023-01-01     2023-01-01
      2   2           Tyler Payson confirmed   f  29 2023-01-01     2023-01-01
      3   3       Faisal al-Hallal confirmed   m  78 2023-01-01     2023-01-01
      4   5        Collin Johnston confirmed   m  70 2023-01-01     2023-01-01
      5   6               Kaleb Le  probable   m  28 2023-01-01     2023-01-01
      6   8       Muslim el-Radwan suspected   m  61 2023-01-01     2023-01-01
      7  11         Nicholas Black confirmed   m  86 2023-01-01     2023-01-01
      8  12           Olivia Smith  probable   f  71 2023-01-01     2023-01-01
      9  13            Hope Holley  probable   f  51 2023-01-01     2023-01-01
      10 18        Viviana Crespin  probable   f  49 2023-01-02     2023-01-02
      11 20 Cass Montelongo Declay  probable   m   7 2023-01-02     2023-01-02
      12 22            Wyona Flynn confirmed   f  24 2023-01-02     2023-01-02
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
      1  Jennifer Pritchett           Tyler Payson  29   f         2022-12-30
      2  Jennifer Pritchett       Faisal al-Hallal  78   m         2022-12-31
      3        Tyler Payson       Dhaakir al-Safar  22   m         2022-12-30
      4        Tyler Payson        Collin Johnston  70   m         2022-12-31
      5    Faisal al-Hallal               Kaleb Le  28   m         2022-12-29
      6    Faisal al-Hallal         Junaid el-Huda  37   m         2022-12-27
      7    Faisal al-Hallal       Muslim el-Radwan  61   m         2022-12-28
      8     Collin Johnston           Corey Cabral  46   m         2022-12-28
      9            Kaleb Le           Sean Qureshi  67   m         2022-12-29
      10   Muslim el-Radwan         Nicholas Black  86   m         2022-12-30
      11   Muslim el-Radwan           Olivia Smith  71   f         2022-12-28
      12   Muslim el-Radwan            Hope Holley  51   f         2022-12-29
      13     Nicholas Black           Daniel Yoder  44   m         2022-12-28
      14     Nicholas Black        Michiyo Abraham  49   f         2022-12-30
      15     Nicholas Black        Sakeena el-Azer  60   f         2022-12-30
      16       Olivia Smith       Francisco Huerta  56   m         2022-12-24
      17        Hope Holley        Viviana Crespin  49   f         2022-12-29
      18        Hope Holley     Anthony Montgomery  50   m         2022-12-30
      19        Hope Holley Cass Montelongo Declay   7   m         2022-12-31
      20        Hope Holley           Andi Sundara  20   m         2022-12-29
      21    Viviana Crespin            Wyona Flynn  24   f         2022-12-27
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
      

