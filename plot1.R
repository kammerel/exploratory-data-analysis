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

png(filename = "plot1.png")

with(data, hist(data$Global_active_power,
        main = "Global Active Power",
        xlab = "Global Active Power (killowatts)",
        col = "red"))

dev.off()


