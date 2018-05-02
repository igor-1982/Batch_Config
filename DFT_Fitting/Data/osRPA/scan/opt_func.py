def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    a3, a4 = C
    a1  = 0.45
    a2  = 1. - a1
    #a3  = 1. - a4

    E_noXC, Ex_HF, Ex_PBE, Ec_PBE, ospt2, rospt2, Ex_SCAN, Ec_SCAN = P
    return E_noXC + a1*Ex_HF + a2*Ex_SCAN + a3*Ec_SCAN + a4*rospt2
    #return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE + a4*rospt2
    #return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE + a4*rospt2 + \
    #	       a5*(Ex_SCAN-Ex_PBE) + a6*(Ec_SCAN-Ec_PBE)

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
