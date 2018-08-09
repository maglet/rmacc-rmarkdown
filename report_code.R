################ Setup ######################################
library(ggplot2)
library(dplyr)
library(knitr)

#read in the data
surveys_complete<-read.csv("data/surveys_complete.csv")

###################### Analysis ############################
#how many males and females?
surveys_complete%>%
          group_by(sex)%>%
          tally
#plots
 nlevels(as.factor(surveys_complete$plot_id))
 
 #Years
 min(surveys_complete$year) #first 
 max(surveys_complete$year) #last

 #Variables
  names(surveys_complete)


#mean weight
mean(surveys_complete$weight, na.rm=TRUE)

#plot of hindfoot length and weight
ggplot(data = surveys_complete, 
       aes(x = weight, 
           y = hindfoot_length, 
           color = species_id)) + 
          geom_point(alpha = 0.1,
                     aes(color = species_id))

for(x in 1:24){
    temp <- filter(surveys_complete, plot_id == x)
    write.csv(temp, file = paste("data/plot", x, ".csv", sep = ""), row.names = FALSE)
}
