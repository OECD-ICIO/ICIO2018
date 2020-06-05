#setwd("c:/temp/") #set working directory

load("ICIO2018VB.Rdata")
load("ICIO2018FD.Rdata")

# domestic VA in Foreign final demand 

cou1<-"AUT"
cou2<-"DEU"
year<-"2015"

dimecon<-matrix(c(1:(69*36)),nr=36)
colnames(dimecon)<-c(dimnames(ICIO2018econFD)[[3]])

# AUT VA by industry embodied in DEU FD for 2015
ICIO2018econVB[year,dimecon[,cou1],] %*% ICIO2018econFD[year,,cou2]

# AUT VA embodied in foreign FD for 2015 (tiva exports)
sum(ICIO2018econVB[year,dimecon[,cou1],] %*% 
  (rowSums(ICIO2018econFD[year,,])-ICIO2018econFD[year,,cou1]))

# Foreign VA embodied in AUT FD for 2015 (tiva imports)
temp<-ICIO2018econVB[year,,]
temp[dimecon[,cou1],]<-0
sum(temp %*% ICIO2018econFD[year,,cou1])

  

