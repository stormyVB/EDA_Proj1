##Exploratory Data Analysis 2015, Project 1
##plot2.R


##Plotting script no. 2 of 4 required by project

##Uses data on Household Power Consumption to explore how
##household energy usage varies over a 2-day period in February, 2007
##01/02/2007 through 02/02/2007
## Source:  UC Irvine Machine Learning Repository, data set provided by course
##Dataset spans much larger time period, so only relevant data is used for this assignment.

##Assumes data_file is unzipped already, located in current working directory
##and is called "household_power_consumption.txt"

##Assumes these packages are installed:  dplyr, lubridate

##Plot 2 - basic line graph of Global Active Power as a function of Date-Time
##Save as png file called "plot2.png"
##-------------------------------------------------
data_file<-"household_power_consumption.txt"

##Read in the data from rows 65,000 through 70,000
##corresponds to dates 03/1/2007 through 3/2/2007, which will include a complete
##set of data for the target dates, 01/02/2007 through 02/02/2007
##Then, get the header names and assign them to the data
test_data<-read.table(data_file,header=FALSE,sep=";",nrows=5000, skip=65000)
data_head<-read.table(data_file,header=TRUE,sep=";",nrows=1)
names(test_data)<-names(data_head)
test_data$Date<-as.Date(test_data$Date,"%d/%m/%Y")

##subset data to be between the Feb 1- Feb 2, 2007
start_date<-as.Date("01Feb2007","%d%b%Y")
end_date<-as.Date("02Feb2007","%d%b%Y")
td<-subset(test_data,Date>=start_date & Date<=end_date)

##Plot 2 - basic line graph of Global Active Power as a function of Date-Time
##Add a column that combines the date and time using dplyr and lubridate libraries
##Save as png file called "plot2.png"
library(lubridate)
library(dplyr)
td2<-mutate(td,DateTime=paste(Date,Time, sep=""))
td2$DateTime<-ymd_hms(td2$DateTime)

plot(td2$DateTime,td2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,'plot2.png')
dev.off()

