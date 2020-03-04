
# load data
library(boot)
library(ggplot2)
library(GGally)
data(urine)
data1 <- urine

# NAs?
sum(is.na(data1))
# remove NAs
data1 <- na.omit(data1)

# plot the matrix
ggpairs(data1[,],
        lower=list(continuous=wrap("smooth",alpha=0.3,size=0.5)
                   ),
        title="Scatterplot Matrix - Urine{boot} Dataset",
        columnLabels=toupper( colnames(data1) )
        ) +
  theme(panel.grid.major = element_blank()
        )
