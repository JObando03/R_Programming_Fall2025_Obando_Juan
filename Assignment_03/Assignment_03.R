#load ggplot
library(ggplot2)
#create vectors to work with
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll   <- c(  4,      62,      51,    21,      2,        14,       15)
CBS_poll   <- c( 12,      75,      43,    19,      1,        21,       19)
#combine all into a data frame
df_polls <- data.frame(Name, ABC_poll, CBS_poll)
#check the data frame and ensure its all good
str(df_polls)
#check the first few values of the data frame
head(df_polls)
#get the mean of the abc poll
mean(df_polls$ABC_poll)
#get the median of the abc poll
median(df_polls$ABC_poll)
#get the mean of the cbs poll
mean(df_polls$CBS_poll)
#get the median of the cbs poll
median(df_polls$CBS_poll)
#get the range between both of the polls
range(df_polls[, c("ABC_poll","CBS_poll")])
#create a new column that calculates the differences between both polls
df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_pol
#create a column graph of the candidates and their numbers based on abc polls
ggplot(df_polls,aes(x=Name, y= ABC_poll))+
         geom_col()
#create a column graph of the candidates based on their numbers from the cbs polls
ggplot(df_polls,aes(x=Name,y=CBS_poll))+
  geom_col()
       