## load data
hpc <- read.csv("~/R projects/coursera/data/household_power_consumption.txt", 
                header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, 
                stringsAsFactors=F, comment.char="", quote='\"')

hpc1 <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))

hpc1$Date <- as.Date(hpc1$Date, format="%d/%m/%Y")

dt <- paste(as.Date(hpc1$Date), hpc1$Time)

hpc1$dt <- as.POSIXct(dt)


## make plot3
with(hpc1,{
  plot(Sub_metering_1~dt, type="l",ylab="Energy sub metering")
  lines(Sub_metering_2~dt, col="Red")
  lines(Sub_metering_3~dt, col="Blue")
})

legend("topright", col=c("black","red","blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## save png
dev.copy(png, file="plot3.png", height=480, width=800)
dev.off()