def update_aims_scpt2(C,FitClass):
    '''\
    update xc_functional group for SCPT2 type optimization in Aims package\
    '''
    FitClass.add_CMD=[]
    FitClass.add_CMD.append('en_shift            %16i' %3)
    FitClass.add_CMD.append('coupling_pt2_factor %16.8f' %C[0])
    FitClass.add_CMD.append('coupling_pt2_screen %16.8f' %C[1])
    FitClass.add_CMD.append('coupling_pt2_shift  %16.8f' %C[2])
    FitClass.SCPT2_Para = C[3:]
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

def update_aims_scsrpa(C,FitClass):
    '''\
    update xc_functional group for SCPT2 type optimization in Aims package\
    '''
    FitClass.add_CMD=[]
    print(C)
    printString = 'renormalized_eg  '+len(C)*'%16.8f'
    FitClass.add_CMD.append(printString %tuple(C))
    printString = 'scsrpa_coeff  '+2*'%16.8f'
    FitClass.add_CMD.append(printString %tuple([1.0,1.0]))
    return
