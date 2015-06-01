plot2 <- function() {
  inp_table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
  inp_table$Time <- strptime(paste(inp_table$Date, inp_table$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
  inp_table$Date <- as.Date(inp_table$Date, format = "%d/%m/%Y")
  working_table <- inp_table[inp_table$Date == "2007-02-01" | inp_table$Date == "2007-02-02", ]
  active_power <- as.numeric(working_table$Global_active_power)
  max_active_power <- max(active_power, na.rm = TRUE)
  num_bars <- max_active_power/0.5
  png(filename = "plot2.png", width = 480, height = 480)
  plot(working_table$Time, active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  dev.off()
}