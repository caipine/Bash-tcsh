 sed 1d units.tsv | awk '{print $2}' > unit.list
 sed 1d units.tsv | awk '{print $1}' > sample.list
 paste -d _ sample.list  unit.list  > sample_unit.list
 awk '{print $1}' /scratch/03988/qscai/GATK/dna-seq-gatk-variant-calling-master/vcf/ucsc.hg19.fasta.fai > genome.fai.list 
  
 rm all.sh
 mkdir called
foreach sample_unit ( "`cat sample_unit.list`" )

foreach contig ( "`cat genome.fai.list`" )

cat <<EOF >>all.sh
   gatk HaplotypeCaller    -R /scratch/03988/qscai/GATK/dna-seq-gatk-variant-calling-master/vcf/ucsc.hg19.fasta  -I recal/${sample_unit}.bam  -ERC GVCF  -O called/${sample_unit}.${contig}.g.vcf.gz 
--dbsnp /scratch/03988/qscai/GATK/dna-seq-gatk-variant-calling-master/vcf/dbsnp_138.hg19.vcf 

EOF

end
end
