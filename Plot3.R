#COURSE PROJECT 1 EXPLORATORY DATA ANALYSIS

#Loading, naming and subsetting the data

setwd("C:/Users/Sofi/Desktop/Coursera")

data <- read.table("household_power_consumption.txt",skip=1,sep=";")

names(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                 "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                 "Sub_metering_3")

subdata <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")

#PLOT 3

subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(subdata$Date), subdata$Time)

subdata$Datetime <- as.POSIXct(datetime)

with(subdata, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab= "", )
    lines(Sub_metering_2~Datetime,col="red")
    lines(Sub_metering_3~Datetime,col="blue")
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") ,cex = 0.8)

dev.copy(png, file="plot3.png", height= 480, width= 480)
dev.off()