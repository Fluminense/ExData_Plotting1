# Plot 4
#
# You should download and extract the household_power_consumption database
# on your working directory before running this code !
data<-read.table("./household_power_consumption.txt",header = T,sep=";",na.strings = "?")
library(dplyr)
data<-filter(data,Date=="1/2/2007"| Date=="2/2/2007")
class(data$Date)
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

# Setting date and time
data$Datetime<-paste(data$Date,data$Time)
# This step below is necessary to change the weekdays to the English language
Sys.setlocale(category="LC_ALL", locale="C")
datetime<-as.POSIXct(data$Datetime)

# Constructing the 4 plots
png(filename = "Plot4.png")
par(mfcol = c(2,2))
plot(datetime,data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(datetime,data$Sub_metering_1, 
     type = "l", ylab="Energy sub metering",xlab="", col="black")
lines(datetime,data$Sub_metering_2, col="red")
lines(datetime,data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1, box.lty=0 )
box(lty=1)
plot(datetime, data$Voltage, type="l", ylab="Voltage")
plot(datetime, data$Global_reactive_power, type="l", ylab="Global_reactive_power")
dev.off()