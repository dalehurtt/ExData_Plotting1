# This program takes the UC Irvine Machine Learning Repository (http://archive.ics.uci.edu/ml/) dataset 
# Electric Power Consumption (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip),
# using the definition at https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption,
# and plots the Global Active Power values by datetime for the dates February 1-2 of 2007.

#### NOTE THAT THIS CODE HAS A DEPENDENCY ON household_power_consumption.txt AND getdata.R BEING IN THE SAME
#### SUB-DIRECTORY AS THIS CODE FILE AND getdata.R BEING EXECUTED FIRST.

source ('./getdata.R')  # Load the data, it is has not already been loaded; sets the variable 'target'.

png (file = 'plot2.png', width = 480, height = 480)  # Create a PNG file, specifying 480 by 480 pixels in size
plot (target$datetime, target$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", 
      main = "", type = "l")  # Plot the line chart
dev.off ()  # Close the PNG file