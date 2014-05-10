# This program takes the UC Irvine Machine Learning Repository (http://archive.ics.uci.edu/ml/) dataset 
# Electric Power Consumption (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip),
# using the definition at https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption,
# and plots four separate charts using data for the dates February 1-2 of 2007: a line chart of Global Active Power
# by datetime; a line chart of Voltage by datetime; a three-line chart, with legend, of sub-metering values by datetime;
# and a line chart of Global Reactive Power by datetime.

#### NOTE THAT THIS CODE HAS A DEPENDENCY ON household_power_consumption.txt AND getdata.R BEING IN THE SAME
#### SUB-DIRECTORY AS THIS CODE FILE AND getdata.R BEING EXECUTED FIRST.

source ('./getdata.R')  # Load the data, it is has not already been loaded; sets the variable 'target'.

png (file = 'plot4.png', width = 480, height = 480)  # Create a PNG file, specifying 480 by 480 pixels in size

par (mfrow = c (2, 2))  # Indicate that the graphic will be 2 rows of 2 plots each
with (target, {
    # Plot the line chart in the upper left
    plot (datetime, Global_active_power, xlab = "", ylab = "Global Active Power", 
          main = "", type = "l")
    
    # Plot the line chart in the upper right
    plot (datetime, Voltage, main = "", type = "l")
    
    # Plot the three-line chart in the lower left
    plot (datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", 
          main = "", type = "l")  # Plot the line chart
    lines (datetime, Sub_metering_2, col = "red")
    lines (datetime, Sub_metering_3, col = "blue")
    legend ("topright", lty = c (1, 1, 1), col = c ("black", "red", "blue"), 
            legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
    
    # Plot the line chart in the lower right
    plot (datetime, Global_reactive_power, main = "", type = "l")
})


dev.off ()  # Close the PNG file
