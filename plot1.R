# read the raw table and limit to 2 days
variable.class<-c(rep('character',2),rep('numeric',7))
power.consumption<-read.table('/Users/muthukumarlakshminarayanan/ExData_Plotting1/household_power_consumption.txt',header=TRUE,sep=';',na.strings='?',colClasses=variable.class)
power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
# clean up the variable names and convert date/time fields
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity','SubMetering1','SubMetering2','SubMetering3')
colnames(power.consumption)<-cols
power.consumption$DateTime<-strptime(paste(as.Date(power.consumption$Date),power.consumption$Time),"%Y-%m-%d %H:%M:%S")
power.consumption<-power.consumption[,c(10,3:9)]
# write a clean data set to the directory
# write.table(power.consumption,file='/Users/muthukumarlakshminarayanan/ExData_Plotting1/power_consumption.txt',sep='|',row.names=FALSE)
# open device
png(filename='/Users/muthukumarlakshminarayanan/ExData_Plotting1/plot1.png',width=480,height=480,units='px')
# plot data
hist(power.consumption$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
# Turn off device
x<-dev.off()