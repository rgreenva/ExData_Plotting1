## Author:     Rick Green
## Created:    August 9, 2014
## File Name:  plot2.R
##
## Description: 
##    This file will read in Electrical Power Consumption
##    dataset from the UCI Machine Learning repository.  The
##    data will then be used to create a plot of the data.  

plot <- function(){
      ## Create some variables for later use
      plot.name <- "plot2.png"
      plot.width <- 480
      plot.height <- 480
      plot.xlab <- ""
      ploy.ylab <- "Global Active Power (kilowatts)"
      plot.type <- "l"
      
      ## Read in just the necessary data from the file 
      edata <- read.table("household_power_consumption.txt", 
                          sep = ";", 
                          na.strings = "?", 
                          header = TRUE)
      ## Convert the "Date" column to a date value
      edata[, "Date"] <- as.Date(edata[, "Date"],
                                 format = "%d/%m/%Y")
      ## Convert the Time column to a time value
      ##edata[, "Time"] <- 
      ## Get the subset of data we are using for the plot
      testdates <- as.Date(c("2007-02-01", "2007-02-02"))
      plot.data <- edata[which(edata[, "Date"] == testdates[1] |
                                     edata[, "Date"] == testdates[2]), ]
      plot.data["DateTime"] <- "NA"
      plot.data$DateTime <- strptime(paste(plot.data[, "Date"], 
                                           plot.data[, "Time"]), 
                                     "%Y-%m-%d %H:%M:%S")
      
      ## Prepare the data for the plot
      plot.data[, 3] <- as.numeric(plot.data[, 3])
      
      plot.data
      ## Create the plot and save it as plot1.png
      ##png(plot.name, plot.width, plot.height)
      ##plot(plot.data[, "DateTime"], 
      ##     plot.data[, 3], 
      ##     type = plot.type, 
      ##     xlab = plot.xlab, 
      ##     ylab = plot.ylab)
      ##dev.off()
}