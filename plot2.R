data <- read.csv('household_power_consumption.txt', sep=';',
                 colClasses='character')
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data <- within(data, {
    Global_active_power <- as.numeric(Global_active_power)
    t <- strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S')
})

png(filename = "plot2.png", width = 480, height = 480)
with(data,
     plot(t, Global_active_power, type='l', xlab='',
          ylab='Global Active Power (kilowatts)'))
dev.off()
