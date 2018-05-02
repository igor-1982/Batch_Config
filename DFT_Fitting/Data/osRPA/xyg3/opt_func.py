def opt_func(C,P):
    '''\
    The function for optimization, where C is the parameters
    '''
    a1, a3, a4, a5 = C
    a2  = 1. - a1

    E_noXC, Ex_HF, Ex_LDA, dEx_B, Ec_VWN, Ec_LYP, ospt2, rospt2 = P
    return E_noXC + a1*Ex_HF + a2*Ex_LDA + a3*Ec_VWN + a4* Ec_LYP + a5*rospt2

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

