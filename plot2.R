unzip("exdata_data_household_power_consumption.zip","household_power_consumption.txt")
raw <- read.csv2("household_power_consumption.txt", na.strings="?", colClass="character")
day1 <- raw[raw$Date=="1/2/2007",]
day2 <- raw[raw$Date=="2/2/2007",]
table <- rbind(day1,day2)
for (i in 3:9) {table[[i]] <- as.numeric(table[[i]])}
time <- strptime(paste(table$Date,":",table$Time,sep=""),"%d/%m/%Y:%H:%M:%S")
png("plot2.png")
plot(time,table$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
