## 5 - EDA : project 1 ##
# Plot 1 - active power histogram #


# download file #
u<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(u, destfile="master_zp.zip",mode="wb")

# unpack zip
uu<-unzip(zipfile="master_zp.zip")


data<-read.table(file="household_power_consumption.txt",sep=";",
                    header=T,na.strings="?")
data1<-subset(data, as.Date(as.character(Date),format="%d/%m/%Y")>=as.Date("01/02/2007",format="%d/%m/%Y") 
        & as.Date(as.character(Date),format="%d/%m/%Y")<=as.Date("02/02/2007",format="%d/%m/%Y"))

# Plot 1 and draw to png file in working directory

png(file="plot1.png",width=480,height=480, units="px")

with(data1,hist(Global_active_power,breaks=14,col="firebrick2",freq=T,
                xlab="Global Acitve Power (kilowatts)",ylab="Frequency",
                main="Global Active Power"))

dev.off()