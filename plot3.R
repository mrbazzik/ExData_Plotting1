Sys.setlocale("LC_TIME", "English")
## reading and preparing data

df<-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
df$DateR<-as.Date(df$Date,"%d/%m/%Y")
df<-subset(df, DateR==as.Date("01-02-2007","%d-%m-%Y") | DateR==as.Date("02-02-2007","%d-%m-%Y"))
df$DateTime<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")

df$Sub_metering_1<-as.numeric(df$Sub_metering_1)
df$Sub_metering_2<-as.numeric(df$Sub_metering_2)
df$Sub_metering_3<-as.numeric(df$Sub_metering_3)

##plotting 
par(mfcol=c(1,1))
with(df, {
    plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty="solid")
    })
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
