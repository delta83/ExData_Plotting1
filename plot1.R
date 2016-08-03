file <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
new_file <- file[which(file$Date == '1/2/2007' | file$Date == '2/2/2007'), ]
new_file$Date <- as.Date(new_file$Date, '%d/%m/%Y')
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(new_file$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()