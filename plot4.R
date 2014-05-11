#reading data
h_p_c <- read.csv("household_power_consumption.txt", sep=";")
h_p_c_sub = subset(h_p_c, as.Date(Date, "%d/%m/%Y") =='2007-02-01'|as.Date(Date, "%d/%m/%Y") == '2007-02-02')
#Set Graphic device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
#Background
par(bg="transparent")
#layout
par(mfrow=c(2,2))
#datetime var
dt<-paste(h_p_c_sub$"Date",h_p_c_sub$"Time")

#First Graph
plot(strptime(dat ,format="%d/%m/%Y %H:%M:%S"),h_p_c_sub$"Global.active.power",type="l",xlab="",ylab="Global Active Power",main="")
#Second Graph
plot(strptime(dat ,format="%d/%m/%Y %H:%M:%S"),h_p_c_sub$"Voltage",type="l",xlab="datetime",ylab="Voltage",main="")
#Third Graph
plot(strptime(dat ,format="%d/%m/%Y %H:%M:%S"),h_p_c_sub$"Sub.metering.1",type="n",xlab="",ylab="Energy sub metering",main="",col="black")
lines(strptime(dat ,format="%d/%m/%Y %H:%M:%S"),h_p_c_sub$"Sub.metering.1",type="l",col="black")
lines(strptime(dat ,format="%d/%m/%Y %H:%M:%S"),h_p_c_sub$"Sub.metering.2",type="l",col="red")
lines(strptime(dat ,format="%d/%m/%Y %H:%M:%S"),h_p_c_sub$"Sub.metering.3",type="l",col="blue")
legend("topright",lwd=c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#Fourth Graph
plot(strptime(dat ,format="%d/%m/%Y %H:%M:%S"),h_p_c_sub$"Global.reactive.power",type="l",xlab="datetime",ylab="Global_reactive_power",main=""
#Closing the Graphic device
dev.off()