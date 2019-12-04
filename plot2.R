#### Loading data ####


path = file.choose()
path
data = read.table(path, header = TRUE,sep=";")
data = subset(data, data$Date == "1/2/2007" | data$Date =="2/2/2007")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data[1:1440,"Time"] <- format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


## Plot 2. graph ## 
png(file = "plot2.png", bg = "transparent", width = 480, height = 480, units = "px")
plot(data$Time, as.numeric(as.character( data$Global_active_power)), type = "l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

