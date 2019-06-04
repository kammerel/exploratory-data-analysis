# set the working directory
Sys.setlocale("LC_ALL","English")
setwd("E:/Dokumente/Fortbildung on the job/Coursera/Data Science Specialization/Course 4 Exploratory Data Analysis/Week 1/Assignment")

data <- read.table(file = "household_power_consumption.txt", header = T, sep = ";",na.strings = "?")

# data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime,"%d/%m/%Y %H:%M:%S") 

data <- data[(data$datetime >= "2007-02-01 00:00:00" & data$datetime < "2007-02-02 23:59:00"), ]


png("Plot4.png", width = 480, height = 480)


par(mfrow = c(2, 2))
with(data, {
        plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
        
        plot(data$datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        
        plot(data$datetime, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy Sub metering")
        lines(data$datetime, data$Sub_metering_2, type = "l", col = "red") 
        lines(data$datetime, data$Sub_metering_3,type = "l", col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(data$datetime, data$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        
})
        
dev.off()

