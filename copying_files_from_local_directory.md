#Copying files from local directory to HPC account directory
#Open terminal in local computer 
A. copying using rsync
```sh

rsync -av /Users/USER1/Documents/COPY_FOLDER/* USER_NAME@gator.hpc.ufl.edu:/home/USER_NAME/FOLDER_NAME/PASTE_FOLDER/


```
rsync command is a 'fast and extraordinarily versatile file copying tool', which can make copies across the network. 


B. viewing progress while copying 

```sh
$ rsync -av --progress /COPY_FOLDER/* /PASTE_FOLDER/
```



