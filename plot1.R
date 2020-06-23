setwd("~/r_scripts/Exploratory analysis/ExData_Plotting1")
power_data<-read.csv("household_power_consumption.txt", sep=";" )
library(dplyr)
small_data<- filter(power_data, Date=="1/2/2007" | Date=="2/2/2007")
small_data<-mutate(small_data, Global_active_power=as.numeric(Global_active_power))

##create plot1

png(file = "plot1.png")
## Create plot and send to a file (no plot appears on screen)
with(small_data, hist(Global_active_power, col=2, xlab = "Global Active Power (Kilowatts)", main = "Global Active Power" ))
## Close the PNG file device
dev.off()
