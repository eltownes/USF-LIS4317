
# prep environment
library(readr)
library(dplyr)
library(stringr)
library(ggplot2)
library(patchwork)

# get and clean data
# read in 3 files and patch
# column headers do not match data columns: 7 vs 8
data1 <- read_csv("datatraining.txt", col_names=F, skip=1)
data2 <- read_csv("datatest.txt", col_names=F, skip=1)
data3 <- read_csv("datatest2.txt", col_names=F, skip=1)
dataAll <- bind_rows(data2,data1,data3)
dataAll <- dataAll[,2:length(dataAll)]
colnames(dataAll) <- c("Date","Temperature","Humidity","Light","CO2",
                     "HumidityRatio","Occupancy")
dataAll$Occupancy <- ifelse(dataAll$Occupancy == 0, "No","Yes")
dataAll$Occupancy <- as.factor(dataAll$Occupancy)

# change celcius to fahrenheit
dataAll$Temperature <- (dataAll$Temperature*(9/5))+32

# plot objects
grpText <- plot_annotation(title="Occupancy Detection for an Office Room",
  subtitle="(2015 - by the minute)",
  caption="Source: Luis Candanedo, luismiguel.candanedoibarra 
  '@' umons.ac.be, UMONS.",
  theme=theme(plot.title=element_text(size = 18,hjust=0.5),
              plot.subtitle=element_text(size=14,hjust = 0.5)
    )
  )
var1 <- ggplot(dataAll, aes(x=Date,y=Light,color=Occupancy) ) +
  geom_point(size=0) +
  theme(axis.title.x = element_blank() ) +
  theme(axis.title.y = element_blank() ) +
  labs(title="Light", subtitle="in Lux")
var2<- ggplot(dataAll, aes(x=Date,y=Temperature,color=Occupancy) ) +
  geom_point(size=0) +
  theme(axis.title.x = element_blank() ) +
  theme(axis.title.y = element_blank() ) +
  labs(title="Temperature", subtitle="in Fahrenheits")
var3 <- ggplot(dataAll, aes(x=Date,y=CO2,color=Occupancy) ) +
  geom_point(size=0) +
  theme(axis.title.x = element_blank() ) +
  theme(axis.title.y = element_blank() ) +
  labs(title="CO2", subtitle="in parts per million")
var4 <- ggplot(dataAll, aes(x=Date,y=Humidity,color=Occupancy) ) +
  geom_point(size=0) +
  theme(axis.title.x = element_blank() ) +
  theme(axis.title.y = element_blank() ) +
  labs(title="Humidity", subtitle="in relative %")
var5 <- ggplot(dataAll, aes(x=Date,y=HumidityRatio,color=Occupancy) ) +
  geom_point(size=0) +
  theme(axis.title=element_text(size=14) ) +
  theme(axis.title.y = element_blank() ) +
  labs(title="Humidity Ratio", subtitle="in kgwater-vapor/kg-air")
# combine plot objects
var1 / var2 / var3 / var4 / var5 + grpText

