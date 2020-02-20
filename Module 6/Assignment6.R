
# prep environment
library("readr")
library("dplyr")
library("stringr")
library("tidyr")
library("RColorBrewer")
library("ggplot2")

# read file
fdata <- read_csv("RELATIVEHEALTHIMPORTANCE.csv")
class(fdata)
glimpse(fdata)

# clean
cln <- filter(fdata, CHSI_State_Name == "Florida")
remove(fdata)
cln <- cln[,c(-1:-2,-4:-6)]

# modify column names
tmpColNms <- colnames(cln)
tmpColNms <- str_remove_all(tmpColNms, "RHI_")
tmpColNms <- str_remove_all(tmpColNms, "_Ind")
tmpColNms <- str_replace(tmpColNms, "CHSI_County_Name", "County")
colnames(cln) <- tmpColNms

# pivot for plot - going long
clnLong <- pivot_longer(cln, -"County",
                      names_to = "Var", values_to = "Val")

# check value boundaries
max(clnLong$Val)
min(clnLong$Val)

# delete invalid data - replace with NA iot plot NA values
clnLong[clnLong==-1] <- NA

# heat map
brewer.pal( 8, "Blues" )

ggplot(clnLong, aes(x=Var, y=County) ) +
  geom_tile( aes(fill=Val) ) +
  scale_fill_gradient(low = "#DEEBF7",
                      na.value = "yellow",
                      high = "#084594" ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1) )

