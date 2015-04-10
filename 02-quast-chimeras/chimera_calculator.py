import pysam
from Bio import SeqIO
import sys

contigs = SeqIO.to_dict(SeqIO.parse(open(sys.argv[1],"r"),"fasta"))

samfile = pysam.Samfile(sys.argv[2],"rb")
print "contigname\tcontiglength\ttotal_reads\tfungal_reads\talgal_reads\tpercent_wrong"
for contigname,contigobject in contigs.items():
	length = len(str(contigobject.seq))
	reads_total = 0
	reads_algal = 0
	reads_fungal = 0
	percent_wrong = 0.0
	for read in samfile.fetch(contigname):
		organism = read.qname.split("-")[0]
		if organism == "Clagr":
			reads_fungal += 1
		if organism == "Astpho":
			reads_algal += 1
		reads_total += 1
	if reads_algal > reads_fungal:
		percent_wrong = float(reads_fungal)/reads_total
	if reads_fungal > reads_algal:
		percent_wrong = float(reads_algal)/reads_total
	print contigname + "\t" + str(length) + "\t" + str(reads_total) + "\t" + str(reads_fungal) + "\t" + str(reads_algal) + "\t" + str(percent_wrong)
