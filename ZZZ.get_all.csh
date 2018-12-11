
 sed 1d units.tsv | awk '{print $2}' > unit.list
 sed 1d units.tsv | awk '{print $1}' > sample.list
 paste -d -_ sample.list  unit.list  > sample_unit.list
 awk '{print $1}' /scratch/03988/qscai/GATK/dna-seq-gatk-variant-calling-master/vcf/ucsc.hg19.fasta.fai > genome.fai.list 
  
# rm all.sh
  mkdir called
  mkdir called_tmp
foreach sample_unit ( "`cat sample_unit.list`" )

foreach contig ( "`cat genome.fai.list`" )

       cat <<EOF >> XXX/ZZZ.M.sh/XXX.${sample_unit}.${contig}.sh
if [ ! -f /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/called/${sample_unit}.${contig}.g.vcf.gz ]; then
   echo "File not found!"
   gatk HaplotypeCaller \
        -R /scratch/03988/qscai/GATK/dna-seq-gatk-variant-calling-master/vcf/ucsc.hg19.fasta \
        -I /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/recal/${sample_unit}.bam  \
        -ERC GVCF \
        -O /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/called_tmp/${sample_unit}.${contig}.g.vcf.gz \
        --dbsnp /scratch/03988/qscai/GATK/dna-seq-gatk-variant-calling-master/vcf/dbsnp_138.hg19.vcf 
   
   mv /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/called_tmp/${sample_unit}.${contig}.g.vcf.gz \
      /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/called/${sample_unit}.${contig}.g.vcf.gz

   mv /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/called_tmp/${sample_unit}.${contig}.g.vcf.gz.tbi \
      /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/called/${sample_unit}.${contig}.g.vcf.gz.tbi



fi

EOF

end

end


