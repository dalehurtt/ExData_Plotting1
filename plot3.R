# This program takes the UC Irvine Machine Learning Repository (http://archive.ics.uci.edu/ml/) dataset 
# Electric Power Consumption (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip),
# using the definition at https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption,
# and plots three sub-metering values by datetime for the dates February 1-2 of 2007 as a three-line chart, with legend.

#### NOTE THAT THIS CODE HAS A DEPENDENCY ON household_power_consumption.txt AND getdata.R BEING IN THE SAME
#### SUB-DIRECTORY AS THIS CODE FILE AND getdata.R BEING EXECUTED FIRST.

source ('./getdata.R')  # Load the data, it is has not already been loaded; sets the variable 'target'.

png (file = 'plot3.png', width = 480, height = 480)  # Create a PNG file, specifying 480 by 480 pixels in size
plot (target$datetime, target$Sub_metering_1, xlab = "", ylab = "Energy sub metering", 
      main = "", type = "l")  # Plot the first line of the chart
lines (target$datetime, target$Sub_metering_2, col = "red")  # Plot the second line of the chart
lines (target$datetime, target$Sub_metering_3, col = "blue")  # Plot the third line of the chart
legend ("topright", lty = c (1, 1, 1), col = c ("black", "red", "blue"), 
        legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))  # Add the legend
dev.off ()  # Close the PNG file
