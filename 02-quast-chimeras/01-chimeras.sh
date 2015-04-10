# for each assembly generate the bowtie2 ref, map reads, remove multimappers
for i in *.fasta;
do 
# do index
bowtie2-build $i $i
# map reads
bowtie2 -x $i -1 ../clad8_ast2-F.fastq -2 ../clad8_ast2-R.fastq -S $i-mapping.sam
# remove multimappers & convert to bam
grep -v XS:i $i-mapping.sam |samtools view -bS - |samtools sort - $i-mapping-sorted
samtools index $i-mapping-sorted.bam
# find out how many chimeras are in each data set
./chimera_calculator.py $i $i-mapping-sorted.bam > $i-chimeras.csv
done
