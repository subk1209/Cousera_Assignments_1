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

png("plot3.png", width=480, height=480)
plot(datetime, d$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, d$Sub_metering_2, type="l", col="red")
lines(datetime, d$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
