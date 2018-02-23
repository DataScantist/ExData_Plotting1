## R Coursera Exploratory Data Anlaysis week 1
## Plot 3

#importing and reading data 
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "electric_pow.zip")
unzip("electric_pow.zip", exdir = "electric_pow")
data <- read.table("electric_pow/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#subsetting to the days we want
data <- subset(data,Date %in% c("1/2/2007","2/2/2007"))

#changing format of date and time variables
data$datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
head(data)

#plot 3
png(filename = "plot3.png")
plot(data$datetime,data$Sub_metering_1, type = "n",ylab="Energy sub metering",xlab=" ")
points(data$datetime,data$Sub_metering_1, type = "l")
points(data$datetime,data$Sub_metering_2, type = "l",col="red")
points(data$datetime,data$Sub_metering_3, type = "l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)


dev.off()

