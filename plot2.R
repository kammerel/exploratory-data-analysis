# Set system language to English
Sys.setlocale("LC_ALL","English")

# Set working directory
setwd("E:/Dokumente/Fortbildung on the job/Coursera/Data Science Specialization/Course 4 Exploratory Data Analysis/Week 1/Assignment")

# Read Data
data <- read.table(file = "household_power_consumption.txt", header = T, sep = ";",na.strings = "?")

# Create variable datetime and format 
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime,"%d/%m/%Y %H:%M:%S") 

# Subset data to two days
data <- data[(data$datetime >= "2007-02-01 00:00:00" & data$datetime < "2007-02-02 23:59:00"), ]

# Open graphics device and set pixel
png("Plot2.png", width = 480, height = 480)

# Specify plot 
plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Switch off graphics device
dev.off()

