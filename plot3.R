
# download and unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="data.zip")
unzip("data.zip")

# load data
newData3 <- read.table("household_power_consumption.txt", 
                       header=TRUE, 
                       sep=";", 
                       dec = ".", 
                       na.strings="?", 
                       stringsAsFactors=FALSE)

# create a subset of data and add dateTime column
newData3 <- newData3[newData3$Date == "1/2/2007" | newData3$Date == "2/2/2007", ]
newData3$datetime <- strptime(paste(newData3$Date, newData3$Time), format="%d/%m/%Y %T")

# create a png image
png("plot3.png",
    width=480,
    height=480,
    units="px", 
    pointsize = 12)

# build plot
plot(x=newData3$datetime, 
     y=newData3$Sub_metering_1,
     type = "l", 
     ylab="Energy sub metering", 
     xlab="")
lines(x=newData3$datetime,
      y=newData3$Sub_metering_2,
      col="red")
lines(x=newData3$datetime,
      y=newData3$Sub_metering_3,
      col="blue")
legend('topright', 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), 
       lty=1)

# finish writing image
dev.off()

