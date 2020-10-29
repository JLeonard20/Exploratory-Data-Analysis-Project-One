#reading, naming columns, and subsetting the dataset.

my_df <- read.table("household_power_consumption.txt", skip = 1, sep = ";")

names(my_df) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

sub_my_df <- my_df[my_df$Date %in% c("1/2/2007", "2/2/2007"), ]

dim(sub_my_df)

sapply(sub_my_df, class)

#str(sub_my_df)

datetime <- strptime(paste(sub_my_df$Date, sub_my_df$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
active <- as.numeric(sub_my_df$Global_active_power)
reactive <- as.numeric(sub_my_df$Global_reactive_power)
voltage <- as.numeric(sub_my_df$Voltage)
Sub_metering_1 <- as.numeric(sub_my_df$Sub_metering_1)
Sub_metering_2 <- as.numeric(sub_my_df$Sub_metering_2)
Sub_metering_3 <- as.numeric(sub_my_df$Sub_metering_3)

#Building Plot and Analyzing Data

par(mfrow = c(2,2))

plot(datetime, active, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex = 0.2)

plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub_metering")
lines(datetime, Sub_metering_2, type = "l", col = "red")
lines(datetime, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty = "o")

plot(datetime, reactive, type = "l", xlab = "datetime", ylab = "Global Reactive Power")


