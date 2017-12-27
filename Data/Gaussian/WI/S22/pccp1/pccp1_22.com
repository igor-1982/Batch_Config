%nproc=8
%mem=1200MB
#p B3LYP/6-311+G(d,p) scf=tight

1 adenine_thymine_wc c1 -16.37
Bond(N1-H26)=2.2

0 1
 N
 C                  1              B1
 C                  2              B2    1              A1
 C                  3              B3    2              A2    1              D1
 N                  4              B4    3              A3    2              D2
 C                  5              B5    4              A4    3              D3
 N                  3              B6    2              A5    1              D4
 C                  7              B7    3              A6    2              D5
 N                  8              B8    7              A7    3              D6
 N                  2              B9    1              A8    6              D7
 H                  6             B10    5              A9    4              D8
 H                  8             B11    7             A10    3              D9
 H                  9             B12    8             A11    7             D10
 H                 10             B13    2             A12    1             D11
 H                 10             B14    2             A13    1             D12
 N                  1             B15    2             A14   10             D13
 C                 16             B16    1             A15    2             D14
 C                 17             B17   16             A16    1             D15
 C                 18             B18   17             A17   16             D16
 N                 19             B19   18             A18   17             D17
 C                 20             B20   19             A19   18             D18
 C                 18             B21   17             A20   16             D19
 O                 19             B22   18             A21   17             D20
 O                 21             B23   20             A22   19             D21
 H                 16             B24    1             A23    2             D22
 H                 20             B25   19             A24   18             D23
 H                 17             B26   16             A25    1             D24
 H                 22             B27   18             A26   17             D25
 H                 22             B28   18             A27   17             D26
 H                 22             B29   18             A28   17             D27

   B1             1.34293376
   B2             1.40835529
   B3             1.39461183
   B4             1.33954347
   B5             1.32999875
   B6             1.37542423
   B7             1.32245721
   B8             1.36773680
   B9             1.34036965
   B10            1.08269640
   B11            1.07713472
   B12            1.00640024
   B13            1.01557015
   B14            1.00337681
   B15            5.35948654
   B16            1.37065756
   B17            1.35159399
   B18            1.45571063
   B19            1.38276755
   B20            1.37680904
   B21            1.49224371
   B22            1.23255868
   B23            1.21808228
   B24            1.00628499
   B25            1.04197773
   B26            1.08096097
   B27            1.08887952
   B28            1.08887697
   B29            1.08809225
   A1           117.54431474
   A2           116.40803255
   A3           127.34884914
   A4           110.79019868
   A5           131.65022442
   A6           103.35476168
   A7           113.45474310
   A8           119.89336200
   A9           116.91446306
   A10          124.83795866
   A11          127.25955256
   A12          120.27458114
   A13          118.31545578
   A14          135.63797045
   A15          108.09989962
   A16          122.25245290
   A17          117.80025072
   A18          115.79966880
   A19          127.31456229
   A20          123.80061466
   A21          123.25703718
   A22          124.11787928
   A23          130.77575522
   A24          117.00575289
   A25          115.62779935
   A26          110.54635327
   A27          110.54358880
   A28          110.92779104
   D1            -0.13583776
   D2             0.03217690
   D3             0.06135345
   D4           179.79552526
   D5          -179.95140126
   D6             0.00000000
   D7          -179.41910958
   D8           179.92730171
   D9           179.99635551
   D10          179.98275129
   D11           -3.87015226
   D12         -176.96418653
   D13            1.91216353
   D14            0.85269578
   D15           -0.14456070
   D16           -0.00752111
   D17           -0.03593076
   D18            0.12008881
   D19          179.99496253
   D20          179.95967636
   D21          179.85767382
   D22         -179.37402058
   D23          180.00000000
   D24          179.84340012
   D25          120.95097781
   D26         -120.93281130
   D27            0.00749070

