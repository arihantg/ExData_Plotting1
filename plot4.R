plot4<-function()
{
	myfile <- "household_power_consumption.txt"
	mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
	myData <- read.csv.sql(myfile, sql=mySql, sep=";")
	myData$dt<-paste(myData$Date,myData$Time," ")
	c<-strptime(myData$dt,format="%d/%m/%Y %H:%M:%S")
	png(file="plot4.png",bg = "transparent")
	par(mfrow=c(2,2))
	plot(c,myData$Global_active_power,type="l",ylab="Global Active Power(kilowatts)")
	plot(c,myData$Voltage,type="l",ylab="Voltage")
	plot(c,myData$Sub_metering_1,type="l",ylab="Energy Sub Metering")
	lines(c,myData$Sub_metering_2,col="red")
	lines(c,myData$Sub_metering_3,col="blue")
	legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'),lty=1,lwd=0,bty="n")
	plot(c,myData$Global_reactive_power,type="l",ylab="Global_reactive_power")
	dev.off()
}
