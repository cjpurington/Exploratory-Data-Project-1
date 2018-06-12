## load data
hpc <- read.csv("~/R projects/coursera/data/household_power_consumption.txt", 
                header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, 
                stringsAsFactors=F, comment.char="", quote='\"')

hpc1 <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))

hpc1$Date <- as.Date(hpc1$Date, format="%d/%m/%Y")

dt <- paste(as.Date(hpc1$Date), hpc1$Time)

hpc1$dt <- as.POSIXct(dt)

## make plot2
with(hpc1,{
  plot(Global_active_power~dt, type="l", ylab="Global Active Power (kilowatts)")
})

## make png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()