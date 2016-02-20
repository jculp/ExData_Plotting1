# Gets the data that we care about for 2/1/2007 and 2/2/2007.
d<-read.table("household_power_consumption.txt", skip=66637, nrow=2880, sep=";", na.strings="?")
h<-read.table("household_power_consumption.txt", nrow=1, sep=";", na.strings="?")
h<-sapply(h, as.character)
names(d)<-h; rm(h)
d$datetime<-strptime(paste(d$Date,d$Time),format="%d/%m/%Y %H:%M:%S")

# Creates and saves plot 2.
png("plot2.png", height=480, width=480)
with(d, plot(datetime, Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab=""))
dev.off()