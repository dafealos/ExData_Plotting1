power_con <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_con) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower_con <- subset(power_con,power_con$Date=="1/2/2007" | power_con$Date =="2/2/2007")

# Transforming Date and Time variables from characters to objects of type Date and POSIXlt alike:
subpower_con$Date <- as.Date(subpower_con$Date, format="%d/%m/%Y")
subpower_con$Time <- strptime(subpower_con$Time, format="%H:%M:%S")
subpower_con[1:1440,"Time"] <- format(subpower_con[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower_con[1441:2880,"Time"] <- format(subpower_con[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


png("plot2.png", width=480, height=480,units="px")

plot(subpower_con$Time,as.numeric(as.character(subpower_con$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

dev.off()


