# This program takes the UC Irvine Machine Learning Repository (http://archive.ics.uci.edu/ml/) dataset 
# Electric Power Consumption (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip),
# using the definition at https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption,
# and loads the data for the dates February 1-2 of 2007 into the variable 'target'. It adds a column named 'datetime',
# which contains the date and timestamp in POSIXct format.

#### NOTE THAT THIS CODE HAS A DEPENDENCY ON household_power_consumption.txt BEING IN THE SAME SUB-DIRECTORY AS THIS
#### CODE FILE. IT WILL BE EXECUTED BEFORE OTHER CODE IN ORDER TO CACHE THE DATA USED BY LATER PLOTTING CODE.

# If the variable 'target' does not exist, read in the data and perform all of the transformations.
# This is done because reading in the data (which is more than 100 MB) can take some time.
if (!exists ("target")) {
    # Read in the data file, identifying the ';' separator and the ? as NA.
    data <- read.table ('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = "?")
    as.Date (data$Date, "%d/%m/%y")  # Convert the Date column to a date
    target <- subset (data, (Date %in% c ('1/2/2007', '2/2/2007')))  # Get only the data for the dates we want
    datetime <- strptime (paste (target$Date, target$Time), "%d/%m/%Y %H:%M:%S")  # Create a datetime column
    target <- cbind (target, datetime)  # Add it as a column that can be plotted
}
