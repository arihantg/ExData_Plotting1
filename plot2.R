plot2<-function()
{
myfile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(myfile, sql=mySql, sep=";")
myData$dt<-paste(myData$Date,myData$Time," ")
c<-strptime(myData$dt,format="%d/%m/%Y %H:%M:%S")
png(file="plot2.png",bg = "transparent")
plot(c,myData$Global_active_power,type="l",ylab="Global Active Power(kilowatts)")
dev.off()
}