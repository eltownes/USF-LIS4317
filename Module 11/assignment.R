
# prep the environment
library(dplyr)
library(ggplot2)
library(ggExtra)
library(ggthemes)
library(gridExtra)

# function - random
random <- function(){
    # get magnitude
    mag <- sample(-4:4,1)
    return(mag)
}

createDF <- function(){
    # create data frame
    df <- data_frame(x=0,m=0,y=0)
    # loop
    for(i in 1:5000){
        r <- random()
        cumulative <- r + sum(df$m)
        df <- bind_rows(df,c(x=i,m=r,y=cumulative) )
    }
    return(df)
}

# create data frame
df1 <- createDF()
df1$c <- ifelse(df1$y<0,"red","green")
# plot
df1Plot <- ggplot(df1, aes(x=x,y=y,col=c ) ) +
    geom_point(size=0) +
    scale_color_identity() +
    theme_tufte(ticks=F) +
    theme(legend.text = element_blank(),
          legend.title = element_blank(),
          legend.background = element_blank(),
          )
df1plotM1 <- ggMarginal(p=df1Plot, type="boxplot", margins=c("y"),
            fill="transparent")
df1plotM2 <- ggMarginal(p=df1Plot, type="boxplot", margins=c("y"),
            groupFill=T)
# grid arrange
grid.arrange(df1plotM1,df1plotM2,ncol=2)
