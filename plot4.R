data <- read.csv('household_power_consumption.txt', sep=';')
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data <- within(data, {
    Global_active_power <- as.numeric(Global_active_power)
    Global_reactive_power <- as.numeric(Global_reactive_power)
    Voltage <- as.numeric(Voltage)
    Sub_metering_1 <- as.numeric(Sub_metering_1)
    Sub_metering_2 <- as.numeric(Sub_metering_2)
    Sub_metering_3 <- as.numeric(Sub_metering_3)
    t <- strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S')
})

png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
with(data,
     plot(t, Global_active_power, type='l', xlab='',
          ylab='Global Active Power'))
with(data, {
     plot(t, Sub_metering_1, type='l', xlab='',
          ylab='Energy sub metering')
     lines(t, Sub_metering_2, col='red')
     lines(t, Sub_metering_3, col='blue')
     legend('topright', lwd=1, col=c('black', 'red', 'blue'),
            legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
with(data,
     plot(t, Voltage, type='l', xlab='datetime'))
with(data,
     plot(t, Global_reactive_power, type='l', xlab='datetime'))
})
dev.off()
