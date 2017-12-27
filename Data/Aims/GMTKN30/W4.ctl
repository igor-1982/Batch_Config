# The project environment :
#     "ProjDir" specifying the storage DIR of this project
#     "ProjCtrl" = 0 : to run all the jobs
#           = 1 : to fetch result from existed log and chk files
#           = 2 : to run the job without corresponding log or chk files
#       "ProjTool" = "Gaussian" : to run jobs using Gaussian package (default)
#                  = "QChem"    : to run jobs using Q-Chem package
#                "ProjDir"       "ProjCtrl"      "ProjTool"
__project__ ::   ./W4           2                 Aims

# The project description
__title__ ::
"============================== W4 set ============================="
"             This is W4 subset from GMTKN30 proposed by Grimme     "

# several global statements of control.in for aims Package
__aims_basis__ :: /home/igor/Documents/Package-Pool/aims/aimsfiles/species_defaults/Dunning/cc-pVQZ
__aims__ ::  2  051512.mpi
xc                      pbe                  
total_energy_method     rpa
relativistic            none
occupation_type         integer 0.0001
mixer                   pulay
n_max_pulay             10
charge_mix_param        0.6
sc_accuracy_rho  1E-6
sc_accuracy_eev  1E-4
sc_accuracy_etot 1E-6
sc_iter_limit    200
end aims          


# Specify <MacroPath> to be used in the batch
__macro_path__  ::
<PATH1> = '.'

# The molecular set to batch: 
#                111 is the total number of jobs in this batch list
__batch__ :: 111
#"Flag"         "DIR"                        "InpName"       "JobType"
  alcl3         <PATH1>/W4                   alcl3        energy
   alcl         <PATH1>/W4                    alcl        energy
     al         <PATH1>/W4                      al        energy
   alf3         <PATH1>/W4                    alf3        energy
    alf         <PATH1>/W4                     alf        energy
   alh3         <PATH1>/W4                    alh3        energy
    alh         <PATH1>/W4                     alh        energy
     b2         <PATH1>/W4                      b2        energy
   b2h6         <PATH1>/W4                    b2h6        energy
      b         <PATH1>/W4                       b        energy
    be2         <PATH1>/W4                     be2        energy
  becl2         <PATH1>/W4                   becl2        energy
     be         <PATH1>/W4                      be        energy
   bef2         <PATH1>/W4                    bef2        energy
   bf2h         <PATH1>/W4                    bf2h        energy
    bf3         <PATH1>/W4                     bf3        energy
     bf         <PATH1>/W4                      bf        energy
    bh3         <PATH1>/W4                     bh3        energy
     bh         <PATH1>/W4                      bh        energy
   bn_S         <PATH1>/W4                    bn_S        energy
   bn_T         <PATH1>/W4                    bn_T        energy
     c2         <PATH1>/W4                      c2        energy
   c2h2         <PATH1>/W4                    c2h2        energy
   c2h4         <PATH1>/W4                    c2h4        energy
   c2h6         <PATH1>/W4                    c2h6        energy
    c2h         <PATH1>/W4                     c2h        energy
   ccl2         <PATH1>/W4                    ccl2        energy
      c         <PATH1>/W4                       c        energy
    cf2         <PATH1>/W4                     cf2        energy
     cf         <PATH1>/W4                      cf        energy
   ch2c         <PATH1>/W4                    ch2c        energy
  ch2ch         <PATH1>/W4                   ch2ch        energy
    ch2         <PATH1>/W4                     ch2        energy
 ch2nh2         <PATH1>/W4                  ch2nh2        energy
  ch2nh         <PATH1>/W4                   ch2nh        energy
   ch2o         <PATH1>/W4                    ch2o        energy
    ch3         <PATH1>/W4                     ch3        energy
 ch3nh2         <PATH1>/W4                  ch3nh2        energy
  ch3nh         <PATH1>/W4                   ch3nh        energy
    ch4         <PATH1>/W4                     ch4        energy
     ch         <PATH1>/W4                      ch        energy
    cl2         <PATH1>/W4                     cl2        energy
   cl2o         <PATH1>/W4                    cl2o        energy
   clcn         <PATH1>/W4                    clcn        energy
     cl         <PATH1>/W4                      cl        energy
    clf         <PATH1>/W4                     clf        energy
    clo         <PATH1>/W4                     clo        energy
   cloo         <PATH1>/W4                    cloo        energy
     cn         <PATH1>/W4                      cn        energy
    co2         <PATH1>/W4                     co2        energy
     co         <PATH1>/W4                      co        energy
    cs2         <PATH1>/W4                     cs2        energy
     cs         <PATH1>/W4                      cs        energy
     f2         <PATH1>/W4                      f2        energy
    f2o         <PATH1>/W4                     f2o        energy
      f         <PATH1>/W4                       f        energy
    fo2         <PATH1>/W4                     fo2        energy
   foof         <PATH1>/W4                    foof        energy
   h2cn         <PATH1>/W4                    h2cn        energy
     h2         <PATH1>/W4                      h2        energy
   h2o2         <PATH1>/W4                    h2o2        energy
    h2o         <PATH1>/W4                     h2o        energy
    h2s         <PATH1>/W4                     h2s        energy
    hcl         <PATH1>/W4                     hcl        energy
    hcn         <PATH1>/W4                     hcn        energy
    hco         <PATH1>/W4                     hco        energy
      h         <PATH1>/W4                       h        energy
     hf         <PATH1>/W4                      hf        energy
    hno         <PATH1>/W4                     hno        energy
   hocl         <PATH1>/W4                    hocl        energy
    hof         <PATH1>/W4                     hof        energy
    hoo         <PATH1>/W4                     hoo        energy
     hs         <PATH1>/W4                      hs        energy
     n2         <PATH1>/W4                      n2        energy
   n2h2         <PATH1>/W4                    n2h2        energy
   n2h4         <PATH1>/W4                    n2h4        energy
    n2h         <PATH1>/W4                     n2h        energy
    n2o         <PATH1>/W4                     n2o        energy
   nccn         <PATH1>/W4                    nccn        energy
      n         <PATH1>/W4                       n        energy
    nh2         <PATH1>/W4                     nh2        energy
    nh3         <PATH1>/W4                     nh3        energy
     nh         <PATH1>/W4                      nh        energy
    no2         <PATH1>/W4                     no2        energy
     no         <PATH1>/W4                      no        energy
     o2         <PATH1>/W4                      o2        energy
     o3         <PATH1>/W4                      o3        energy
   oclo         <PATH1>/W4                    oclo        energy
      o         <PATH1>/W4                       o        energy
    ocs         <PATH1>/W4                     ocs        energy
     of         <PATH1>/W4                      of        energy
     oh         <PATH1>/W4                      oh        energy
     p2         <PATH1>/W4                      p2        energy
     p4         <PATH1>/W4                      p4        energy
      p         <PATH1>/W4                       p        energy
    ph3         <PATH1>/W4                     ph3        energy
     s2         <PATH1>/W4                      s2        energy
    s2o         <PATH1>/W4                     s2o        energy
     s3         <PATH1>/W4                      s3        energy
     s4         <PATH1>/W4                      s4        energy
      s         <PATH1>/W4                       s        energy
  si2h6         <PATH1>/W4                   si2h6        energy
     si         <PATH1>/W4                      si        energy
    sif         <PATH1>/W4                     sif        energy
   sih4         <PATH1>/W4                    sih4        energy
    sih         <PATH1>/W4                     sih        energy
    sio         <PATH1>/W4                     sio        energy
    so2         <PATH1>/W4                     so2        energy
    so3         <PATH1>/W4                     so3        energy
     so         <PATH1>/W4                      so        energy
    ssh         <PATH1>/W4                     ssh        energy


# Training set for the atomization energy
#               99 is the total number of the energy testing data
#           627.51 is the scale factor from "a.u." to "kcal/mol", 
__energy__ :: 99  627.51
#"Number" "Flag" "Scale"                                      "Ref"      "Weight"
  3    h     6    b     2    b2h6    -1                       607.02     1.0
  4    h     1    b     1    f        2    bf2h     -1        410.97     1.0
  3    f     3    b     1    bf3     -1                       470.97     1.0
  3    h     6    c     2    c2h6    -1                       713.08     1.0
  4    h     2    c     1    n        1    h2cn     -1        343.75     1.0
  3    c     2    n     2    nccn    -1                       502.04     1.0
  4    h     4    c     1    n        1    ch2nh2   -1        482.28     1.0
  4    h     4    c     1    n        1    ch3nh    -1        474.63     1.0
  4    h     5    c     1    n        1    ch3nh2   -1        582.30     1.0
  3    f     2    c     1    cf2     -1                       258.78     1.0
  3    h     1    n     2    n2h     -1                       224.86     1.0
  3    h     2    n     2    n2h2    -1                       296.53     1.0
  3    h     4    n     2    n2h4    -1                       438.28     1.0
  3    f     1    o     2    fo2     -1                       134.72     1.0
  3    f     2    o     2    foof    -1                       152.37     1.0
  3    f     3    al    1    alf3    -1                       430.97     1.0
  3    h     6    si    2    si2h6   -1                       535.89     1.0
  2    p     4    p4   -1                                     290.58     1.0
  3    s     1    o     2    so2     -1                       260.62     1.0
  3    s     1    o     3    so3     -1                       346.94     1.0
  4    o     1    c     1    s        1    ocs      -1        335.75     1.0
  3    c     1    s     2    cs2     -1                       280.78     1.0
  3    o     1    s     2    s2o     -1                       208.78     1.0
  2    s     3    s3   -1                                     168.36     1.0
  2    s     4    s4   -1                                     234.35     1.0
  3    be    1    cl    2    becl2   -1                       225.27     1.0
  3    c     1    cl    2    ccl2    -1                       177.36     1.0
  3    al    1    cl    3    alcl3   -1                       312.65     1.0
  4    cl    1    c     1    n        1    clcn     -1        285.45     1.0
  3    o     2    cl    1    oclo    -1                       128.12     1.0
  3    o     2    cl    1    cloo    -1                       126.39     1.0
  3    o     1    cl    2    cl2o    -1                       101.46     1.0
  2    h     2    h2   -1                                     109.49     1.0
  3    h     1    o     1    oh      -1                       107.21     1.0
  3    h     1    f     1    hf      -1                       141.64     1.0
  3    h     2    o     1    h2o     -1                       232.97     1.0
  3    h     1    c     1    ch      -1                       84.220     1.0
  3    h     2    c     1    ch2     -1                       190.74     1.0
  3    h     3    c     1    ch3     -1                       307.87     1.0
  3    h     4    c     1    ch4     -1                       420.42     1.0
  3    h     1    c     2    c2h     -1                       266.16     1.0
  3    h     2    c     2    c2h2    -1                       405.52     1.0
  3    h     3    n     1    nh3     -1                       298.02     1.0
  2    c     2    c2   -1                                     147.02     1.0
  2    n     2    n2   -1                                     228.48     1.0
  3    c     1    o     1    co      -1                       259.73     1.0
  3    c     1    n     1    cn      -1                       181.35     1.0
  3    o     1    n     1    no      -1                       152.75     1.0
  2    o     2    o2   -1                                     120.82     1.0
  3    o     1    f     1    of      -1                       53.080     1.0
  2    f     2    f2   -1                                     39.040     1.0
  3    h     3    p     1    ph3     -1                       242.27     1.0
  3    h     1    s     1    hs      -1                       87.730     1.0
  3    h     2    s     1    h2s     -1                       183.91     1.0
  3    h     1    cl    1    hcl     -1                       107.50     1.0
  3    s     1    o     1    so      -1                       126.47     1.0
  3    cl    1    o     1    clo     -1                       65.450     1.0
  3    cl    1    f     1    clf     -1                       62.800     1.0
  2    p     2    p2   -1                                     117.59     1.0
  2    s     2    s2   -1                                     104.25     1.0
  2    cl    2    cl2  -1                                     59.750     1.0
  2    be    2    be2  -1                                     2.6700     1.0
  2    b     2    b2   -1                                     67.460     1.0
  3    h     1    b     1    bh      -1                       84.990     1.0
  3    h     3    b     1    bh3     -1                       281.29     1.0
  3    n     1    b     1    bn_S    -1                       105.24     1.0
  3    f     1    b     1    bf      -1                       182.52     1.0
  3    n     1    h     1    nh      -1                       83.100     1.0
  3    n     1    h     2    nh2     -1                       182.59     1.0
  4    h     1    c     1    n        1    hcn      -1        313.42     1.0
  4    h     1    o     1    f        1    hof      -1        158.65     1.0
  3    h     1    al    1    alh     -1                       73.570     1.0
  3    h     3    al    1    alh3    -1                       213.17     1.0
  3    f     1    al    1    alf     -1                       163.78     1.0
  3    cl    1    al    1    alcl    -1                       122.62     1.0
  3    h     1    si    1    sih     -1                       73.920     1.0
  3    h     4    si    1    sih4    -1                       324.95     1.0
  3    o     1    si    1    sio     -1                       193.05     1.0
  3    f     1    si    1    sif     -1                       142.71     1.0
  3    c     1    s     1    cs      -1                       172.22     1.0
  3    n     1    b     1    bn_T    -1                       105.82     1.0
  3    c     1    f     1    cf      -1                       132.72     1.0
  3    be    1    f     2    bef2    -1                       309.10     1.0
  3    h     2    c     2    ch2c    -1                       359.93     1.0
  3    h     3    c     2    ch2ch   -1                       446.08     1.0
  3    h     4    c     2    c2h4    -1                       564.10     1.0
  4    h     3    c     1    n        1    ch2nh    -1        439.44     1.0
  4    h     1    c     1    o        1    hco      -1        279.42     1.0
  4    h     2    c     1    o        1    ch2o     -1        374.66     1.0
  3    c     1    o     2    co2     -1                       390.14     1.0
  4    h     1    n     1    o        1    hno      -1        205.89     1.0
  3    n     1    o     2    no2     -1                       227.88     1.0
  3    n     2    o     1    n2o     -1                       270.85     1.0
  2    o     3    o3   -1                                     147.43     1.0
  3    h     1    o     2    hoo     -1                       175.53     1.0
  3    h     2    o     2    h2o2    -1                       269.09     1.0
  3    f     2    o     1    f2o     -1                       93.780     1.0
  4    h     1    o     1    cl       1    hocl     -1        166.23     1.0
  3    h     1    s     2    ssh     -1                       165.13     1.0


