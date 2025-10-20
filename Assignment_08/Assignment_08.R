#create the student6 dataframe from the downloaded dataset
student6 <- read.table(file.choose(), header = TRUE, stringsAsFactors = FALSE)
#load the plyr package
library(plyr)
#create a dataframe based on the mean grades of each gender
gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)
#write the dataframe into a table and download it as a text file
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep  = "\t",
  row.names = FALSE
)
#filter any student names that contain the letter "i" into a new dataframe
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)
#create a comma-separated value table of just the names of the students that contain "i" and download it to the working directory
write.csv(
  i_students$Name,
  file      = "i_students.csv",
  row.names = FALSE,
  quote     = FALSE
)
#create another similar CSV file that includes all the information about the students whose names contain the letter "i" and download it to the working directory
write.csv(
  i_students,
  file      = "i_students_full.csv",
  row.names = FALSE
)
