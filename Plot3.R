# Plot 3
#
# You should download and extract the household_power_consumption database
# on your working directory before running this code !
#
data<-read.table("./household_power_consumption.txt",header = T,sep=";",na.strings = "?")
library(dplyr)
data<-filter(data,Date=="1/2/2007"| Date=="2/2/2007")
class(data$Date)
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

# Setting the datetime variable right
data$Datetime<-paste(data$Date,data$Time)
# This step below is necessary to change the weekdays to the English language
Sys.setlocale(category="LC_ALL", locale="C")
datetime<-as.POSIXct(data$Datetime)
#Plots
png(filename = "Plot3.png")
plot(datetime,data$Sub_metering_1, 
     type = "l", ylab="Energy sub metering",xlab="", col="black")
lines(datetime,data$Sub_metering_2, col="red")
lines(datetime,data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1)

dev.off()