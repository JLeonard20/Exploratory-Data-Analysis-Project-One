# reading, naming, and subsetting power consumption data.

my_df <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(my_df) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

head(my_df)

sub_my_df <- subset(my_df, Date == "1/2/2007" | Date == "2/2/2007")

sapply(sub_my_df, class)

# call the histogram graphics function

hist(as.numeric(sub_my_df$Global_active_power), col = "green",
     main = "Global Active Power", xlab = "Household Global minute-averaged active power (in kilowatt)")

#copying to png

dev.copy(png, file = "plot1.png")
dev.off()

sub_my_df$Date <- as.Date(sub_my_df$Date)
sub_my_df <- strptime(sub_my_df$Time, format = "")






