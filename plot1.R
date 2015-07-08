setwd("/Users/katherinezhang/Desktop/Coursera R")

## Readin table and create DateTime Variable
datain <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")
datain$DateTime<-strptime(paste(datain$Date,datain$Time),"%d/%m/%Y %H:%M:%S")

## Create subset 
datawork<-subset(datain,as.Date(DateTime)=='2007-02-01'|as.Date(DateTime)=='2007-02-02')

## Plot 1
png("plot1.png",width=480,height=480)
par(mfrow=c(1,1))
hist(datawork$Global_active_power,col = "red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()