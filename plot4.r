# Read the raw data into R
df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE)

# Convert the Date column to R Date format
date.vec<-as.Date(df$Date,format="%d/%m/%Y")

# Replace the Date column in the original data by a the R Date formatted vector
df$Date<-date.vec

# Subset the original data between 2007-02-01 and 2007-02-02
df2<-subset(df,(Date >= as.Date("2007-02-01")) & (Date <=as.Date("2007-02-02")))

# Join date an time to create a single column
df2$date_time<-paste(as.character(df2$Date),df2$Time,sep="")

# Convert the new date_time column to R date and time format
df2$date_time<-as.POSIXct(df2$date_time,format="%Y-%m-%d %H:%M:%S")

# open png device
png(filename="plot4.png",width=480,height=480)

# Set plotting area to 2 rows and 2 columns
par(mfrow=c(2,2))


# Plotting histogram to device
hist(as.numeric(df2$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# Plotting Voltage
plot(df2$date_time,df2$Voltage,ty="l",xlab="datetime",ylab="Voltage")

# Plotting Energy sub metering

plot(df2$date_time,as.numeric(df2$Sub_metering_1),ylab="Global Active Power (kilowatts)",ty="l",xlab="")
lines(df2$date_time,as.numeric(df2$Sub_metering_2),col="red")
lines(df2$date_time,as.numeric(df2$Sub_metering_3),col="blue")

# Drawing legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),
       lty=c(1,1,1),box.lty=0)

# Plotting global reactive power
plot(df2$date_time,df2$Global_reactive_power,ty="l",xlab="datetime",ylab="Global_reactive_power")

# Closing device to write plot to file
dev.off()

# Reseting default plotting parameters
par()




