#!/bin/bash
#SBATCH -J sra            # job name
#SBATCH -o sra.o%j        # output and error file name (%j expands to jobID)
#SBATCH -e sra.e%j.err
#SBATCH -N 1
#SBATCH -n 48
#SBATCH -p normal           # queue (partition) -- normal, development, etc.
#SBATCH -t 48:00:00         # run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=qcai1@mdanderson.org
#SBATCH --mail-type=begin   # email me when the job starts
#SBATCH --mail-type=end     # email me when the job finishes
#SBATCH -A PGK-inhibitors

# cd  /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/SRA/fastqs
#find *sra| parallel -j 6  fastq-dump --split-3 {}
#find *fastq | parallel -j 6  bgzip {}
  cd  /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/
 snakemake --unlock 
 snakemake --snakefile Snakefile_short  --cores 8  --rerun-incomplete
