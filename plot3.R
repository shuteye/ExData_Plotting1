## 5 - EDA : project 1 ##
# Plot 3 - Energy v Date (time) #


# download file #
u<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(u, destfile="master_zp.zip",mode="wb")

# unpack zip
uu<-unzip(zipfile="master_zp.zip")


data<-read.table(file="household_power_consumption.txt",sep=";",
                 header=T,na.strings="?")
data1<-subset(data, as.Date(as.character(Date),format="%d/%m/%Y")>=as.Date("01/02/2007",format="%d/%m/%Y") 
              & as.Date(as.character(Date),format="%d/%m/%Y")<=as.Date("02/02/2007",format="%d/%m/%Y"))

# Plot and draw to png file in working directory

png(file="plot3.png",width=480,height=480, units="px")

data1$dd<-strptime(paste(data1$Date,data1$Time),format="%d/%m/%Y %H:%M:%S",tz="")

dates<-seq(from=as.POSIXct(data1$dd[1],format="%d/%m/%Y %H:%M:%S"),by="days",length=3)

with(data1,plot(x=dd,y=Sub_metering_1,
                col="black", type="l", xlab="",
                ylab="Energy sub metering", lwd=1, xaxt="n"
))
with(data1,points(y=Sub_metering_2,x=dd,col="red",type="l"))
with(data1,points(y=Sub_metering_3,x=dd,col="blue",type="l"))
legend("topright",legend=names(data1[,7:9]),col=c("black","red","blue"),lwd=1)

axis.POSIXct(side=1,at=dates,format="%a")
dev.off()
