# Programmed by Pranita, Sri, Emily, Ziyuan, and Igor
options(scipen = 999)

library(readr);library(tidyverse);library(shiny);library(ggplot2);library(shinydashboard);library(magick);library(mgcv);library(reshape2);library(plyr);library(dplyr);library(shinyjs)

load('./data/DataAll.RData')
result_out <- read_csv("./data/Gam_Grid_outlier_removal.csv")
result_out$X1 <- NULL
# 
indx_min <- which.min(result_out$V1)

allData2 <- suppressMessages(plyr::rename(allData2,c("Oxygen (mg/l)" = "Oxygen",
                                    "Potassium (mg/l)" = "Potassium",
                                    "Ammonia (mg/l)" = "Ammonia",
                                    "Nitrate-N (mg/l)" = "Nitrate",
                                    "Nitrite (mg/l)" = "Nitrite",
                                    "Flow (cfs)" = "Flow")))


gam_data <- (allData2[!is.na(allData2$Hills_N1),])

dd <- gam_data[c(326:330,grep("Oxygen", colnames(gam_data)),
                 grep("Flow", colnames(gam_data)),
                 grep("Hills_N1", colnames(gam_data)),
                 grep("Hills_N2", colnames(gam_data)),
                 grep("margalef", colnames(gam_data)),
                 grep("pielou", colnames(gam_data)))]

dname <- names(gam_data)[c(grep("WaterTemp", colnames(gam_data)),
                           grep("SpCond", colnames(gam_data)),grep("Turbidity", colnames(gam_data))[2],
                           grep("O2Dis", colnames(gam_data)), grep("pH", colnames(gam_data))[2],
                           grep("Oxygen", colnames(gam_data)),
                           grep("Potassium", colnames(gam_data)),grep("Ammonia", colnames(gam_data)),
                           grep("Nitrate", colnames(gam_data))[1],grep("Nitrite", colnames(gam_data))[2],
                           grep("Flow", colnames(gam_data)))]

gam_dat1 <- gam_data
n <-  dim(gam_dat1)[1]

for (i in 1:11) {
  by.name <- paste("m",dname[i],sep="")
  gam_dat1[[by.name]] <- is.na(gam_dat1[[dname[i]]])
  gam_dat1[[dname[i]]][gam_dat1[[by.name]]] <- mean(gam_dat1[[dname[i]]],na.rm=TRUE)
  lev <- rep(1,n);lev[gam_dat1[[by.name]]] <- 1:sum(gam_dat1[[by.name]])
  id.name <- paste("id",dname[i],sep="")
  gam_dat1[[id.name]] <- factor(lev)
  gam_dat1[[by.name]] <- as.numeric(gam_dat1[[by.name]])
}

##Outlier removal
gam_dat2 <- gam_dat1[-c(30,37),]

y <- seq(3, 8, length.out = 6)
d <- expand.grid(x1 = y, x2 = y,x3 = y,x4 = y,x5 = y,x6 = y,x7 = y)
# 
############################ M A C R O ###################################################
allData3 <- suppressMessages(plyr::rename(allData3,c("Oxygen (mg/l)" = "Oxygen",
                                    "Potassium (mg/l)" = "Potassium",
                                    "Ammonia (mg/l)" = "Ammonia",
                                    "Nitrate-N (mg/l)" = "Nitrate",
                                    "Nitrite (mg/l)" = "Nitrite",
                                    "Alkalinity (mg/l)" = "Alkalinity",
                                    "Flow (cfs)" = "Flow")))

gam_data_macro <- allData3[!is.na(allData3$Hills_N1_macro),]

dd <- gam_data_macro[c(331:335,grep("Oxygen", colnames(gam_data_macro)),
                       grep("Flow", colnames(gam_data_macro)),
                       grep("Alkalinity", colnames(gam_data_macro))[1],
                       grep("Hills_N1_macro", colnames(gam_data_macro)),
                       grep("Hills_N2_macro", colnames(gam_data_macro)),
                       grep("margalef_macro", colnames(gam_data_macro)),
                       grep("pielou_macro", colnames(gam_data_macro)))]

dname <- names(gam_data_macro)[c(grep("WaterTemp", colnames(gam_data_macro)),
                                 grep("SpCond", colnames(gam_data_macro)),grep("Turbidity", colnames(gam_data_macro))[2],
                                 grep("O2Dis", colnames(gam_data_macro)), grep("pH", colnames(gam_data_macro))[2],
                                 grep("Oxygen", colnames(gam_data_macro)),
                                 grep("Potassium", colnames(gam_data_macro)),grep("Ammonia", colnames(gam_data_macro)),
                                 grep("Nitrate", colnames(gam_data_macro))[1],grep("Nitrite", colnames(gam_data_macro))[2],
                                 grep("Alkalinity", colnames(gam_data_macro))[1],grep("Flow", colnames(gam_data_macro)))]

gam_dat_macro1 <- gam_data_macro

n <-  dim(gam_dat_macro1)[1]

for (i in 1:12) {
  by.name <- paste("m",dname[i],sep="")
  gam_dat_macro1[[by.name]] <- is.na(gam_dat_macro1[[dname[i]]])
  gam_dat_macro1[[dname[i]]][gam_dat_macro1[[by.name]]] <- mean(gam_dat_macro1[[dname[i]]],na.rm=TRUE)
  lev <- rep(1,n);lev[gam_dat_macro1[[by.name]]] <- 1:sum(gam_dat_macro1[[by.name]])
  id.name <- paste("id",dname[i],sep="")
  gam_dat_macro1[[id.name]] <- factor(lev)
  gam_dat_macro1[[by.name]] <- as.numeric(gam_dat_macro1[[by.name]])
}

###Outlier removal

gam_dat_macro2 <- gam_dat_macro1[-c(53),]

y <- seq(3, 8, length.out = 6)
d <- expand.grid(x1 = y, x2 = y,x3 = y,x4 = y,x5 = y,x6 = y,x7 = y, x8 = y)

trial1 <- merge(gam_dat_macro1,allDatat,by = c("DateTime", "StationID"),all = TRUE)
trial2 <- trial1[-c(53),]

metrics_value = c("HillsN1","HillsN2","Margalef")
metrics_name = c("Hill's N1","Hill's N2","Margalef")