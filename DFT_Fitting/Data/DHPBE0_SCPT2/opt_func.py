def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    a1, a3, a4 = C
    #a1  = 1.0
    a2  = 1. - a1
    a5  = 1. - a3
    #a4  = 0.0

    E_noXC, Ex_HF, Ex_PBE, Ec_PBE, Ec_SS, Ec_OS = P
    return E_noXC + a1*Ex_HF + a2*Ex_PBE +  a3 * Ec_PBE \
           + a4*Ec_SS + a5*Ec_OS 

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
