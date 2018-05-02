def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    a1, a4, a8, a11 = C
    a2  = 1. - a1
    a3  = 0.
    a5  = 0.
    a6  = 0.
    #a8  = 0.
    a7  = a8
    a9  = a8
    #a11 = 0. 
    a10 = a11
    a12 = a11

    E_noXC, Ex_HF, Ex_LDA, dEx_B, Ec_VWN, dEc_LYP, Ec_PT21, aaaa, abab, bbbb,\
    aaaa_erf200, abab_erf200, bbbb_erf200 = P
    return E_noXC + a1*Ex_HF + a2*Ex_LDA + a3*dEx_B + a4*Ec_VWN + a5* dEc_LYP \
           + a6*Ec_PT21 + a7*aaaa + a8*abab + a9*bbbb\
        + a10*aaaa_erf200 + a11*abab_erf200 + a12*bbbb_erf200

def opt_func_constrained(C,P):
    '''\
    The constrained function for optimization, where C is the parameters
    '''
    con = 0.5
    for a in C:
        if a<0 or a>1:
            con = -1
            break
    return con
