# This script takes a tab separated list of insert sizes and absolute read counts
# and generates a shell script to submit the fitting ART jobs to the sge. 
#
# "f" is the coverage factor, as we want to have the fungal and algal genome in the
# merged data set. 
#
# Thus, the coverage will be calculated as follows, with f as the coverage factor: 
# 14,013,249 * 500 = 38,381,222 * 8f + 55,755,874*2f
# [# pairs] * 500 = (38,381,222*8 + 55,755,874)*2f
# f = ([# pairs]*500)/(38,381,222*8+ 55,755,874)
 
# Cladonia coverage calculation: 
# 38,381,222*8*f 
 
# This is for the 8:2 data set. For all other datasets you can change the "8" and "2"
# to whatever ratio you see fit.
{
f = ($2 * 500) / (38381222*8 + 55755874*2);
coverage = 2*f;
 
 
printf "echo \"art_illumina -i Astpho_pseudogenome.fasta -p -l 250 -f ";
printf "%.6f", coverage;
print " -m", $1, "-s 0 -o", $1, "-1 EmpMiSeq250R1.txt -2 EmpMiSeq250R2.txt\" | qsub -V -S /bin/bash -cwd -j y -N astpho" $1, "-r y -q all.q ";
 
}
