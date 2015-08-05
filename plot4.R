Sys.setlocale("LC_TIME", "English")
## reading and preparing data

df<-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
df$DateR<-as.Date(df$Date,"%d/%m/%Y")
df<-subset(df, DateR==as.Date("01-02-2007","%d-%m-%Y") | DateR==as.Date("02-02-2007","%d-%m-%Y"))
df$DateTime<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")

df$Global_active_power<-as.numeric(df$Global_active_power)
df$Global_reactive_power<-as.numeric(df$Global_reactive_power)
df$Sub_metering_1<-as.numeric(df$Sub_metering_1)
df$Sub_metering_2<-as.numeric(df$Sub_metering_2)
df$Sub_metering_3<-as.numeric(df$Sub_metering_3)
df$Voltage<-as.numeric(df$Voltage)

##plotting 
par(mfcol=c(2,2))
with(df, {
    ## 1
    plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
    
    ##2
    plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty="solid", bty="n")
    
    ## 3
    plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    ## 3
    plot(DateTime, Global_reactive_power, type="l", xlab="datetime")
    })
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
