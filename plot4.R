DF <- read.table("household_power_consumption.txt", sep=";",header=TRUE,
                 na.strings="?",colClasses=c("character","character","numeric",
                 "numeric","numeric","numeric","numeric","numeric","numeric"))
DF$datetime <- strptime(paste(DF$Date,DF$Time),format="%d/%m/%Y %H:%M:%S")
subDF <- subset(DF, Date=="1/2/2007"|Date=="2/2/2007")
par(mfcol=c(2,2))
plot(subDF$datetime,subDF$Global_active_power,type="n",xlab="",
     ylab="Global Active Power")
lines(subDF$datetime,subDF$Global_active_power)
plot(subDF$datetime,subDF$Sub_metering_1,type="n",xlab="",
     ylab="Energy sub metering")
lines(subDF$datetime,subDF$Sub_metering_1)
lines(subDF$datetime,subDF$Sub_metering_2,col="red")
lines(subDF$datetime,subDF$Sub_metering_3,col="blue")
legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2",
                                 "Sub_metering_3"),cex=0.65,col=c("black",
                                 "red","blue"),bty="n")
plot(subDF$datetime,subDF$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(subDF$datetime,subDF$Voltage)
plot(subDF$datetime,subDF$Global_reactive_power,type="n",xlab="datetime",
     ylab="Global_reactive_power")
lines(subDF$datetime,subDF$Global_reactive_power)
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()