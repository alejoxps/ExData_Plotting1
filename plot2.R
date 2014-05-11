#read the data
h_p_c <- read.csv("household_power_consumption.txt", sep=";")
h_p_c_sub = subset(h_p_c, as.Date(Date, "%d/%m/%Y") =='2007-02-01'|as.Date(Date, "%d/%m/%Y") == '2007-02-02')
#Set Graphic device
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
#set bg
par(bg="transparent")
#datetime var
dt<-paste(h_p_c_sub$"Date",h_p_c_sub$"Time")
#plotting
plot(strptime(dt ,format="%d/%m/%Y %H:%M:%S"),h_p_c_sub$"Global.active.power",type="l",xlab="",ylab="Global Active Power (kilowatts)",main="")
#Close Graphic device
dev.off()