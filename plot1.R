setwd("f:/Coursera/Exploratory Data Analysis/Project1/")
pre_DATA<-read.table("./household_power_consumption.txt", sep=";", header = T, na.string="?", nrows=69519)
pre_DATA<-transform(pre_DATA, Date = as.Date(Date,"%d/%m/%Y"))
DATA<-pre_DATA[pre_DATA$Date=="2007-02-01"|pre_DATA$Date=="2007-02-02",]
#DATA$Day.week = format(DATA$Date,"%A")
DATA$cas = strptime(paste(DATA$Date,DATA$Time), "%Y-%m-%d %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
#plot 1
png(width=480,height=480,"plot1.png")
hist(DATA$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
