data <- read.csv('household_power_consumption.txt', sep=';',
                 colClasses='character')
data <- data[data$Date %in% c('1/2/2007', '2/2/2007'),]
data <- within(data, {
    Global_active_power <- as.numeric(Global_active_power)
})

png(filename = "plot1.png", width = 480, height = 480)
with(data,
     hist(Global_active_power, col='red', main='Global Active Power',
          xlab='Global Active Power (kilowatts)'))
dev.off()
