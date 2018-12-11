cd /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/XXX/ZZZ.M.sh

ls XXX.* > ZZZ.sh.list

mkdir rest.ZZZ.M.sh
setenv i 0
setenv w 3
setenv p 3
rm rest.sbatch.list* 

foreach line ( "`cat ZZZ.sh.list`" )
   if ($i <= $p) then  
     echo $i
     echo $line >> rest.sbatch.list.$p.sh 
     @ i = $i + 1
      if ($i == $p) then
        @ p = $p + 3
      endif   
   endif
end



ls rest.sbatch.list* > rest.M.list
foreach line ( "`cat rest.M.list`" )

cat <<EOF >rest.sbatch.$line
#!/bin/bash
#SBATCH -J $line            # job name
#SBATCH -o $line.o%j        # output and error file name (%j expands to jobID)
#SBATCH -e $line.e%j.err
#SBATCH -N 1
#SBATCH -n 48
#SBATCH -p normal           # queue (partition) -- normal, development, etc.
#SBATCH -t 48:00:00         # run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=qcai1@mdanderson.org
#SBATCH --mail-type=begin   # email me when the job starts
#SBATCH --mail-type=end     # email me when the job finishes
#SBATCH -A PGK-inhibitors

cd /scratch/03988/qscai/DNAs/dna-seq-gatk-variant-calling/XXX/ZZZ.M.sh
bash
cat $line | parallel -j 3 sh {}

EOF

sbatch rest.sbatch.$line
end

