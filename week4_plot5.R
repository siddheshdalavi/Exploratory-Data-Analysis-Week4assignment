#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
#read the files
NEI<-readRDS( "D:/Users/sdalavi/Documents/summarySCC_PM25.rds")
SCC <- readRDS("D:/Users/sdalavi/Documents/Source_Classification_Code.rds")

#subset the data for baltimore city
balt<-subset(NEI,fips == "24510")

#subset SCC dataset with vehicle information.
vehicleMatches  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
subsetSCC <- SCC[vehicleMatches, ]
str(subsetSCC)

# merging dataframes
NEISCC <- merge(balt, subsetSCC, by="SCC")

# summing emission data per year per type
totalEmissions <- tapply(NEISCC$Emissions, NEISCC$year, sum)

# plotting
png(filename='D:/Users/sdalavi/Documents/week4_plot5.png',width=1000, height=480)

barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission from motor sources in Baltimore")
dev.off()