# Read the raw data into R
df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE)

# Convert the Date column to R Date format
date.vec<-as.Date(df$Date,format="%d/%m/%Y")

# Replace the Date column in the original data by the R Date formatted vector
df$Date<-date.vec

# Subset the original data between 2007-02-01 and 2007-02-02
df2<-subset(df,(Date >= as.Date("2007-02-01")) & (Date <=as.Date("2007-02-02")))

# Join date an time to create a single column
df2$date_time<-paste(as.character(df2$Date),df2$Time,sep=" ")

# Convert the new date_time column to POSIX date and time format
df2$date_time<-as.POSIXct(df2$date_time,format="%Y-%m-%d %H:%M:%S")

# open png device
png(filename="plot2.png",width=480,height=480)

# Plotting Global active power to device 
plot(df2$date_time,as.numeric(df2$Global_active_power),ylab="Global Active Power (kilowatts)",ty="l",xlab="")

# Closing device to write plot to file
dev.off()



