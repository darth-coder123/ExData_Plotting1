df_full <- read.csv("C:/Users/Darth Saxena/Desktop/exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
df_full$Date <- as.Date(df_full$Date, format="%d/%m/%Y")

# We will now extract the data from the relevant dates
df_required <- subset(df_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(df_full)

# We will now convert the date to a better format
datetime <- paste(as.Date(df_required$Date), df_required$Time)

df_required$Datetime <- as.POSIXct(datetime)

# The code below is used to make plot3
with(df_required, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# The code below saves plot 3
dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()


