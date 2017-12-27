#!/usr/bin/python2.7
import gaussian_manage
output = open("Output","w")
ff = gaussian_manage.GauIO(output,"NH3-force.gjf")
ff.get_MachAndOpt()
print(ff.MachineList)
print(ff.OptionList)
ff.get_TCSGR()
print(ff.TitleList)
print("Spin of this system is %5i" %ff.Spin)
print("Charge of this system is %5i" %ff.Charge)
for xx in ff.GeomList:
    print(xx)
print(ff.RestList)
ff.form_Inp()
