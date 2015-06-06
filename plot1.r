# Read the raw data into R
df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE)

# Convert the Date column to R Date format
date.vec<-as.Date(df$Date,format="%d/%m/%Y")

# Replace the Date column in the original data by a the R Date formatted vector
df$Date<-date.vec

# Subset the original data between 2007-02-01 and 2007-02-02
df2<-subset(df,(Date >= as.Date("2007-02-01")) & (Date <=as.Date("2007-02-02")))

# open png device
png(filename="plot1.png",width=480,height=480)

# Plotting histogram to device 
hist(as.numeric(df2$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# Closing device to write plot to file
dev.off()



