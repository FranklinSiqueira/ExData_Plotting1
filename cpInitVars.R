##
## This Function does the following:
##
## 1) Ckecks if file found in the link
## https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip
## exists in current working directory;
##      1.1) If so, and if its contents was already extracted, reads the file extracted from the compressed
##           to a data.frame cpDataFrame; 
## 2) Subsets the interval comprised of the dates 1/2/2007 and 2/2/2007 to a data.frame cpInterval;
## 3) Converts and assigns Date and Time columns to cpDatetime;
## 4) Finally, assigns new names to Global_active_power, Global_reactive_power, Voltage, Sub_metering_1,
##    Sub_metering_2 and Sub_metering_3.
##
## Bellow, follow the variables and its descriptions as defined in the UCI web site
## (https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption): 
## 
## Date: Date in format dd/mm/yyyy
## Time: time in format hh:mm:ss
## Global_active_power: household global minute-averaged active power (in kilowatt)
## Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
## Voltage: minute-averaged voltage (in volt)
## Global_intensity: household global minute-averaged current intensity (in ampere)
## Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
##     It corresponds to the kitchen, containing mainly a dishwasher, 
##     an oven and a microwave (hot plates are not electric but gas powered).
## Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
##     It corresponds to the laundry room, containing a washing-machine, a tumble-drier, 
##     a refrigerator and a light.
## Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 
##     It corresponds to an electric water-heater and an air-conditioner.
##
## Thanks for the useful information found in the links below:
##
## https://rpubs.com/dmaurath/24642
## https://bitbucket.org/maurotrb/getting-cleaning-data-2014-project/src


FunInit <- function() {
        
        if(!file.exists("exdata-data-household_power_consumption.zip") & !file.exists("household_power_consumption.txt")) {
                temp <- tempfile()
                download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip",temp)
                file <- unzip(temp)
                unlink(temp)
        }
        
        cpRawFile      <- "household_power_consumption.txt"
        cpDataFrame    <- read.table(cpRawFile, header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")
        cpInterval     <- cpDataFrame[cpDataFrame$Date %in% c("1/2/2007","2/2/2007") ,]

        return(cpInterval)
        
}