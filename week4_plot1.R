#read the files
NEI<-readRDS( "D:/Users/sdalavi/Documents/summarySCC_PM25.rds")
SCC <- readRDS("D:/Users/sdalavi/Documents/Source_Classification_Code.rds")

#check the structure of files
str(NEI)
str(SCC)

#sums up emissions per year
totalEmissions <- tapply(NEI$Emissions/1000, NEI$year, sum)
totalEmissions

#base plot with 'total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008'
png(filename='D:/Users/sdalavi/Documents/week4_plot1.png',width=1000, height=480)
barplot(totalEmissions,xlab="Years",ylab="Total Emissions(ton)",main="Total Emissions per year")
dev.off()

