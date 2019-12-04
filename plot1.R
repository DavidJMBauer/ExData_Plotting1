#### Loading data ####


path = file.choose()
path
data = read.table(path, header = TRUE,sep=";")
data = subset(data, data$Date == "1/2/2007" | data$Date =="2/2/2007")


### Plot the 1. graph ###
png(file = "plot1.png", bg = "transparent", width = 480, height = 480, units = "px")
hist(as.numeric(as.character( data$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
