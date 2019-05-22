source("data.R")

data <- read.table(dest_file, header = TRUE, sep = ";", stringsAsFactors = FALSE)
data$dt <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

plot(data$dt, data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Activ Power (kilowatts)", main = "Global Active Power")

dev.copy(png, filename = "plot2.png", width = 480, height = 480, bg = "white")
dev.off()