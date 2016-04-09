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

## Plot 4 - To create a 2*2 frame and produce 4 plots
  plot4 <- function() {
 	par(mfrow=c(2,2))
      
###	Plot 4 (Top Left) - 3 day power ###
	plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")

###	Plot 4 (Top Right) - 3 day voltages   ###
      plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")

###	Plot 4 (Bottom Left) - 3 day sub-metering   ###
	plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

###	Plot 4 (Bottom Right) - 3 day reactive power   ###
      lines(df$timestamp,df$Sub_metering_2,col="red")
      lines(df$timestamp,df$Sub_metering_3,col="blue")
      legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
      plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
      dev.copy(png, file="plot4.png", width=480, height=480)
      dev.off()
  	print('Plot 4 Completed and plot4.png produced')
  }
  plot4()
	 