#Reading the data
h_p_c <- read.table("household_power_consumption.txt", sep=";",dec=".",header=TRUE,stringsAsFactors=FALSE)
h_p_c_sub = subset(h_p_c, as.Date(Date, "%d/%m/%Y") =='2007-02-01'|as.Date(Date, "%d/%m/%Y") == '2007-02-02')
#Set Graphic device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
#set bg
par(bg="transparent")
#Plotting the histogram
hist(as.numeric(h_p_c_sub$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
#closing the Graphic device
dev.off()