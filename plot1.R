##Exploratory Data Analysis 2015, Project 1
##plot1.R

##Plotting script no. 1 of 4 required by project

##Uses data on Household Power Consumption to explore how
##household energy usage varies over a 2-day period in February, 2007
##01/02/2007 through 02/02/2007
## Source:  UC Irvine Machine Learning Repository, data set provided by course
##Dataset spans much larger time period, so only relevant data is used for this assignment.

##Assumes data_file is unzipped already, located in current working directory
##and is called "household_power_consumption.txt"

##Plot 1 - Simple histogram using basic R plotting package
##Shows the frequency of Global Active Power 
##Save as png file called "plot1.png"
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

##Plot 1 - Simple histogram using basic plotting package
##Shows the frequency of Global Active Power 
##Save as png file called "plot1.png"
hist(td$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png,'plot1.png')
dev.off()
