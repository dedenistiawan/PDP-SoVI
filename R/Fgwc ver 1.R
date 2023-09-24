#tes tes tes tes
# Load Data Sovi 
load("D:/My Drive/deden-RMarkdown & Github/PDP-SoVI/Data/sovi_data.RData")

#perubahan pada git
# Load Data Matrix Distance
load("D:/My Drive/deden-RMarkdown & Github/PDP-SoVI/Data/sovi_dist.Rdata")

#Load Data Populasi
load("D:/My Drive/deden-RMarkdown & Github/PDP-SoVI/Data/sovi_pop.rdata")

#Mengubah data frame Sovi distance menjadi matrik distance
mat_dist= data.matrix(sovi_distance)

# Library yag dibutuhkan
library(naspaclust)
library(rdist)

# Pentuan Parameter fgwc
param_fgwc <- c(kind='u',ncluster=4,m=1.5,distance='minkowski',order=2,
                alpha=0.7,a=1,b=1,max.iter=1000,error=1e-5,randomN=10)

# FGWC Standart
Res_fgwc <- fgwc(data=sovi_data, pop=Sovi_Pop, distmat=mat_dist, algorithm = "classic", param_fgwc,1)

# Menggabungkan hasil cluster algoritma FGWC dengan data
library(xlsx)
cluster.output <- cbind(data_kab ,Res_fgwc$cluster)
write.xlsx(cluster.output, file = "Final Cluster.xlsx", row.names = TRUE)
