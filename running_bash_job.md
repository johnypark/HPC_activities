#Submitting jobs to bash 

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
