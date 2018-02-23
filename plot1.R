## R Coursera Exploratory Data Anlaysis week 1
## Plot 1

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


#plot 1
png(filename = "plot1.png")
hist(data$Global_active_power,xlab="Global active power (kilowatts)",col="red",main="Global Active Power")
dev.off()

