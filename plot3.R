# Gets the data that we care about for 2/1/2007 and 2/2/2007.
d<-read.table("household_power_consumption.txt", skip=66637, nrow=2880, sep=";", na.strings="?")
h<-read.table("household_power_consumption.txt", nrow=1, sep=";", na.strings="?")
h<-sapply(h, as.character)
names(d)<-h; rm(h)
d$datetime<-strptime(paste(d$Date,d$Time),format="%d/%m/%Y %H:%M:%S")

# Creates and saves plot 3.
png("plot3.png", height=480, width=480)
with(d, plot(datetime, Sub_metering_1, ylab="Energy sub metering", type="l", xlab=""))
with(d, lines(datetime, Sub_metering_2, col="red"))
with(d, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), lty=c(1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()