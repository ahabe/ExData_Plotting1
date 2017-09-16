# downloads the data
library(lubridate)
library(dplyr)

## This download_data function fetch the data, extract the file
## and prepare the wanted data for the excersises
## the prepared data ar saved locally not to fetch
## every time the data from the network
download_data <- function()
{
  fileName = "data.csv"
  if(!file.exists(fileName)){
    # data not locally available --> fetch from network
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
    data <- read.table(unz(temp, "household_power_consumption.txt"), 
                       sep = ";", head = TRUE, dec = ".",  na.strings = c("?"))
    unlink(temp)
    
    # convert the date and time
    date_time <- paste(data$Date, data$Time)
    data$Date <- dmy_hms(date_time)
    data$Time <- NULL
    
    # filter only the intressted data
    limits <- data.frame("min"=as.Date("2007-02-01"), "max"=as.Date("2007-02-03"))
    data <- filter(data,  Date >= limits$min & Date < limits$max)
    
    # save the data for next usage
    data.table::fwrite(x = data, file = fileName, quote = FALSE, row.name=FALSE)
  }
  else
  {
    # data are locally available
    data <- read.table(fileName, sep = ",", head = TRUE, dec = ".", colClasses = 
                         c("character", rep("numeric", 7)))
    data$Date <- strptime(data$Date, "%Y-%m-%dT%H:%M:%SZ")
    
  }
  data
}