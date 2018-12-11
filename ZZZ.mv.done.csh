foreach sample_unit ( "`cat sample_unit.list`" )

foreach contig ( "`cat genome.fai.list`" )
# echo /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/called/${sample_unit}.${contig}.g.vcf.gz

if (  -f /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/called/${sample_unit}.${contig}.g.vcf.gz) then
       echo /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/called/${sample_unit}.${contig}.g.vcf.gz
       mv /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/XXX/ZZZ.M.sh/XXX.${sample_unit}.${contig}.sh /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/XXX/ZZZ.M.done
endif       
end
end

