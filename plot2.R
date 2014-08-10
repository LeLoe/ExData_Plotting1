

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
png("plot2.png", width = 480, height = 480)

## step3: create plot
plot(energyData$DateTime,energyData$Global_active_power,type="l",main="",xlab ="", 
     ylab="Global Active Power (kilowatts)" )

## step4: close device
dev.off()