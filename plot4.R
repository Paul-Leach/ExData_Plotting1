unzip("exdata_data_household_power_consumption.zip","household_power_consumption.txt")
raw <- read.csv2("household_power_consumption.txt", na.strings="?", colClass="character")
day1 <- raw[raw$Date=="1/2/2007",]
day2 <- raw[raw$Date=="2/2/2007",]
table <- rbind(day1,day2)
for (i in 3:9) {table[[i]] <- as.numeric(table[[i]])}
time <- strptime(paste(table$Date,":",table$Time,sep=""),"%d/%m/%Y:%H:%M:%S")
png("plot4.png")
par(mfrow=c(2,2))
with(table,plot(time,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
with(table,plot(time,Voltage,type="l",xlab="datetime"))
with(table,plot(time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(table,points(time, Sub_metering_1,type="l",col="black"))  
with(table,points(time, Sub_metering_2,type="l",col="red"))
with(table,points(time, Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
with(table,plot(time,Global_reactive_power,type="l",xlab="datetime"))
dev.off()
