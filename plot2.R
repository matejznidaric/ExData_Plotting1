
# download and unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="data.zip")
unzip("data.zip")

# load data
newData2 <- read.table("household_power_consumption.txt", 
                      header=TRUE, 
                      sep=";", 
                      dec = ".", 
                      na.strings="?", 
                      stringsAsFactors=FALSE)

# create a subset of data and add dateTime column
newData2 <- newData2[newData2$Date == "1/2/2007" | newData2$Date == "2/2/2007", ]
newData2$datetime <- strptime(paste(newData2$Date, newData2$Time), format="%d/%m/%Y %T")

# create a png image
png("plot2.png",
    width=480,
    height=480,
    units="px", 
    pointsize = 12)

# build plot
plot(x=newData2$datetime, 
     y=newData2$Global_active_power,
     type = "l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")

# finish writing image
dev.off()

