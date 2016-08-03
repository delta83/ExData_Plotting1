file <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
new_file <- file[which(file$Date == '1/2/2007' | file$Date == '2/2/2007'), ]
new_file['DateTime'] <- paste(new_file$Date, new_file$Time, sep = " ")
new_file$DateTime <- strptime(new_file$DateTime, format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480)
plot(new_file$DateTime, new_file$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()