setwd("f:/Coursera/Exploratory Data Analysis/Project1/")
pre_DATA<-read.table("./household_power_consumption.txt", sep=";", header = T, na.string="?", nrows=69519)
pre_DATA<-transform(pre_DATA, Date = as.Date(Date,"%d/%m/%Y"))
DATA<-pre_DATA[pre_DATA$Date=="2007-02-01"|pre_DATA$Date=="2007-02-02",]
#DATA$Day.week = format(DATA$Date,"%A")
DATA$cas = strptime(paste(DATA$Date,DATA$Time), "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
#plot 2
png(width=480,height=480,"plot2.png")
plot(y=DATA$Global_active_power,x=DATA$cas,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
