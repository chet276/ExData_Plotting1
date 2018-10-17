DF <- read.table("household_power_consumption.txt", sep=";",header=TRUE,
                 na.strings="?",colClasses=c("character","character","numeric",
                 "numeric","numeric","numeric","numeric","numeric","numeric"))
DF$datetime <- strptime(paste(DF$Date,DF$Time),format="%d/%m/%Y %H:%M:%S")
subDF <- subset(DF, Date=="1/2/2007"|Date=="2/2/2007")
plot(subDF$datetime,subDF$Global_active_power,type="n",xlab="",
     ylab="Global Active Power (kilowatts)")
lines(subDF$datetime,subDF$Global_active_power)
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()