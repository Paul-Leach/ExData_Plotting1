unzip("exdata_data_household_power_consumption.zip","household_power_consumption.txt")
raw <- read.csv2("household_power_consumption.txt", na.strings="?", colClass="character")
# get the data for the days we care about
day1 <- raw[raw$Date=="1/2/2007",]
day2 <- raw[raw$Date=="2/2/2007",]
table <- rbind(day1,day2)
# convert to numeric
for (i in 3:9) {table[[i]] <- as.numeric(table[[i]])}
png("plot1.png")
hist(table$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
