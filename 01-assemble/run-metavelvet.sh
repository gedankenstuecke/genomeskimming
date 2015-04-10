for i in {51..221..10}
do 
velveth kmer$i $i -fastq -shortPaired -separate ../clad8_ast2-F.fastq ../clad8_ast2-R.fastq >> kmer$i.log
velvetg kmer$i -exp_cov auto >> kmer$i.log
meta-velvetg kmer$i >> kmer$i.log
done
