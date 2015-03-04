
# Read the data from a file in working directory into R
data<-read.csv(file="household_power_consumption.txt", header=TRUE,sep=";",colClasses="character")

# Grab the data for the two dates of interest
relData<-subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Open a png device
png(filename="plot2.png", width=480, height=480)

# Combine the Date and Time columns into a single time object using as.POSIXct
# Plot a line graph (denoted by type="l") with time on the X-axis and Global Active Power on the Y-axis
plot(as.POSIXct(paste(as.Date(relData$Date,"%d/%m/%Y"), relData$Time), format="%Y-%m-%d %H:%M:%S"),
     relData$Global_active_power,type="l",main="",xlab="",
     ylab="Global Active Power (kilowatts)")

# Copy it to a png file and close the graphics device
#dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()