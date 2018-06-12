## load data
hpc <- read.csv("~/R projects/coursera/data/household_power_consumption.txt", 
                header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, 
                stringsAsFactors=F, comment.char="", quote='\"')

hpc1 <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))

hpc1$Date <- as.Date(hpc1$Date, format="%d/%m/%Y")




##make plot1
hist(hpc1$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col="red", main="Global Active Power")


##save png
png("plot1.png", width=480, height=480)
dev.off()