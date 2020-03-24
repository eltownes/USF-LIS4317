
# prep environment
library(corrgram)
library(lattice)
library(MASS)
library(dplyr)
library(gridExtra)

# load data
data("birthwt")
data1 <- birthwt

# rename some columns to clarify weight metric
# lbs and gms
data1 <- rename(data1, lwt_lbs=lwt)
data1 <- rename(data1, bwt_gms=bwt)

# plot all data 
corrgram(data1,
         order=TRUE,
         lower.panel=panel.shade, upper.panel=panel.cor,
         diag.panel=panel.minmax,
         main="Birth Weight Correlation - All Variables",
         )

# birth weight for all observations
p1 <- histogram( ~ bwt_gms , data=data1,
                 type="count",
                 main="All Observations"
                 )
           
p2 <- bwplot( ~ bwt_gms , data=data1,
              main="All Observations"
              )

# birth weight by smoking status
p3 <- histogram( ~ bwt_gms | factor(smoke) , data=data1,
                 type="count",
                 main="Nonsmoker(0) and Smoker(1)"
                 )

p4 <- densityplot( ~ bwt_gms , groups=smoke, data=data1,
                   plot.points=F,
                   auto.key=T,
                   main="Nonsmoker(0) and Smoker(1)",
                   )

# birth weight by first strimester visits
p5 <- histogram( ~ bwt_gms | factor(ftv) , data=data1,
                 type="count",
                 main="First Trimester Visits"
                 )

p6 <- densityplot( ~ bwt_gms , groups=ftv, data=data1,
                   plot.points=F,
                   auto.key=T,
                   main="First Trimester Visits",
                   )

# arrange some plots together
grid.arrange(p1,p2,nrow = 1)
grid.arrange(p3,p4,p5,p6,nrow = 2)

