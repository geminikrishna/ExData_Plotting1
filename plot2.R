install.packages("dplyr")
file=read.csv("household_power_consumption.txt",sep=";",na.strings = "?")
file=na.omit(file)
file$Date=as.Date(as.character(file$Date),format = "%d/%m/%Y")
plots=filter(file, Date >= "2007-02-01" & Date <= "2007-02-02")
datetime=strptime(paste(plots$Date,plots$Time),format =  "%Y-%m-%d %H:%M:%S" )
plot(datetime,plots$Global_active_power,type = "l")

