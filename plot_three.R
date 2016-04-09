## Load the R libraries required for the function

## Set the working directory 
  setwd("C:/Users/Ian/R/Rprogramming/assignment20/exdata")

## Read the Household Power Consumption data set into a table
  hpcdata <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
  print('Load of data set into "hpcdata" completed')

## Data transformation for Date and Time
  hpcdata$Date <- as.Date(hpcdata$Date, format="%d/%m/%Y")
  df_hpcdata <- hpcdata[(hpcdata$Date=="2007-02-01") | (hpcdata$Date=="2007-02-02"),]
  df_hpcdata$Global_active_power <- as.numeric(as.character(df_hpcdata$Global_active_power))
  df_hpcdata$Global_reactive_power <- as.numeric(as.character(df_hpcdata$Global_reactive_power))
  df_hpcdata$Voltage <- as.numeric(as.character(df_hpcdata$Voltage))
  df_hpcdata <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  print('Data transformation for Date and Time completed')

## Data transformation from Char to Numeric
  df_hpcdata$Sub_metering_1 <- as.numeric(as.character(df_hpcdata$Sub_metering_1))
  df_hpcdata$Sub_metering_2 <- as.numeric(as.character(df_hpcdata$Sub_metering_2))
  df_hpcdata$Sub_metering_3 <- as.numeric(as.character(df_hpcdata$Sub_metering_3))
  print('Data transformation for Char to Numeric  completed')

## Plot 3 - To create plot2.png as a Black Line Chart with Headings
  plot3 <- function() {
  	plot(df_hpcdata$timestamp,df_hpcdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
      lines(df_hpcdata$timestamp,df_hpcdata$Sub_metering_2,col="red")
      lines(df_hpcdata$timestamp,df_hpcdata$Sub_metering_3,col="blue")
      legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
      dev.copy(png, file="plot3.png", width=480, height=480)
      dev.off()
  }
  print('Plot 3 Completed and plot3.png produced')
  plot3()

	 