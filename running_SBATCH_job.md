## Submitting jobs on Linux bash system 

### A. Example of a code
```sh
#!/bin/bash
#SBATCH --job-name=prime_threaded   #Job name   
#SBATCH --mail-type=ALL   # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=USER_NAME@university.edu   # Where to send mail       
#SBATCH --cpus-per-task=4   # Number of cores for multi-threaded ojbs
#SBATCH --mem-per-cpu=2gb   # Per processor memory
#SBATCH -t 00:05:00   # Walltime
#SBATCH -o prime_threaded.%j.out   # Name output file 

#Record the time and compute node the job ran on
date; hostname; pwd


module load python
python GetZonalStats.py
                         
```

Number of cores that are used in this job: 4 
Memory allocated per cpu: 2G
Maximum memory requested: 8G 

### B. Submitting a job to the cluster 

```bash 
$sbatch Runcode.sh 
   Submitted batch job 3844451
```

### C. Checking the submitted job 
```bash
$squeue -u $USER_NAME
   JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
   3844451 hpg2-comp prime_th   g2njoy PD       0:00      1 (Priority)
```

### D. Email that was received 
```bash
Job ID: 3844451
Cluster: hipergator
User/Group: USER_NAME/GROUP_NAME
State: COMPLETED (exit code 0)
Nodes: 1
Cores per node: 4
CPU Utilization: 00:00:29
CPU Efficiency: 24.17% of 00:02:00 core-walltime
Memory Utilization 1.31 MB
Memory Efficiency: 0.02% of 8.00 GB

```
### E. More info 

http://lunarc-documentation.readthedocs.io/en/latest/batch_system/

### F. Question

How many nodes can one job use?
How many cores per node can be requested?
How much memory per cores can be requested?

