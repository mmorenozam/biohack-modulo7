library(ggbiplot)
library(dplyr)

data(crime)

deaded <- "https://raw.githubusercontent.com/jyu-theartofml/opioid_data/refs/heads/master/summary_data/type_counts.csv"

deads <- read.csv(deaded)

unique(deads$State)

intersect(deads$State, crime$state)

deads <- left_join(deads, crime[c(1,9,10)], by = c("State"="state"))

write.csv(deads, "overdose.csv")
