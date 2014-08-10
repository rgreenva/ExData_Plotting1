## Author:     Rick Green
## Created:    August 9, 2014
## File Name:  plot4.R
##
## Description: 
##    This file will read in Electrical Power Consumption
##    dataset from the UCI Machine Learning repository.  The
##    data will then be used to create a plot of the data.  

plot <- function(){
      ## Create some variables for later use
      plot.name <- "plot4.png"
      plot.width <- 480
      plot.height <- 480
      
      ## Read in just the necessary data from the file 
      edata <- read.table("household_power_consumption.txt", 
                          sep = ";", 
                          na.strings = "?", 
                          header = TRUE)
      ## Convert the "Date" column to a date value
      edata[, "Date"] <- as.Date(edata[, "Date"],
                                 format = "%d/%m/%Y")
      
      ## Get the subset of data we are using for the plot
      testdates <- as.Date(c("2007-02-01", "2007-02-02"))
      plot.data <- edata[which(edata[, "Date"] == testdates[1] |
                                     edata[, "Date"] == testdates[2]), ]
      plot.data["DateTime"] <- "NA"
      plot.data$DateTime <- strptime(paste(plot.data[, "Date"], 
                                           plot.data[, "Time"]), 
                                     "%Y-%m-%d %H:%M:%S")
      
      ## Prepare the data for the plot
      x <- plot.data[, "DateTime"]
      p1y <- as.numeric(plot.data[, 3])
      p2y <- as.numeric(plot.data[, 5])
      p3y1 <- as.numeric(plot.data[, 7])
      p3y2 <- as.numeric(plot.data[, 8])
      p3y3 <- as.numeric(plot.data[, 9])
      p4y <- as.numeric(plot.data[, 4])
      
      ## Create the plot and save it as plot1.png
      png(plot.name, plot.width, plot.height)
      ## Set up the 2x2 grid
      par(mfrow = c(2, 2))
      
      ## plot the first image
      plot(x, p1y, xlab = "", 
           ylab = "Global Active Power", type = "l")
      
      ##plot the second image
      plot(x, p2y, xlab = "datetime", 
           ylab = "voltage", type = "l")
      
      ##plot the third image
      plot(x, p3y1, type = "l", 
           xlab = "", ylab = "Energy sub metering")
      lines(x, p3y2, type = "l", col = "Red")
      lines(x, p3y3, type = "l", col = "Blue")
      ## Plot the fourth image
      plot(x, p4y, xlab="datetime", 
           ylab = "Global_reactive_power", type = "l")
      
      dev.off()
}