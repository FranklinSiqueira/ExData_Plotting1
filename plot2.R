## ______________________________________________________________________________________________________
## This R script takes the file and variables respectively downloaded, uncrompressed and declared
## in the R script cpInitVars.R and plots a graph of active power on Thursday, Friday and Saturday,
## to a file named plot2.png.
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

## Defining the device to render and file name to be used:

png("plot2.png", width=480, height=480)

## Initialising and plotting:

plot(cpDatetime, cpGActivePwr, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Closing output device:

dev.off()
