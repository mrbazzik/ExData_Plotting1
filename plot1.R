## reading and preparing data

df<-read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
df$Date<-as.Date(df$Date,"%d/%m/%Y")
df<-subset(df, Date==as.Date("01-02-2007","%d-%m-%Y") | Date==as.Date("02-02-2007","%d-%m-%Y"))
df$Global_active_power<-as.numeric(df$Global_active_power)

##plotting 
par(mfcol=c(1,1))
hist(df$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
