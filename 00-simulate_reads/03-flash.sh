# take the indivudal reads for both organisms, merge those files and overlap the read-pairs
cat cladonia-forward-reads.fq astpho-forward-reads.fq > clad8_ast2-F.fastq
cat cladonia-reverse-reads.fq astpho-reverse-reads.fq > clad8_ast2-R.fastq
flash -o clad8_ast2 clad8_ast2-F.fastq clad8_ast2-R.fastq
