

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

## step 2: open png-device
png("plot1.png", width = 480, height = 480)

## step3: create histogram
hist(as.numeric(energyData$Global_active_power),main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")

## step4: close device
dev.off()