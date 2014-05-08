######### PLOT 1 ############

#############################
## READ THE DATA ## 
## clear the global environment
rm(list=ls())
## read the table
data <- read.table("../household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE)
## keep only two days data that we will use
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
## convert Date, and Time to datetime object
data$datetime <- paste(data$Date, data$Time)
data$Datetime <- strptime(data$datetime, format="%d/%m/%Y %H:%M:%S")
data$Weekday <- weekdays(data$Datetime)
## change type of certain variables to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Gloabl_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
x1name="Global Active Power (kilowatts)"

###############################
## CREATE THE PLOT ##
## 1st plot
png(filename="plot1.png",width=480, height=480,units='px')
with(data, hist(Global_active_power, col="red",main="Global Active Power",xlab=x1name))
dev.off()