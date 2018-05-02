def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    a1, a2, a3, a4, a5, a6, a7 = C
    #a1 = 0.5; a2  = 1 - a1
    #a3  = 1. - a4

    E_noXC, Ex_HF, Ex_PBE, Ec_PBE, rospt2, Ex_SCAN, Ec_SCAN, Ec_vdW = P
    #return E_noXC + a1*Ex_HF + a2*Ex_SCAN + a3*Ec_SCAN + a4*rospt2 + a5*Ec_vdW
    #return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE + a4*rospt2 + a5*Ec_vdW
    return E_noXC + a1*Ex_HF + a2*Ex_PBE + a3*Ec_PBE + a4*rospt2 + \
                   a5*(Ex_SCAN-Ex_PBE) + a6*(Ec_SCAN-Ec_PBE) + a7*Ec_vdW

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
