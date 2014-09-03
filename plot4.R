setwd("f:/Coursera/Exploratory Data Analysis/Project1/")
pre_DATA<-read.table("./household_power_consumption.txt", sep=";", header = T, na.string="?", nrows=69519)
pre_DATA<-transform(pre_DATA, Date = as.Date(Date,"%d/%m/%Y"))
DATA<-pre_DATA[pre_DATA$Date=="2007-02-01"|pre_DATA$Date=="2007-02-02",]
DATA$cas = strptime(paste(DATA$Date,DATA$Time), "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
#plot 4
png(width=480,height=480,"plot4.png")
par(mfcol=c(2,2))
plot(y=DATA$Global_active_power,x=DATA$cas,type="l",xlab="", ylab="Global Active Power")
plot(y=DATA$Sub_metering_1,x=DATA$cas,type="l",xlab="", ylab="Energy sub metering")
lines(y=DATA$Sub_metering_2,x=DATA$cas,type="l",col="red")
lines(y=DATA$Sub_metering_3,x=DATA$cas,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
plot(y=DATA$Voltage,x=DATA$cas,type="l",xlab="datetime", ylab="Voltage")
plot(y=DATA$Global_reactive_power,x=DATA$cas,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
