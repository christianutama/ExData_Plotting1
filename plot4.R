data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),nrows=400000)
datasub <- rbind(subset(data, data$Date=="1/2/2007"),subset(data, data$Date=="2/2/2007"))
datasub$Date <- as.Date(datasub$Date,format="%d/%m/%Y")
dateandtime <- strptime(paste(datasub$Date,datasub$Time),format="%Y-%m-%d %H:%M:%S")


par(mar=c(5,4,2,1), mfrow=c(2,2),bg="transparent")
plot(dateandtime, datasub$Global_active_power, type="l", ylab="Global Active Power",xlab="")
plot(dateandtime,datasub$Voltage,type="l",ylab="Voltage", xlab="datetime")
with(datasub,{
    plot(dateandtime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    points(dateandtime,Sub_metering_2,type="l",col="red")
    points(dateandtime,Sub_metering_3,type="l",col="blue")
})
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=c(1,1,1), cex=0.49,pt.cex=1,bty="n")
plot(dateandtime,datasub$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.copy(png, file="plot4.png")
dev.off()