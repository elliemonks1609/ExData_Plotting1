#Reading data in to R, subsetting by date, and converting the dates
household_power_full<-read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = F, comment.char="")
household_power<-subset(household_power_full, Date %in% c("1/2/2007", "2/2/2007"))
household_power$Date<-as.Date(household_power$Date, format="%d/%m/%y")

#Merge date and time variables in to new variable (datetime)
datetime<-paste(as.Date(household_power$Date), household_power$Time)
household_power$Datetime<-as.POSIXct(datetime)

#Plot Global Active Power by Date and Sub Metering
png("plot3.png", width=480, height=480)
with(household_power, plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)"), xlab="")
with(household_power, lines(Sub_metering_2~Datetime, col="Red"))
with(household_power, lines(Sub_metering_3~Datetime, col="Blue"))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()