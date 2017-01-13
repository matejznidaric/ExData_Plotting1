# download and unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="data.zip")
unzip("data.zip")

# load data
newData <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

# set min and max data of our interest
minDate <- as.Date("01.02.2007 00:00", "%d.%m.%Y %H:%M")
maxDate <- as.Date("03.02.2007 00:00", "%d.%m.%Y %H:%M")

# convert to date format
newData$Date <- as.Date(newData$Date, format = "%d/%m/%Y")

# create a subset of data
newDataSubset <- newData[newData$Date >= minDate & newData$Date < maxDate,]

# remove Na values 
newDataSubset$Global_active_power <- gsub("?","",newDataSubset$Global_active_power)

# change to numeric data type
newDataSubset$Global_active_power <- as.numeric(newDataSubset$Global_active_power)

# create a png image
png("plot1.png",width=480,height=480,units="px", pointsize = 12)

# build plot
hist(newDataSubset$Global_active_power,
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency",
     col="red",
     axes = FALSE)

# creating axis
axis(1, at=seq(0, 6, by=2))
axis(2, at=seq(0, 1200, by=200))

# finish writing image
dev.off()

