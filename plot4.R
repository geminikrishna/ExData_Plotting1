install.packages("dplyr")
file=read.csv("C:\\Users\\chava\\OneDrive\\Desktop\\household_power_consumption.txt",sep=";",na.strings = "?")
file=na.omit(file)
file$Date=as.Date(as.character(file$Date),format = "%d/%m/%Y")
plots=filter(file, Date >= "2007-02-01" & Date <= "2007-02-02")
datetime=strptime(paste(plots$Date,plots$Time),format =  "%Y-%m-%d %H:%M:%S" )
par("mfrow"=c(2,2) ,"mar"=c(4.5,5,2,2))

plot(datetime,plots$Global_active_power,type = "l",ylab="Global Active Power (kilowatts)",, xlab="")
plot(datetime,plots$Voltage,type="l",ylab = "Voltage")
plot(datetime,plots$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="",col="black")
points(datetime,plots$Sub_metering_2,type="l",col="red")
points(datetime,plots$Sub_metering_3,type="l",col="blue")
legend("topright",lwd=1,col =c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(datetime,plots$Global_reactive_power,ylab="Global_reactive_power",type="l")
  
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
