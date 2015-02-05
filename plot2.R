data <- read.csv("household_power_consumption.txt",sep=";",header=TRUE)

data$Date <- as.Date(data$Date,format="%d/%m/%Y")

sub <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]


#Plot 2
png(file = "plot2.png") 
par(bg = "transparent")
par(mfrow = c(1, 1))
plot(as.POSIXlt(paste(sub$Date,sub$Time)),as.numeric(as.character(sub$Global_active_power)),type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

