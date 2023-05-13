df = read.table('D:/Coursera/EDA (Hopkins)/household_power_consumption.txt',
                sep = ';', header = T)
dim(df)
head(df,2)
str(df)
# View(df)

# transformation
df$date = as.Date(df$Date, format = '%d/%m/%Y')

# Data under consideration
d = df[df$date >= '2007-02-01' & df$date <= '2007-02-02',]
datetime <- strptime(paste(d$Date, d$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, d$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, d$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, d$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, d$Sub_metering_2, type="l", col="red")
lines(datetime, d$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, d$Global_active_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
