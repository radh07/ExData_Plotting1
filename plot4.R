# Read the data into R
data<-read.csv(file="household_power_consumption.txt", header=TRUE,sep=";",colClasses="character")

# Grab the data for the two dates of interest
relData<-subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Combine the Date and Time columns into a single time object using as.POSIXct
timeobj <- as.POSIXct(paste(as.Date(relData$Date,"%d/%m/%Y"), relData$Time), format="%Y-%m-%d %H:%M:%S")

# Open a png device
png(filename="plot4.png", width=480, height=480)

# Create plot window for 4 graphs in a single plot
par(mfrow=c(2,2))

# Plot a line graph (denoted by type="l") with time on the X-axis and Global Active Power on the Y-axis
plot(timeobj, relData$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power")

# Plot a line graph (denoted by type="l") with time on the X-axis and Voltage on the Y-axis
plot(timeobj, relData$Voltage, type="l", main="", xlab="datetime", ylab="Voltage")

# Plot a line graph (denoted by type="l") with 3 lines depicting
# Sub_metering_1, Sub_metering_2, and Sub_metering_3 on the Y-axis
# and time on the X-axis  
plot(timeobj, relData$Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering")
lines(timeobj, relData$Sub_metering_2, type="l", main="", col="red")
lines(timeobj, relData$Sub_metering_3, type="l", main="", col="blue")

# Add the legend at the top right corner with line symbols in 
# appropriate colors, corresponding text, no box around legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col=c("black","red","blue"),bty="n")

# Plot a line graph (denoted by type="l") with time on the X-axis and Voltage on the Y-axis
plot(timeobj, relData$Global_reactive_power, type="l", main="", xlab="datetime", ylab="Global_reactive_power")

# Close the graphics device
dev.off()
