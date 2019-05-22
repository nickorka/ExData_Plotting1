source("data.R")

data <- read.table(dest_file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
data$dt <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", 480, 480, bg = "white")
plot(data$dt, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(data$dt, data$Sub_metering_1, type = "l")
points(data$dt, data$Sub_metering_2, type = "l", col = "red")
points(data$dt, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#dev.copy(png, filename = "plot3.png", width = 480, height = 480, bg = "white")
dev.off()