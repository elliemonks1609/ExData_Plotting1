#Reading data in to R, subsetting by date, and converting the dates
household_power_full<-read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = F, comment.char="")
household_power<-subset(household_power_full, Date %in% c("1/2/2007", "2/2/2007"))
household_power$Date<-as.Date(household_power$Date, format="%d/%m/%y")

#Merge date and time variables in to new variable (datetime)
datetime<-paste(as.Date(household_power$Date), household_power$Time)
household_power$Datetime<-as.POSIXct(datetime)

#Plot four seperate plots in one
png("plot4.png", width=480, height=480)
par(mfrow=c(2, 2), mar=c(4, 4, 2, 1), oma=c(0,0,2,0))
with(household_power, plot(Global_active_power~Datetime), type="l", xlab="", ylab="Global Active Power")
with(household_power, plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab=""))
with(household_power, plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)"), xlab="")
with(household_power, lines(Sub_metering_2~Datetime, col="Red"))
with(household_power, lines(Sub_metering_3~Datetime, col="Blue"))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(household_power, plot(Global_reactive_power~Datetime), type="l", ylab="Global Reactive Power (kilowatts)", xlab="")
dev.off()