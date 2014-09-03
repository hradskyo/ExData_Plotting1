setwd("f:/Coursera/Exploratory Data Analysis/Project1/")
pre_DATA<-read.table("./household_power_consumption.txt", sep=";", header = T, na.string="?", nrows=69519)
pre_DATA<-transform(pre_DATA, Date = as.Date(Date,"%d/%m/%Y"))
DATA<-pre_DATA[pre_DATA$Date=="2007-02-01"|pre_DATA$Date=="2007-02-02",]
DATA$cas = strptime(paste(DATA$Date,DATA$Time), "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
#plot 3
png(width=480,height=480,"plot3.png")
plot(y=DATA$Sub_metering_1,x=DATA$cas,type="l",xlab="", ylab="Energy sub metering")
lines(y=DATA$Sub_metering_2,x=DATA$cas,type="l",col="red")
lines(y=DATA$Sub_metering_3,x=DATA$cas,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
