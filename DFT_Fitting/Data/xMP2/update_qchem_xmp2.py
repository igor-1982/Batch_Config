def update_qchem_xmp2(C,FitClass):
    '''\
    update xc_functional group for xMP2 type optimization in Q-Chem package\
    '''
    FitClass.XCFList=[]
    FitClass.XCFList.append('x hf       %16.8f' %C[0])
    FitClass.XCFList.append('x becke88  %16.8f' %C[1])
    FitClass.XCFList.append('c lyp      %16.8f' %C[2])
    return

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
