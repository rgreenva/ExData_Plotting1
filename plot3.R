## Author:     Rick Green
## Created:    August 9, 2014
## File Name:  plot3.R
##
## Description: 
##    This file will read in Electrical Power Consumption
##    dataset from the UCI Machine Learning repository.  The
##    data will then be used to create a plot of the data.  

plot <- function(){
      ## Create some variables for later use
      plot.name <- "plot3.png"
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
      x <- plot.data[, "DateTime"]
      y1 <- as.numeric(plot.data[, 7])
      y2 <- as.numeric(plot.data[, 8])
      y3 <- as.numeric(plot.data[, 9])
      
      ## Create the plot and save it as plot1.png
      png(plot.name, plot.width, plot.height)
      plot(x, y1, type = "l", 
           xlab = "", ylab = "Energy sub metering")
      lines(x, y2, type = "l", col = "Red")
      lines(x, y3, type = "l", col = "Blue")
      legend("topright",
             c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
             col = c("Black", "Red", "Blue"), 
             lty = 1)
      dev.off()
}