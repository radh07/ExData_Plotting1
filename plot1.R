
# Read the data from a file in working directory into R
data<-read.csv(file="household_power_consumption.txt", header=TRUE,sep=";",colClasses="character")

# Grab the data for the two dates of interest
relData<-subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Open a png device
png(filename="plot1.png", width=480, height=480)

# Create the histogram for Global Active Power
hist(as.numeric(relData$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

# Close the graphics device
dev.off()