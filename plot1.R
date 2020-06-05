
#Reading data in to R, subsetting by date, and converting the dates
household_power_full<-read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = F, comment.char="")
household_power<-subset(household_power_full, Date %in% c("1/2/2007", "2/2/2007"))
household_power$Date<-as.Date(household_power$Date, format="%d/%m/%y")

#Plot 1: histogram of Global Active Power
png("plot1.png", width=480, height=480)
hist(household_power$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()

