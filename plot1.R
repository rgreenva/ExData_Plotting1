## Author:     Rick Green
## Created:    August 9, 2014
## File Name:  plot1.R
##
## Description: 
##    This file will read in Electrical Power Consumption
##    dataset from the UCI Machine Learning repository.  The
##    data will then be used to create a plot of the data.  
##    The plot to be created is histogram of Global Active 
##    Power in kilowatts.

plot <- function(){
      ## Create some variables for later use
      plot.name <- "plot1.png"
      plot.width <- 480
      plot.height <- 480
      plot.title <- "Global Active Power"
      plot.xlab <- "Golbal Active Power (kilowatts)"
      plot.col <- "Red"
      plot.freq <- TRUE
      
      ## Read in just the necessary data from the file 
      edata <- read.table("household_power_consumption.txt", 
                          sep = ";", 
                          na.strings = "?", 
                          header = TRUE)
      
      ## Convert the "Date" column to a date value
      edata[, "Date"] <- as.Date(edata[, "Date"],
                                 format = "%d/%m/%Y")

      ## Get the subset of data we are using for the plot
      edatadates <- edata[, 1]
      testdates <- c("2007-02-01", "2007-02-02")
      testdates <- as.Date(testdates)
      plot.data <- edata[which(edatadates == testdates[1] | 
                                     edatadates == testdates[2]), ]
      
      ## Prepare the data for the histogram plot
      plot.data[, 3] <- as.numeric(plot.data[, 3])
      
      ## Create the plot and save it as plot1.png
      png(plot.name, plot.width, plot.height)
      hist(plot.data[, 3], 
           freq = plot.freq, 
           col = plot.col, 
           main = plot.title, 
           xlab = plot.xlab)
      dev.off()
}