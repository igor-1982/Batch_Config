#!/bin/env python

def get_Freq(IOut,NAtom,HessList):
    '''Calculate the frequence from Hessian obtained'''
    import os
    import sys
    from numpy import matrix
    from numpy import arange
    from numpy import linalg

    from my_io import print_Error                          # Import private modules
    from my_io import print_List
    from my_io import print_String
    from my_io import print_Matrix

    NumDim	= NAtom * 3
    Hessian 	= matrix(arange(NumDim**2),\
 dtype='float64').reshape(NumDim,NumDim)
    for i in range(NumDim):
        for j in range(i):
            HessIndex	= (i+1)*i/2 + j
            Hessian[i,j]	= HessList[HessIndex]
            Hessian[j,i]	= Hessian[i,j]
        HessIndex		= ((i+1)*i/2) + i
        Hessian[i,i]	= HessList[HessIndex]
    freq, v	= linalg.eig(Hessian)
    print_Matrix(IOut, Hessian, 2,'Hessian Print:')
    return (freq, v)
    

