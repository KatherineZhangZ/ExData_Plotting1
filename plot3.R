setwd("/Users/katherinezhang/Desktop/Coursera R")

## Readin table and create DateTime Variable
datain <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
datain$DateTime<-strptime(paste(datain$Date,datain$Time),"%d/%m/%Y %H:%M:%S")

## Create subset 
datawork<-subset(datain,as.Date(DateTime)=='2007-02-01'|as.Date(DateTime)=='2007-02-02')

##Plot3
png("plot3.png",width = 480, height = 480)
par(mfrow=c(1,1))
plot(datawork$DateTime,datawork$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
points(datawork$DateTime,datawork$Sub_metering_2,type="l", col="red")
points(datawork$DateTime,datawork$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty = c(1,1), col = c("black", "red","blue"))
dev.off()

