df = read.table('D:/Coursera/EDA (Hopkins)/household_power_consumption.txt',
                sep = ';', header = T)
dim(df)
head(df,2)
str(df)
View(df)

# transformation
df$date = as.Date(df$Date, format = '%d/%m/%Y')

# Data under consideration
d = df[df$date >= '2007-02-01' & df$date <= '2007-02-02',]
datetime <- strptime(paste(d$Date, d$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S")


png(filename = 'plot2.png', height = 480, width = 480)
plot(datetime, d$Global_active_power, type = 'l',
     xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()
