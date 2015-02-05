data <- read.csv("household_power_consumption.txt",sep=";",header=TRUE)

data$Date <- as.Date(data$Date,format="%d/%m/%Y")

sub <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

#Plot 4
png(file = "plot4.png") 
par(bg = "transparent")
par(mfrow = c(2, 2))
with(sub, {
  plot(as.POSIXlt(paste(sub$Date,sub$Time)),as.numeric(as.character(sub$Global_active_power)),type="l", xlab="", ylab="Global Active Power")
  plot(as.POSIXlt(paste(sub$Date,sub$Time)),as.numeric(as.character(sub$Voltage)),type="l", xlab="datetime", ylab="Voltage")
  with(subset(sub), plot(as.POSIXlt(paste(sub$Date,sub$Time)),as.numeric(as.character(sub$Sub_metering_1)),type="l", col="black", xlab="",ylab="Energy sub metering"))
  with(subset(sub), lines(as.POSIXlt(paste(sub$Date,sub$Time)),as.numeric(as.character(sub$Sub_metering_2)), col="red"))
  with(subset(sub), lines(as.POSIXlt(paste(sub$Date,sub$Time)),as.numeric(as.character(sub$Sub_metering_3)), col="blue"))
  legend("topright", lty = c("solid", "solid", "solid") , col = c("black","blue", "red"),, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(as.POSIXlt(paste(sub$Date,sub$Time)),as.numeric(as.character(sub$Global_reactive_power)),type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()