
my_df <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(my_df) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

head(my_df)

sub_my_df <- subset(my_df, Date == "1/2/2007" | Date == "2/2/2007")

sapply(sub_my_df, class)

head(sub_my_df)

#Transform vectors into the correct format.

datetime <- strptime(paste(sub_my_df$Date, sub_my_df$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

sub_my_df$Global_active_power <- as.numeric(sub_my_df$Global_active_power)
sub_my_df$Sub_metering_1 <- as.numeric(sub_my_df$Sub_metering_1)
sub_my_df$Sub_metering_2 <- as.numeric(sub_my_df$Sub_metering_2)
sub_my_df$Sub_metering_3 <- as.numeric(sub_my_df$Sub_metering_3)

plot(datetime, sub_my_df$Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, sub_my_df$Sub_metering_2, type = "l", col = "red")
lines(datetime, sub_my_df$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png, file = "plot3.png")
dev.off()
