#= This Script is to read csv files of zonal statistics (ZS)
#=And merge them into one csv file 
Out_ZS=list();
Set_Dir="Outcsv/"
CSV_LIST=list.files(Set_Dir,pattern="*.csv");


Out_ZS[[1]]=read.csv(paste(Set_Dir,CSV_LIST[1],sep=""));  

for (i in 2:length(CSV_LIST)){
  Out_ZS[[i]]=read.csv(paste(Set_Dir,CSV_LIST[i],sep=""));  
  Out_ZS[[1]]=merge(Out_ZS[[1]],Out_ZS[[i]])
}
Out_ZS=Out_ZS[[1]] #Get a single dataframe 
Out_ZS[is.na(Out_ZS)] <- 0 #fill NA wN zero values 

#===Normalizing all the values in terms of maximum value of each column 
for (i in 5:dim(Out_ZS)[2]){
  Out_ZS[,i]=Out_ZS[,i]/max(Out_ZS[,i]);
}


#=======================Histogram: Does not work!
#=Now create histogram for all the variabes 
require(ggplot2)


LIST_PLOT <- list()  # new empty list

N=5
  LIST_PLOT[[N]]=ggplot(Out_ZS, aes(Out_ZS[,N]))+geom_histogram()+ggtitle(colnames(Out_ZS)[N])+xlab("")
N=6
LIST_PLOT[[N]]=ggplot(Out_ZS, aes(Out_ZS[,N]))+geom_histogram()+ggtitle(colnames(Out_ZS)[N])+xlab("")

  
multiplot(plotlist = ind_plots, cols = 11)



dim(Out_ZS)[2]



###Generate Data from: Observation 


tag=c(5440,49232,39133,38295,4468,4473,138502,4153,5125,4850,99992,99993,99994,421585,5159,5384,718325,4839,134166,3818,523500,158488)
phenophase=c(5,1,1,3,6,3,2,1,1,3,1,1,1,4,6,3,3,3,3,5,2,5)
phenophase=data.frame(tag,phenophase)

test_ZS=merge(phenophase,Out_ZS)

library(GGally)



