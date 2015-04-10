# merge reads with unique names
rm cladonia-forward-reads.fq;
rm cladonia-reverse-reads.fq;
for i in ???1.fq;
do 
naming=$(echo "$i"|sed "s/1\.fq//")
reverse=$(echo "$i"|sed "s/1\.fq/2\.fq/")
echo $naming
echo $reverse
sed "s/^@Clagr/@Clagr-$naming/" $i >> cladonia-forward-reads.fq
sed "s/^@Clagr/@Clagr-$naming/" $reverse >> cladonia-reverse-reads.fq
done

