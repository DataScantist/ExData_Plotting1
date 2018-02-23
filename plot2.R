## R Coursera Exploratory Data Anlaysis week 1
## Plot 2

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

#plot 2
png(filename = "plot2.png")
plot(data$datetime,data$Global_active_power, type = "l",ylab="Global active power (kilowatts)",xlab=" ")
dev.off()

