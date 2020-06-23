setwd("~/r_scripts/Exploratory analysis/ExData_Plotting1")
power_data<-read.csv("household_power_consumption.txt", sep=";" )
library(dplyr)
small_data<- filter(power_data, Date=="1/2/2007" | Date=="2/2/2007")
small_data1<-mutate(small_data, DT=paste(Date, Time))

small_data1<-mutate(small_data1, DT=as.POSIXct(DT, tz="", format= "%d/%m/%Y %H:%M:%S"))

##Create plot2

png(file = "plot2.png")
## Create plot and send to a file (no plot appears on screen)
with(small_data1, plot(DT, Global_active_power, ylab = "Global Active Power (Kilowatts)", xlab="" , type="l"))
## Close the PNG file device
dev.off()