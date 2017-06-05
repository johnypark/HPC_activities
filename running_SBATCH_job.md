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
   3844451 hpg2-comp prime_th   USER_NAME PD       0:00      1 (Priority)
```

### D. Receiving Email
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
### E. Showing all details related to submitted job
```bash
scontrol show job <jobID>

```

Example of scontrol outcome 

```bash


UserId=USER_NAME(USER_#) GroupId=GROUP_NAME(GROUP_#)
   Priority=51673 Nice=0 Account=USER_NAME QOS=GROUP_NAME
   JobState=PENDING Reason=Priority Dependency=(null)
   Requeue=0 Restarts=0 BatchFlag=1 Reboot=0 ExitCode=0:0
   RunTime=00:00:00 TimeLimit=00:05:00 TimeMin=N/A
   SubmitTime=YYYY-MM-DD-HH:MM:SS EligibleTime=YYYY-MM-DD-HH:MM:SS
   StartTime=Unknown EndTime=Unknown
   PreemptTime=None SuspendTime=None SecsPreSuspend=0
   Partition=PARTITION_INFO AllocNode:Sid=NAME_CLUSTER:25784
   ReqNodeList=(null) ExcNodeList=(null)
   NodeList=(null)
   NumNodes=1 NumCPUs=4 CPUs/Task=4 ReqB:S:C:T=0:0:*:*
   TRES=cpu=4,mem=8192,node=1
   Socks/Node=* NtasksPerN:B:S:C=0:0:*:* CoreSpec=*
   MinCPUsNode=4 MinMemoryCPU=2G MinTmpDiskNode=0
   Features=(null) Gres=(null) Reservation=(null)
   Shared=OK Contiguous=0 Licenses=(null) Network=(null)
   Command=DIRECTORY/COMMAND_1.sh
   WorkDir=DIRECTORY_WORK
   StdErr=DIRECTORY_WORK/ERROR_FILE.out
   StdIn=/dev/null
   StdOut=DIRECTORY_WORK/OUT_FILE.out
   Power= SICP=0
```
### F. Canceling a job 

```bash 
scancel <jobID>

```



### E. More info 

http://lunarc-documentation.readthedocs.io/en/latest/batch_system/

### F. Question

How many nodes can one job use?
How many cores per node can be requested?
How much memory per cores can be requested?

