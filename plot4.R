

## the dataset should be available in the working directory
## the dataset is called household_power_consumption.txt, has 9 columns
## only data from 01-02-2007 and 02-02-2007 is used.

## step 1: read data into a table
energyData<-read.table("household_power_consumption.txt",header=FALSE,
                        sep=";",skip =66637, nrows = 2880)

## create header
header<-read.table("household_power_consumption.txt",header=TRUE,
                   sep=";", nrows = 1)
colnames(energyData)<-colnames(header)

## get the data en time in a good shape to make a time series plot
energyData$DateTime = (paste(energyData$Date, energyData$Time))
energyData$DateTime = strptime(energyData$DateTime, format = "%d/%m/%Y %H:%M:%S")

## step 2: open png-device
png("plot4.png", width = 480, height = 480)

## step3: create plot
## create canvas

par(bg = "transparent",mfrow = c(2,2))

## plot 1
plot(energyData$DateTime,energyData$Global_active_power,type="l",main="",xlab ="", 
     ylab="Global Active Power" )

## plot 2
plot(energyData$DateTime,energyData$Voltage,type="l",main="",xlab ="datetime", 
     ylab="Voltage" )

## plot 3
plot(energyData$DateTime, energyData$Sub_metering_1, pch = NA, type = "n", 
     ylab = "Energy sub metering", xlab = "")

## add lines
lines(energyData$DateTime, energyData$Sub_metering_1)
lines(energyData$DateTime, energyData$Sub_metering_2, col = "red")
lines(energyData$DateTime, energyData$Sub_metering_3, col = "blue")

## add legend
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = c(1, 1, 1),
       bty="n",
       col = c("black", "red", "blue"))

## plot 4
plot(energyData$DateTime,energyData$Global_reactive_power,type="l",main="",xlab ="datetime", 
     ylab="Global_reactive_power" )

## step4: close device
dev.off()