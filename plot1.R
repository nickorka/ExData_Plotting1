source("data.R")

data <- read.table(dest_file, header = TRUE, sep = ";", stringsAsFactors = FALSE)

hist(data$Global_active_power, xlab = "Global Activ Power (kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png, filename = "plot1.png", width = 480, height = 480, bg = "white")
dev.off()
