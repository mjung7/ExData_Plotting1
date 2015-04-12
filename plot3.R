library(lubridate)
library(data.table)
library(dplyr)

df<-fread("./household_power_consumption.txt", skip="1/2/2007",nrows=2880, colClass="numeric")

df$DateTime <-dmy_hms(paste(df$V1,df$V2))
df$Global_active_power <- df$V3
df$Global_reactive_power <- df$V4
df$Voltage<-df$V5
df$Global_intensity <- df$V6
df$Sub_meeting_1<-df$V7
df$Sub_meeting_2<-df$V8
df$Sub_meeting_3<-df$V9
df<-select(df,DateTime,Global_active_power, Global_reactive_power, Voltage, Global_intensity, Sub_meeting_1, Sub_meeting_2, Sub_meeting_3)
library(lubridate)
library(data.table)
library(dplyr)

df<-fread("./household_power_consumption.txt", skip="1/2/2007",nrows=2880, colClass="numeric")

df$DateTime <-dmy_hms(paste(df$V1,df$V2))
df$Global_active_power <- df$V3
df$Global_reactive_power <- df$V4
df$Voltage<-df$V5
df$Global_intensity <- df$V6
df$Sub_meeting_1<-df$V7
df$Sub_meeting_2<-df$V8
df$Sub_meeting_3<-df$V9
df<-select(df,DateTime,Global_active_power, Global_reactive_power, Voltage, Global_intensity, Sub_meeting_1, Sub_meeting_2, Sub_meeting_3)

png(filename="plot3.png",width=480,height=480,units="px")

plot(df$DateTime,df$Sub_meeting_1,type="l", xlab="", ylab="Energy sub metering")
lines(df$DateTime,df$Sub_meeting_2,col="red")
lines(df$DateTime,df$Sub_meeting_3,col="blue")

legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
