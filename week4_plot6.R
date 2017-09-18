#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
#in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in 
#motor vehicle emissions?

#read the files
NEI<-readRDS( "D:/Users/sdalavi/Documents/summarySCC_PM25.rds")
SCC <- readRDS("D:/Users/sdalavi/Documents/Source_Classification_Code.rds")

#subset the data for baltimore city
balt<-subset(NEI,fips == "24510")

#subset the data for Log angeles 
los <- subset(NEI, fips == "06037")

#subset SCC dataset with vehicle information.
vehicleMatches  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
subsetSCC <- SCC[vehicleMatches, ]
str(subsetSCC)

#Now merge the Baltimore city data with Subset of SCC
databalt<-merge(balt,subsetSCC,by="SCC")

#adding another column to datset
databalt$city <- "Baltimore City"
head(databalt)

#same way for los angeles
datalos<-merge(los,subsetSCC,by="SCC")

#adding another column to datset
datalos$city <- "Los Angeles County"
head(datalos)

#combine to datasets
data<-rbind(databalt,datalos)
head(data)

# summing emission data per year per type
data <- aggregate(Emissions ~ year + city, data, sum)
head(data)

# plotting

png(filename='D:/Users/sdalavi/Documents/week4_plot6.png',width=1000, height=300)

g <- ggplot(data, aes(year, Emissions, color = city))
g + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions from motor vehicle sources in Baltimore and Los Angeles")

dev.off()