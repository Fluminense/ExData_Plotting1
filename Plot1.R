# Plot 1
#
# You should download and extract the household_power_consumption database
# on your working directory before running this code !
#
data<-read.table("./household_power_consumption.txt",header = T,sep=";",na.strings = "?")
library(dplyr)
data<-filter(data,Date=="1/2/2007"| Date=="2/2/2007")


#Histogram

png(filename = "Plot1.png")
hist(data$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()