library(ggbiplot)
library(dplyr)
library(usa)


deaded <- "https://raw.githubusercontent.com/jyu-theartofml/opioid_data/refs/heads/master/summary_data/type_counts.csv"

deads <- read.csv(deaded)

data(states)
states

deads <- left_join(deads, states[c(1,2,4)], by = c("State"="name"))

write.csv(deads, "overdose.csv", row.names = F)

deads.pc <- prcomp(deads[c(3:6)], scale.=T)

ggbiplot(deads.pc, 
         groups = deads$region,
         labels = deads$abb,
         ellipse = T) + coord_cartesian()
