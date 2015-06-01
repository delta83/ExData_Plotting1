plot1 <- function() {
  inp_table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
  inp_table$Date <- as.Date(inp_table$Date, format = "%d/%m/%Y")
  working_table <- inp_table[inp_table$Date == "2007-02-01" | inp_table$Date == "2007-02-02", ]
  active_power <- as.numeric(working_table$Global_active_power)
  max_active_power <- max(active_power, na.rm = TRUE)
  num_bars <- max_active_power/0.5
  png(filename = "plot1.png", width = 480, height = 480)
  hist(active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", breaks = num_bars, col = "red")
  dev.off()
}