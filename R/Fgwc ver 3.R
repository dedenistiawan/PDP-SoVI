# Load Data Sovi
load("D:/My Drive/deden-RMarkdown & Github/PDP-SoVI/Data/sovi_data_Kab_514.RData")

# Load Data Matrix Distance
load("D:/My Drive/deden-RMarkdown & Github/PDP-SoVI/Data/sovi_dist_514.Rdata")

#Load Data Populasi
#merubah df to vector
#sovi_data_pop_514 <- read_excel("Data/sovi_data_pop_514.xlsx")
#v1<-sovi_data_pop_514$A 
load("D:/My Drive/deden-RMarkdown & Github/PDP-SoVI/Data/Sovi_pop_514.rdata")

#Mengubah data frame Sovi distance menjadi matrik distance
mat_dist= data.matrix(Distance_matrix_514)

# Library yag dibutuhkan
library(naspaclust)
library(rdist)

# Pentuan Parameter fgwc
param_fgwc <- c(kind='u',ncluster=4,m=1.5,distance='minkowski',order=2,
                alpha=0.7,a=1,b=1,max.iter=1000,error=1e-5,randomN=10)

# FGWC Standart
Res_fgwc <- fgwc(data=sovi_data_kab_full_R, pop=v1, distmat=mat_dist, algorithm = "classic", param_fgwc,1)

# Menggabungkan hasil cluster algoritma FGWC dengan data
library(xlsx)
cluster.output <- cbind(data_kab_geoda_514 ,Res_fgwc$cluster)
write.xlsx(cluster.output, file = "Final Cluster514.xlsx", row.names = TRUE)
