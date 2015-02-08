# read the raw table and limit to 2 days
variable.class<-c(rep('character',2),rep('numeric',7))
power.consumption<-read.table('/Users/muthukumarlakshminarayanan/ExData_Plotting1/household_power_consumption.txt',header=TRUE,sep=';',na.strings='?',colClasses=variable.class)
power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
# clean up the variable names and convert date/time fields
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity','SubMetering1','SubMetering2','SubMetering3')
colnames(power.consumption)<-cols
power.consumption$DateTime<-strptime(paste(as.Date(power.consumption$Date,"%d/%m/%Y"),power.consumption$Time),"%Y-%m-%d %H:%M:%S")
power.consumption<-power.consumption[,c(10,3:9)]
# write a clean data set to the directory
#write.table(power.consumption,file='/Users/muthukumarlakshminarayanan/ExData_Plotting1/power_consumption.txt',sep='|',row.names=FALSE)
# open device
png(filename='/Users/muthukumarlakshminarayanan/ExData_Plotting1/plot4.png',width=480,height=480,units='px')
# plot data
par(mfrow=c(2,2))
# plot data 1
plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab='Global Active Power',xlab='',type='l')
# plot data 2
plot(power.consumption$DateTime,power.consumption$Voltage,xlab='datetime',ylab='Voltage',type='l')
# plot data 3
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(power.consumption$DateTime,power.consumption$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(power.consumption$DateTime,power.consumption$SubMetering2,col=lncol[2])
lines(power.consumption$DateTime,power.consumption$SubMetering3,col=lncol[3])
# plot data 4
plot(power.consumption$DateTime,power.consumption$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')
# Turn off device
x<-dev.off()