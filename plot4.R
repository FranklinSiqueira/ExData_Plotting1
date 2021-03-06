## ______________________________________________________________________________________________________
## This R script takes the file and variables respectively downloaded, uncrompressed and declared
## in the R script cpInitVars.R and plots a histogram graph to a file named plot4.png.
## It's required to save and source both scripts in the current working directory.
##
## IMPORTANT: Days of week are shown in the portuguese (Brazil) language abreviations for THU, FRI and SAT
##            QUI, SEX and SAB.

## First things first: checking if cpInterval1 exists:

if(!is.data.frame(cpInterval1)) {
        
        source("cpInitVars.R")

        cpInterval1<- FunInit()
        
}

## Defining parameters to plot the elements to a graph:

cpDatetime     <- strptime(paste(cpInterval1$Date, cpInterval1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

cpGActivePwr   <- cpInterval1$Global_active_power

cpGReactivePwr <- cpInterval1$Global_reactive_power

cpVoltage      <- cpInterval1$Voltage

cpSMeter1      <- cpInterval1$Sub_metering_1

cpSMeter2      <- cpInterval1$Sub_metering_2

cpSMeter3      <- cpInterval1$Sub_metering_3

## Defining the device to render and file name to be used:

png("plot4.png", width=480, height=480)

## Defining rows and columns to output device, initialising and plotting:

par(mfrow = c(2, 2))

with(cpDatetime, {
        plot(cpGActivePwr, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        plot(cpVoltage, type="l", xlab="datetime", ylab="Voltage")
        plot(cpSMeter1, type="l", ylab="Energy Sub metering", xlab="")
        lines(cpSMeter2, type="l", col="red")
        lines(cpSMeter3, type="l", col="blue")
        legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), lwd=1, bty="n", cex=.5)
        plot(cpGReactivePwr, type="l", xlab="datetime", ylab="Global_reactive_power")
   
 })

## Closing output device:

dev.off()
