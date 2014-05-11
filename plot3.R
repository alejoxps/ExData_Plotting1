#reading data
h_p_c <- read.table("household_power_consumption.txt", sep=";",dec=".",header=TRUE,stringsAsFactors=FALSE)
h_p_c_sub = subset(h_p_c, as.Date(Date, "%d/%m/%Y") =='2007-02-01'|as.Date(Date, "%d/%m/%Y") == '2007-02-02')
#Set Graphic device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
#background
par(bg="transparent")
#datetime var
dat<-paste(h_p_c_sub$Date,h_p_c_sub$Time)
#base plot
plot(strptime(dat ,format="%d/%m/%Y %H:%M:%S"),as.numeric(h_p_c_sub$Sub_metering_1),type="n",xlab="",ylab="Energy sub metering",main="",col="black")
#plotting lines
lines(strptime(dat ,format="%d/%m/%Y %H:%M:%S"),as.numeric(h_p_c_sub$Sub_metering_1),type="l",col="black")
lines(strptime(dat ,format="%d/%m/%Y %H:%M:%S"),as.numeric(h_p_c_sub$Sub_metering_2),type="l",col="red")
lines(strptime(dat ,format="%d/%m/%Y %H:%M:%S"),as.numeric(h_p_c_sub$Sub_metering_3),type="l",col="blue")
#apply legend
legend("topright",lwd=c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#closing Graphic device
dev.off()