## ______________________________________________________________________________________________________
## This R script takes the file and variables respectively downloaded, uncrompressed and declared
## in the R script cpInitVars.R and plots a histogram graph to a file named plot1.png.
## It's required to save and source both scripts in the current working directory.

## First things first: checking if cpInterval1 exists:

if(!is.data.frame(cpInterval1)) {
        
        source("cpInitVars.R")
        
        cpInterval1<- FunInit()
        
}

## Defining parameters to plot the elements to a graph:

cpGActivePwr   <- cpInterval1$Global_active_power

## Defining the device to render and file name to be used:

png("plot1.png", width=480, height=480)

## Initialising and plotting:

hist(cpGActivePwr, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Closing output device:

dev.off()
