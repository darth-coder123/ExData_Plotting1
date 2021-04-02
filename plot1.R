df_full <- read.csv("C:/Users/Darth Saxena/Desktop/exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
df_full$Date <- as.Date(df_full$Date, format="%d/%m/%Y")

# We will now extract the data from the relevant dates
df_required <- subset(df_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(df_full)

# We will now convert the date to a better format
datetime <- paste(as.Date(df_required$Date), df_required$Time)

df_required$Datetime <- as.POSIXct(datetime)

# The following code gives the first plot
hist(df_required$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# The following code generates plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()

