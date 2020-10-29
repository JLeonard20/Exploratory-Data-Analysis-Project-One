# reading, naming, and subsetting power consumption data.

my_df <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(my_df) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

head(my_df)

sub_my_df <- subset(my_df, Date == "1/2/2007" | Date == "2/2/2007")

sapply(sub_my_df, class)

head(sub_my_df)

datetime <- strptime(paste(sub_my_df$Date, sub_my_df$Time, sep = " "),
                     "%d/%m/%Y %H:%M:%S")

sub_my_df$Global_active_power <- as.numeric(sub_my_df$Global_active_power)

plot(datetime, sub_my_df$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power")
title(main = "Global Active Power in KW")

# create png file
dev.copy(png, file = "plot2.png")
dev.off()
