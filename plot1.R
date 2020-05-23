install.packages("dplyr")
file=read.csv("household_power_consumption.txt",sep=";",na.strings = "?")
file=na.omit(file)
file$Date=as.Date(as.character(file$Date),format = "%d/%m/%Y")
plots=filter(file, Date >= "2007-02-01" & Date <= "2007-02-02")
hist(plots$Global_active_power,col = "red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

