#!/usr/bin/perl
$dir_species = "/u/lucamghi/species_defaults/species_tight-T3"; # foder where all species fiel are located
$list_file = @ARGV[0];
if (-e $list_file) {open(LISTA,"<$list_file");}
else {print "$list_file not found. Aborting\n"; die;}
print "for dir in "; 
LS: while(<LISTA>) {
    @material = split ' ', $_;
    $ZA1 = $material[0];
    $ZA2 = $material[1];
    $latt_name = $material[2];
    $latt_par = $material[3];
    $murg_fit = $material[4]; # if 0 only one point, if 1 n points for Murganam fit 
    if($murg_fit) {
        #print "M plot not yet implemented; doing only single point\n";
        $latt_par_mast = $latt_par;
        # @loop = ("p3", "m3", "m6", "m9" );
        # @coeff = (1.03, 0.97, 0.94, 0.91 ); 
        # @loop = ("00", "p6" );
        # @coeff = (1.00, 1.06 ); 
        @loop = ("00", "p6" , "p3", "m3", "m6", "m9", "p9" );
        @coeff = (1.00, 1.06 , 1.03, 0.97, 0.94, 0.91, 1.09 ); 
        $index = 0; 
        foreach $scale (@loop) {
       	    $nucharge = $ZA1;
	    calc_cmatrix();
	    $el1 = $species; 
	    $specfile1 = sprintf("%2s_%s_default",$ZA1,$el1);  # 67_Ho_default

	    $nucharge = $ZA2;
	    calc_cmatrix();
	    $el2 = $species; 
	    $specfile2 = sprintf("%2s_%s_default",$ZA2,$el2);  # 67_Ho_default

	    $name_of_dir = sprintf("%2s_%2s_%s%s_%s",$ZA1,$ZA2,$el1,$el2,$scale); 
            print "$name_of_dir "; 
	    system "mkdir $name_of_dir";
	    system "cp s.lda $name_of_dir/ ";
	    system "cp control.header $name_of_dir/control.in ";
	    system "cat $dir_species/$specfile1 >> $name_of_dir/control.in ";
	    if($el1 ne $el2) {
		system "cat $dir_species/$specfile2 >> $name_of_dir/control.in ";
	    }
            $latt_par = $latt_par_mast*$coeff[$index]; 
	    if($latt_name eq "ZB") {create_ZB();}	
	    elsif($latt_name eq "RS") {create_RS();}
	    elsif($latt_name eq "WZ") {create_WZ();}
	    else {
		print "Crystal symmetry not (yet) treated\nSkipping to next material\n";
		last LS;
	    }
            $index++;
        } 
             
    }
    else {
	    $nucharge = $ZA1;
	    calc_cmatrix();
	    $el1 = $species; 
	    $specfile1 = sprintf("%2s_%s_default",$ZA1,$el1);  # 67_Ho_default

	    $nucharge = $ZA2;
	    calc_cmatrix();
	    $el2 = $species; 
	    $specfile2 = sprintf("%2s_%s_default",$ZA2,$el2);  # 67_Ho_default

	    $name_of_dir = sprintf("%2s_%2s_%s%s",$ZA1,$ZA2,$el1,$el2); 
            print "$name_of_dir "; 
	    system "mkdir $name_of_dir";
	    system "cp s.lda $name_of_dir/ ";
	    system "cp control.header $name_of_dir/control.in ";
	    system "cat $dir_species/$specfile1 >> $name_of_dir/control.in ";
	    if($el1 ne $el2) {
		system "cat $dir_species/$specfile2 >> $name_of_dir/control.in ";
	    }
	    if($latt_name eq "ZB") {create_ZB();}	
	    elsif($latt_name eq "RS") {create_RS();}
	    elsif($latt_name eq "WZ") {create_WZ();}
            elsif($latt_name eq "D") {create_dimer();}
	    else {
		print "Crystal symmetry not (yet) treated\nSkipping to next material\n";
		last LS;
	    } 	
    }
}
close(LISTA);
print "; do\n"; 

sub create_ZB {
   open(GEO,">$name_of_dir/geometry.in");
   $ah = $latt_par/2.;
   $aq = $latt_par/4.;
   printf GEO "lattice_vector 0.0000 %5.4f %5.4f\n",$ah,$ah; 
   printf GEO "lattice_vector %5.4f 0.0000 %5.4f\n",$ah,$ah; 
   printf GEO "lattice_vector %5.4f %5.4f 0.0000\n\n",$ah,$ah; 
   printf GEO "atom   0.0000 0.0000 0.0000 %s\n",$el1; 
   printf GEO "atom   %5.4f %5.4f %5.4f %s\n",$aq,$aq,$aq,$el2; 
   close(GEO);
}

sub create_RS {
   open(GEO,">$name_of_dir/geometry.in");
   $ah = $latt_par/2.;
   $aq = $latt_par/4.;
   printf GEO "lattice_vector 0.0000 %5.4f %5.4f\n",$ah,$ah; 
   printf GEO "lattice_vector %5.4f 0.0000 %5.4f\n",$ah,$ah; 
   printf GEO "lattice_vector %5.4f %5.4f 0.0000\n\n",$ah,$ah; 
   printf GEO "atom   0.0000 0.0000 0.0000 %s\n",$el1; 
   printf GEO "atom   %5.4f %5.4f %5.4f %s\n",$ah,$ah,$ah,$el2; 
   close(GEO);
}

sub create_WZ {
   open(GEO,">$name_of_dir/geometry.in");
   $ac  = 2.*sqrt(6.)*$latt_par/3.;
   $ach = 0.5*$ac;
   $au  = 0.375*$ac;
   $ah  = 0.5*$latt_par;
   $a2  = $ah*sqrt(3.);
   $a3  = 0.5*$latt_par/sqrt(3.);
   printf GEO "lattice_vector %5.4f %5.4f 0.0000\n",$ah,-1.*$a2; 
   printf GEO "lattice_vector %5.4f %5.4f 0.0000\n",$ah,$a2; 
   printf GEO "lattice_vector 0.0000 0.0000 %5.4f\n\n",$ac; 
   printf GEO "atom   %5.4f %5.4f 0.0000 %s\n",$ah,$a3,$el1; 
   printf GEO "atom   %5.4f %5.4f %5.4f %s\n",$ah,-1.*$a3,$ach,$el1; 
   printf GEO "atom   %5.4f %5.4f %5.4f %s\n",$ah,$a3,$au,$el2; 
   printf GEO "atom   %5.4f %5.4f %5.4f %s\n",$ah,-1.*$a3,$ach+$au,$el2; 
   close(GEO);
}

sub create_dimer {
   open(GEO,">$name_of_dir/geometry.in");
   printf GEO "atom   0.0000 0.0000 0.0000 %s\n",$el1; 
   printf GEO "atom   0.0000 0.0000 %5.4f %s\n",$latt_par,$el2; 
   close(GEO);
}


sub calc_cmatrix {
   if ($nucharge  == 5   ) { $species  = 'B'  ; $valence  = 3; $expEA  = 26.99; $expIP  = 8.2980;}
   if ($nucharge  == 6   ) { $species  = 'C'  ; $valence  = 4; $expEA  = 121.78; $expIP  = 11.2603;}
   if ($nucharge  == 9   ) { $species  = 'F'  ; $valence  = 7; $expEA  = 328.165; $expIP  = 17.4228;}
   if ($nucharge  == 1   ) { $species  = 'H'  ; $valence  = 1; $expEA  = 72.77; $expIP  = 13.5984;}
   if ($nucharge  == 53  ) { $species  = 'I'  ; $valence  = 7; $expEA  = 295; $expIP  = 10.4513;}
   if ($nucharge  == 19  ) { $species  = 'K'  ; $valence  = 1; $expEA  = 48.38; $expIP  = 4.3407;}
   if ($nucharge  == 7   ) { $species  = 'N'  ; $valence  = 5; $expEA  = 0; $expIP  = 14.5341;}
   if ($nucharge  == 8   ) { $species  = 'O'  ; $valence  = 6; $expEA  = 141; $expIP  = 13.6181;}
   if ($nucharge  == 15  ) { $species  = 'P'  ; $valence  = 5; $expEA  = 72; $expIP  = 10.4867;}
   if ($nucharge  == 16  ) { $species  = 'S'  ; $valence  = 6; $expEA  = 200.41; $expIP  = 10.3600;}
   if ($nucharge  == 92  ) { $species  = 'U'  ; $valence  = 6; $expEA  = 0; $expIP  = 6.1939;}
   if ($nucharge  == 23  ) { $species  = 'V'  ; $valence  = 5; $expEA  = 51; $expIP  = 6.7462;}
   if ($nucharge  == 74  ) { $species  = 'W'  ; $valence  = 6; $expEA  = 79; $expIP  = 7.8640;}
   if ($nucharge  == 39  ) { $species  = 'Y'  ; $valence  = 3; $expEA  = 30; $expIP  = 6.2173;}
   # ... any errors made so far are fixed by matching two- or three letter elements later
   if ($nucharge  == 2   ) {$species  = 'He'  ; $valence  = 2; $expEA  = 0; $expIP  = 24.5874;} 
   if ($nucharge  == 3   ) {$species  = 'Li'  ; $valence  = 1; $expEA  = 59.6; $expIP  = 5.3917;}
   if ($nucharge  == 4   ) {$species  = 'Be'  ; $valence  = 2; $expEA  = 0; $expIP  = 9.3227;}
   if ($nucharge  == 10  ) {$species  = 'Ne'  ; $valence  = 8; $expEA  = 0; $expIP  = 21.5645;}
   if ($nucharge  == 11  ) {$species  = 'Na'  ; $valence  = 1; $expEA  = 52.8; $expIP  = 5.1391;}
   if ($nucharge  == 12  ) {$species  = 'Mg'  ; $valence  = 2; $expEA  = 0; $expIP  = 7.6462;}
   if ($nucharge  == 13  ) {$species  = 'Al'  ; $valence  = 3; $expEA  = 41.9; $expIP  = 5.9858;}
   if ($nucharge  == 14  ) {$species  = 'Si'  ; $valence  = 4; $expEA  = 133.1; $expIP  = 8.1517;}
   if ($nucharge  == 17  ) {$species  = 'Cl'  ; $valence  = 7; $expEA  = 349; $expIP  = 12.9676;}
   if ($nucharge  == 18  ) {$species  = 'Ar'  ; $valence  = 8; $expEA  = 0; $expIP  = 15.7596;}
   if ($nucharge  == 20  ) {$species  = 'Ca'  ; $valence  = 2; $expEA  = 2.37; $expIP  = 6.1132;}
   if ($nucharge  == 21  ) {$species  = 'Sc'  ; $valence  = 3; $expEA  = 18.1; $expIP  = 6.5615;}
   if ($nucharge  == 22  ) {$species  = 'Ti'  ; $valence  = 4; $expEA  = 8.5; $expIP  = 6.8281;}
   if ($nucharge  == 24  ) {$species  = 'Cr'  ; $valence  = 6; $expEA  = 64.3; $expIP  = 6.7665;}
   if ($nucharge  == 25  ) {$species  = 'Mn'  ; $valence  = 7; $expEA  = 0; $expIP  = 7.4340;}
   if ($nucharge  == 26  ) {$species  = 'Fe'  ; $valence  = 3; $expEA  = 14.6; $expIP  = 7.9024;}
   if ($nucharge  == 27  ) {$species  = 'Co'  ; $valence  = 3; $expEA  = 64; $expIP  = 7.8810;}
   if ($nucharge  == 28  ) {$species  = 'Ni'  ; $valence  = 3; $expEA  = 111.6; $expIP  = 7.6399;}
   if ($nucharge  == 29  ) {$species  = 'Cu'  ; $valence  = 2; $expEA  = 119.24; $expIP  = 7.7264;}
   if ($nucharge  == 30  ) {$species  = 'Zn'  ; $valence  = 2; $expEA  = 0; $expIP  = 9.3942;}
   if ($nucharge  == 31  ) {$species  = 'Ga'  ; $valence  = 3; $expEA  = 41.3; $expIP  = 5.9993;}
   if ($nucharge  == 32  ) {$species  = 'Ge'  ; $valence  = 4; $expEA  = 118.94; $expIP  = 7.8994;}
   if ($nucharge  == 33  ) {$species  = 'As'  ; $valence  = 5; $expEA  = 78.57; $expIP  = 9.7886;}
   if ($nucharge  == 34  ) {$species  = 'Se'  ; $valence  = 6; $expEA  = 194.97; $expIP  = 9.7524;}
   if ($nucharge  == 35  ) {$species  = 'Br'  ; $valence  = 7; $expEA  = 342.54; $expIP  = 11.8138;}
   if ($nucharge  == 36  ) {$species  = 'Kr'  ; $valence  = 8; $expEA  = 0; $expIP  = 13.9996;}
   if ($nucharge  == 37  ) {$species  = 'Rb'  ; $valence  = 1; $expEA  = 46.89; $expIP  = 4.1771;}
   if ($nucharge  == 38  ) {$species  = 'Sr'  ; $valence  = 2; $expEA  = 5.02; $expIP  = 5.6949;}
   if ($nucharge  == 40  ) {$species  = 'Zr'  ; $valence  = 4; $expEA  = 41; $expIP  = 6.6339;}
   if ($nucharge  == 41  ) {$species  = 'Nb'  ; $valence  = 5; $expEA  = 86.2; $expIP  = 6.7589;}
   if ($nucharge  == 42  ) {$species  = 'Mo'  ; $valence  = 6; $expEA  = 72.3; $expIP  = 7.0924;}
   if ($nucharge  == 43  ) {$species  = 'Tc'  ; $valence  = 7; $expEA  = 0; $expIP  = 7.28;}
   if ($nucharge  == 44  ) {$species  = 'Ru'  ; $valence  = 3; $expEA  = 101.0; $expIP  = 7.3605;}
   if ($nucharge  == 45  ) {$species  = 'Rh'  ; $valence  = 3; $expEA  = 110.3; $expIP  = 7.4589;}
   if ($nucharge  == 46  ) {$species  = 'Pd'  ; $valence  = 3; $expEA  = 54.24; $expIP  = 8.3369;}
   if ($nucharge  == 47  ) {$species  = 'Ag'  ; $valence  = 2; $expEA  = 125.86; $expIP  = 7.5762;}
   if ($nucharge  == 48  ) {$species  = 'Cd'  ; $valence  = 2; $expEA  = 0; $expIP  = 8.9938;}
   if ($nucharge  == 49  ) {$species  = 'In'  ; $valence  = 3; $expEA  = 39; $expIP  = 5.7864;}
   if ($nucharge  == 50  ) {$species  = 'Sn'  ; $valence  = 4; $expEA  = 107.3; $expIP  = 7.3439;}
   if ($nucharge  == 51  ) {$species  = 'Sb'  ; $valence  = 5; $expEA  = 101.1; $expIP  = 8.6084;}
   if ($nucharge  == 52  ) {$species  = 'Te'  ; $valence  = 6; $expEA  = 190.2; $expIP  = 9.0096;}
   if ($nucharge  == 54  ) {$species  = 'Xe'  ; $valence  = 8; $expEA  = 0; $expIP  = 12.1298;}
   if ($nucharge  == 55  ) {$species  = 'Cs'  ; $valence  = 1; $expEA  = 45.5; $expIP  = 3.8939;}
   if ($nucharge  == 56  ) {$species  = 'Ba'  ; $valence  = 2; $expEA  = 13.95; $expIP  = 5.2117;}
   if ($nucharge  == 57  ) {$species  = 'La'  ; $valence  = 3; $expEA  = 45.2; $expIP  = 5.5769;}
   if ($nucharge  == 58  ) {$species  = 'Ce'  ; $valence  = 3; $expEA  = 92.2; $expIP  = 5.5387;}
   if ($nucharge  == 59  ) {$species  = 'Pr'  ; $valence  = 3; $expEA  = 50; $expIP  = 5.473;}
   if ($nucharge  == 60  ) {$species  = 'Nd'  ; $valence  = 3; $expEA  = 50; $expIP  = 5.5250;}
   if ($nucharge  == 61  ) {$species  = 'Pm'  ; $valence  = 3; $expEA  = 50; $expIP  = 5.582;}
   if ($nucharge  == 62  ) {$species  = 'Sm'  ; $valence  = 3; $expEA  = 50; $expIP  = 5.6437;}
   if ($nucharge  == 63  ) {$species  = 'Eu'  ; $valence  = 3; $expEA  = 50; $expIP  = 5.6704;}
   if ($nucharge  == 64  ) {$species  = 'Gd'  ; $valence  = 3; $expEA  = 50; $expIP  = 6.1498;}
   if ($nucharge  == 65  ) {$species  = 'Tb'  ; $valence  = 3; $expEA  = 50; $expIP  = 5.8638;}
   if ($nucharge  == 66  ) {$species  = 'Dy'  ; $valence  = 3; $expEA  = 50; $expIP  = 5.9389;}
   if ($nucharge  == 67  ) {$species  = 'Ho'  ; $valence  = 3; $expEA  = 50; $expIP  = 6.0215;}
   if ($nucharge  == 68  ) {$species  = 'Er'  ; $valence  = 3; $expEA  = 50; $expIP  = 6.1077;}
   if ($nucharge  == 69  ) {$species  = 'Tm'  ; $valence  = 3; $expEA  = 99.2; $expIP  = 6.1843;}
   if ($nucharge  == 70  ) {$species  = 'Yb'  ; $valence  = 3; $expEA  = 50; $expIP  = 6.2542;}
   if ($nucharge  == 71  ) {$species  = 'Lu'  ; $valence  = 3; $expEA  = 33; $expIP  = 5.4259;}
   if ($nucharge  == 72  ) {$species  = 'Hf'  ; $valence  = 4; $expEA  = "?" ; $expIP  = 6.8251;}
   if ($nucharge  == 73  ) {$species  = 'Ta'  ; $valence  = 5; $expEA  = 31; $expIP  = 7.5496;}
   if ($nucharge  == 75  ) {$species  = 'Re'  ; $valence  = 7; $expEA  = 0; $expIP  = 7.8335;}
   if ($nucharge  == 76  ) {$species  = 'Os'  ; $valence  = 3; $expEA  = 104; $expIP  = 8.4382;}
   if ($nucharge  == 77  ) {$species  = 'Ir'  ; $valence  = 3; $expEA  = 150.9; $expIP  = 8.9670;}
   if ($nucharge  == 78  ) {$species  = 'Pt'  ; $valence  = 3; $expEA  = 205.04; $expIP  = 8.9588;}
   if ($nucharge  == 79  ) {$species  = 'Au'  ; $valence  = 2; $expEA  = 222.75; $expIP  = 9.2255;}
   if ($nucharge  == 80  ) {$species  = 'Hg'  ; $valence  = 2; $expEA  = 0; $expIP  = 10.4375;}
   if ($nucharge  == 81  ) {$species  = 'Tl'  ; $valence  = 3; $expEA  = 36; $expIP  = 6.1082;}
   if ($nucharge  == 82  ) {$species  = 'Pb'  ; $valence  = 4; $expEA  = 35; $expIP  = 7.4167;}
   if ($nucharge  == 83  ) {$species  = 'Bi'  ; $valence  = 5; $expEA  = 90.02; $expIP  = 7.2855;}
   if ($nucharge  == 84  ) {$species  = 'Po'  ; $valence  = 6; $expEA  = "?" ; $expIP  = 8.414;}
   if ($nucharge  == 85  ) {$species  = 'At'  ; $valence  = 7; $expEA  = "?" ; $expIP  = "?";}
   if ($nucharge  == 86  ) {$species  = 'Rn'  ; $valence  = 8; $expEA  = 0; $expIP  = 10.7485;}
   if ($nucharge  == 87  ) {$species  = 'Fr'  ; $valence  = 1; $expEA  = "?" ; $expIP  = 4.0727;}
   if ($nucharge  == 88  ) {$species  = 'Ra'  ; $valence  = 2; $expEA  = "?" ; $expIP  = 5.2784;}
   if ($nucharge  == 89  ) {$species  = 'Ac'  ; $valence  = 2; $expEA  = "?" ; $expIP  = 5.3807;}
   if ($nucharge  == 90  ) {$species  = 'Th'  ; $valence  = 4; $expEA  = "?" ; $expIP  = 6.3067;}
   if ($nucharge  == 91  ) {$species  = 'Pa'  ; $valence  = 2; $expEA  = "?" ; $expIP  = 5.89;}
   if ($nucharge  == 93  ) {$species  = 'Np'  ; $valence  = 6; $expEA  = "?" ; $expIP  = 6.2657;}
   if ($nucharge  == 94  ) {$species  = 'Pu'  ; $valence  = 2; $expEA  = "?" ; $expIP  = 6.0260;}
   if ($nucharge  == 95  ) {$species  = 'Am'  ; $valence  = 6; $expEA  = "?" ; $expIP  = 5.9738;}
   if ($nucharge  == 96  ) {$species  = 'Cm'  ; $valence  = 4; $expEA  = "?" ; $expIP  = 5.9914;}
   if ($nucharge  == 97  ) {$species  = 'Bk'  ; $valence  = 4; $expEA  = "?" ; $expIP  = 6.1979;}
   if ($nucharge  == 98  ) {$species  = 'Cf'  ; $valence  = 2; $expEA  = "?" ; $expIP  = 6.2817;}
   if ($nucharge  == 99  ) {$species  = 'Es'  ; $valence  = 2; $expEA  = "?" ; $expIP  = 6.3676;}
   if ($nucharge  == 100 ) {$species  = 'Fm'  ; $valence  = 2; $expEA  = "?" ; $expIP  = 6.50;}
   if ($nucharge  == 101 ) {$species  = 'Md'  ; $valence  = 3; $expEA  = "?" ; $expIP  = 6.58;}
   if ($nucharge  == 102 ) {$species  = 'No'  ; $valence  = 2; $expEA  = "?" ; $expIP  = 6.65;}
   if ($nucharge  == 103 ) {$species  = 'Lr'  ; $valence  = 3; $expEA  = "?" ; $expIP  = "?";}
   if ($nucharge  == 104 ) {$species  = 'Rf'  ; $valence  = 4; $expEA  = "?" ; $expIP  = "?";}
   if ($nucharge  == 105 ) {$species  = 'Db'  ; $valence  = 5; $expEA  = "?" ; $expIP  = "?";}
   if ($nucharge  == 106 ) {$species  = 'Sg'  ; $valence  = 6; $expEA  = "?" ; $expIP  = "?";}
   if ($nucharge  == 107 ) {$species  = 'Bh'  ; $valence  = 7; $expEA  = "?" ; $expIP  = "?";}
   if ($nucharge  == 108 ) {$species  = 'Hs'  ; $valence  = 3; $expEA  = "?" ; $expIP  = "?";}
   if ($nucharge  == 109 ) {$species  = 'Mt'  ; $valence  = 3; $expEA  = "?" ; $expIP  = "?";}
   if ($nucharge  == 110 ) {$species  = 'Ds'  ; $valence  = 3; $expEA  = "?" ; $expIP  = "?";}
   if ($nucharge  == 111 ) {$species  = 'Rg'  ; $valence  = 2; $expEA  = "?" ; $expIP  = "?";}
}

