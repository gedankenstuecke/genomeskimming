# do error correction as recommended in omega paper
./bbnorm.sh in=../clad8_ast2-F.fastq in2=../clad8_ast2-R.fastq out=clad8_ast2-corrected_bbnorm.fastq outt=clad8_ast2-tossed_bbnorm.fastq hist=clad8_ast2-histogram_bbnorm ecc=t -Xmx100
# deinterleave the output of bbnorm as we want to merge overlapping read pairs
./deinterleave.sh < clad8_ast2-corrected_bbnorm.fastq clad8_ast2-corrected-F.fastq clad8_ast2-corrected-R.fastq
# flash those
flash -o clad8_ast2-corrected clad8_ast2-corrected-F.fastq clad8_ast2-corrected-R.fastq
# now we need to interleave the non-overlapping ones again
./shuffleSequences_fastq.pl clad8_ast2-corrected.notCombined_1.fastq clad8_ast2-corrected.notCombined_2.fastq clad8_ast2-corrected.notCombined_interleaved.fastq
# now we can actually do the assembly
omega -pe clad8_ast2-corrected.notCombined_interleaved.fastq -se clad8_ast2-corrected.extendedFrags.fastq -l 150 -f clad8_ast2_omega_output_ol150_bbnorm > omega_clad8_ol150_bbnorm.log
