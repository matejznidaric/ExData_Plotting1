
# download and unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="data.zip")
unzip("data.zip")

# load data
newData4 <- read.table("household_power_consumption.txt", 
                       header=TRUE, 
                       sep=";", 
                       dec = ".", 
                       na.strings="?", 
                       stringsAsFactors=FALSE)

# create a subset of data and add dateTime column
newData4 <- newData4[newData4$Date == "1/2/2007" | newData4$Date == "2/2/2007", ]
newData4$datetime <- strptime(paste(newData4$Date, newData4$Time), format="%d/%m/%Y %T")

# set number of plots
par(mfrow=c(2,2))

# create a png image
png("plot4.png",
    width=480,
    height=480,
    units="px", 
    pointsize = 12)

# build plot 1
plot(x=newData4$datetime, 
     y=newData4$Global_active_power,
     type = "l", 
     ylab="Global Activ Power", 
     xlab="")

# build plot 2
plot(x=newData4$datetime, 
     y=newData4$Voltage,
     type = "l", 
     ylab="Voltage", 
     xlab="datetime")

# build plot 3
plot(x=newData4$datetime, 
     y=newData4$Sub_metering_1,
     type = "l", 
     ylab="Energy sub metering", 
     xlab="")
lines(x=newData4$datetime,
      y=newData4$Sub_metering_2,
      col="red")
lines(x=newData4$datetime,
      y=newData4$Sub_metering_3,
      col="blue")
legend('topright', 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), 
       lty=1)

# build plot 4
plot(x=newData4$datetime, 
     y=newData4$Global_reactive_power,
     type = "l", 
     ylab="Global Activ Power", 
     xlab="datetime")

# finish writing image
dev.off()

