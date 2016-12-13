#Submitting jobs to bash 

1.Example of a code
```sh
#!/bin/bash
#SBATCH --job-name=prime_threaded   #Job name   
#SBATCH --mail-type=ALL   # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=g2njoy@ufl.edu   # Where to send mail       
#SBATCH --cpus-per-task=4   # Number of cores for multi-threaded ojbs
#SBATCH --mem-per-cpu=2gb   # Per processor memory
#SBATCH -t 00:05:00   # Walltime
#SBATCH -o prime_threaded.%j.out   # Name output file 

#Record the time and compute node the job ran on
date; hostname; pwd


module load python
python GetZonalStats.py
~                           
```


```bash 
$sbatch Runcode.sh 
   Submitted batch job 3844451
```

..And job under running could be checked using 
```bash
$squeue -u g2njoy
   JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
   3844451 hpg2-comp prime_th   g2njoy PD       0:00      1 (Priority)
```
