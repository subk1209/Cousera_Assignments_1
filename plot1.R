df = read.table('D:/Coursera/EDA (Hopkins)/household_power_consumption.txt',
                sep = ';', header = T)
dim(df)
head(df,2)
str(df)
# View(df)

# transformation
df$date = as.Date(df$Date, format = '%d/%m/%Y')
df$time = strptime(df$Time, format = '%H:%M:%S')

# Data under consideration
d = df[df$date >= '2007-02-01' & df$date <= '2007-02-02',]
colnames(d)

d$Global_active_power = as.numeric(d$Global_active_power)

par(mar = c(5,5,5,3))
png(filename = 'plot1.png', height = 480, width = 480)
hist(d$Global_active_power,
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)',
     col = 'red')
dev.off()
