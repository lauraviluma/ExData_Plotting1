setwd("~/r_scripts/Exploratory analysis/ExData_Plotting1")
power_data<-read.csv("household_power_consumption.txt", sep=";" )
library(dplyr)
small_data<- filter(power_data, Date=="1/2/2007" | Date=="2/2/2007")
small_data1<-mutate(small_data, DT=paste(Date, Time))

small_data1<-mutate(small_data1, DT=as.POSIXct(DT, tz="", format= "%d/%m/%Y %H:%M:%S"))
small_data1<-mutate(small_data1, Sub_metering_2=as.numeric(Sub_metering_2))
small_data1<-mutate(small_data1, Sub_metering_1=as.numeric(Sub_metering_1))



##Create plot4
png(file = "plot4.png")
par(mfcol = c(2, 2))
with(small_data1,{
  plot(DT, Global_active_power, ylab = "Global Active Power (Kilowatts)", xlab="" , type="l")
  plot(DT, Sub_metering_1, ylab = "Energy sub metering", xlab="" , type="l", col=1)
lines(DT, Sub_metering_2, ylab = "Energy sub metering", xlab="" , col=2)
lines(DT, Sub_metering_3, ylab = "Energy sub metering", xlab="" , col="blue")
legend("topright", lty=1, col = c(1, "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(DT,Voltage, ylab="Voltage", xlab="datetime", type="l")
  plot(DT,Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
})
## Close the PNG file device
dev.off()