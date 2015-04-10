# merge reads with unique names
rm astpho-forward-reads.fq;
rm astpho-reverse-reads.fq;
for i in ???1.fq;
do 
naming=$(echo "$i"|sed "s/1\.fq//")
reverse=$(echo "$i"|sed "s/1\.fq/2\.fq/")
echo $naming
echo $reverse
sed "s/^@Astpho/@Astpho-$naming/" $i >> astpho-forward-reads.fq
sed "s/^@Astpho/@Astpho-$naming/" $reverse >> astpho-reverse-reads.fq
done

