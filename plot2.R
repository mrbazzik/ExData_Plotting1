Sys.setlocale("LC_TIME", "English")
## reading and preparing data

df<-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
df$DateR<-as.Date(df$Date,"%d/%m/%Y")
df<-subset(df, DateR==as.Date("01-02-2007","%d-%m-%Y") | DateR==as.Date("02-02-2007","%d-%m-%Y"))
df$DateTime<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
df$Global_active_power<-as.numeric(df$Global_active_power)

##plotting 
par(mfcol=c(1,1))
with(df, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
