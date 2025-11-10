# sim_linelist works as expected with defaults

    Code
      sim_linelist()
    Output
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

# sim_linelist works as expected

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death)
    Output
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

# sim_linelist works as expected with age-strat risks

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_risk = age_dep_hosp_risk, hosp_death_risk = age_dep_hosp_death_risk,
        non_hosp_death_risk = age_dep_non_hosp_death_risk)
    Output
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

# sim_linelist works as expected with anonymous

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        anonymise = TRUE)
    Output
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
      1   1          Victor Charles suspected   m  44 2023-01-01     2023-01-01
      2   2            Zachery Pena confirmed   m  77 2023-01-01     2023-01-01
      3   3          Noori al-Rassi  probable   m  90 2023-01-01     2023-01-01
      4   5            Taylor Allen  probable   m  19 2023-01-01     2023-01-01
      5   6         Destinee Harvie suspected   f  17 2023-01-01     2023-01-01
      6   8         Chengleng Xiong  probable   m  75 2023-01-01     2023-01-01
      7  11      Faseeha el-Chahine confirmed   f  46 2023-01-01     2023-01-01
      8  12          Zane Melendrez suspected   m  19 2023-01-01     2023-01-01
      9  13        Kaamil al-Elamin  probable   m  75 2023-01-01     2023-01-01
      10 18                Maia Xue confirmed   f  24 2023-01-02     2023-01-02
      11 20 Nicole Chavez Rodriguez confirmed   f  79 2023-01-02     2023-01-02
      12 22           Alizea Bailey confirmed   f  39 2023-01-02     2023-01-02
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

# sim_linelist works as expected with time-varying cfr & age-strat

    Code
      sim_linelist(contact_distribution = contact_distribution, infectious_period = infectious_period,
        prob_infection = 0.5, onset_to_hosp = onset_to_hosp, onset_to_death = onset_to_death,
        hosp_death_risk = age_dep_hosp_death_risk, config = create_config(
          time_varying_death_risk = function(risk, time) risk * exp(-time)))
    Output
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

