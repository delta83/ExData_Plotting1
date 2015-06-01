plot3 <- function() {
  inp_table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
  inp_table$Time <- strptime(paste(inp_table$Date, inp_table$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
  inp_table$Date <- as.Date(inp_table$Date, format = "%d/%m/%Y")
  working_table <- inp_table[inp_table$Date == "2007-02-01" | inp_table$Date == "2007-02-02", ]
  sub_metering_1 <- as.numeric(working_table$Sub_metering_1)
  sub_metering_2 <- as.numeric(working_table$Sub_metering_2)
  sub_metering_3 <- as.numeric(working_table$Sub_metering_3)
  png(filename = "plot3.png", width = 480, height = 480)
  plot(working_table$Time, sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
  lines(working_table$Time, sub_metering_2, col = "red")
  lines(working_table$Time, sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex = 0.5, lty = c(1,1))
  dev.off()
}