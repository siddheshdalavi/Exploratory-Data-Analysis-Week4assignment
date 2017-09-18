#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
#read the files
NEI<-readRDS( "D:/Users/sdalavi/Documents/summarySCC_PM25.rds")
SCC <- readRDS("D:/Users/sdalavi/Documents/Source_Classification_Code.rds")

#subet the NEI for Baltimore city
balt<-subset(NEI,fips == "24510")
str(balt)
data <- aggregate(Emissions ~ year + type, balt, sum)
str(data)

#use ggplot2 system to plot the systeem
png(filename='D:/Users/sdalavi/Documents/week4_plot3.png', width=1000, height=500, units='px')
g <- ggplot(data, aes(year, Emissions, color = type))
g + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions per type in Baltimore")

dev.off()