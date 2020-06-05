
#Reading data in to R, subsetting by date, and converting the dates
household_power_full<-read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors = F, comment.char="")
household_power<-subset(household_power_full, Date %in% c("1/2/2007", "2/2/2007"))
household_power$Date<-as.Date(household_power$Date, format="%d/%m/%y")

#Merge date and time variables in to new variable (datetime)
datetime<-paste(as.Date(household_power$Date), household_power$Time)
household_power$datetime<-as.POSIXct(datetime)

#Plotting Global Active Power by time
png("plot2.png", width=480, height=480)
with(household_power, plot(Global_active_power~datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()