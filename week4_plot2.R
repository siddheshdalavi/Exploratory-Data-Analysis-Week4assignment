#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#read the files
NEI<-readRDS( "D:/Users/sdalavi/Documents/summarySCC_PM25.rds")
SCC <- readRDS("D:/Users/sdalavi/Documents/Source_Classification_Code.rds")

#subet the NEI for Baltimore city
balt<-subset(NEI,fips == "24510")
str(balt) #look at the Fips all are 24510, hence belong to correct city(baltimore) data 

#again summing up the emission data per year using balt
totalEmissions<-tapply(balt$Emissions,balt$year,sum)
totalEmissions

#now plot the base graph
png(filename='D:/Users/sdalavi/Documents/week4_plot2.png',width=1000, height=480)
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission per year in Baltimore")
dev.off()

