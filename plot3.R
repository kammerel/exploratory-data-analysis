# Set system language to English
Sys.setlocale("LC_ALL","English")

# Set working directory
setwd("E:/Dokumente/Fortbildung on the job/Coursera/Data Science Specialization/Course 4 Exploratory Data Analysis/Week 1/exdata_data_household_power_consumption")

# Read in data
data <- read.table(file = "household_power_consumption.txt", header = T, sep = ";",na.strings = "?")


# Create variable datetime and format 
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime,"%d/%m/%Y %H:%M:%S") 

# Subset data to two days
data <- data[(data$datetime >= "2007-02-01 00:00:00" & data$datetime < "2007-02-02 23:59:00"), ]

png("Plot3.png", width = 480, height = 480)

with(data, plot(data$datetime, data$Sub_metering_1,type = "l", col = "black", xlab = "", ylab = "Energy Sub metering"))
with(data, lines(data$datetime, data$Sub_metering_2,type = "l", col = "red"))
with(data, lines(data$datetime, data$Sub_metering_3,type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()
