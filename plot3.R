#### Loading data ####


path = file.choose()
path
data = read.table(path, header = TRUE,sep=";")
data = subset(data, data$Date == "1/2/2007" | data$Date =="2/2/2007")


data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data[1:1440,"Time"] <- format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")



## Plot 3. graph ## 
png(file = "plot3.png", bg = "transparent", width = 480, height = 480, units = "px")

plot(data$Time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(data,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
