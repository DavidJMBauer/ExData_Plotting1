#### Loading data ####


path = file.choose()
path
data = read.table(path, header = TRUE,sep=";")
data = subset(data, data$Date == "1/2/2007" | data$Date =="2/2/2007")


data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data[1:1440,"Time"] <- format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")



## Setting graph parameters
par(mfrow=c(2,2))


## Plot 4. graph ## 
png(file = "plot4.png", bg = "transparent", width = 480, height = 480, units = "px")

with(data,{
  plot(data$Time,as.numeric(as.character(data$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(data$Time,as.numeric(as.character(data$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(data$Time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(data,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(data$Time,as.numeric(as.character(data$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

dev.off()
