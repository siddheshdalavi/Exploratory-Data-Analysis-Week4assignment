#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#read the files
NEI<-readRDS( "D:/Users/sdalavi/Documents/summarySCC_PM25.rds")
SCC <- readRDS("D:/Users/sdalavi/Documents/Source_Classification_Code.rds")

# subsetting SCC with coal values
str(SCC)
coalMatches  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
subsetSCC <- SCC[coalMatches, ]
str(subsetSCC)

#now we have to merge the 2 datasets viz - 'NEI' & 'subsetSCC' with common key "SCC"
NEISCC <- merge(NEI, subsetSCC, by="SCC")

#now get the totalemission value using new dataset
totalEmissions<-tapply(NEISCC$Emissions/1000,NEISCC$year,sum)
totalEmissions

#now plot this information
png(filename='D:/Users/sdalavi/Documents/week4_plot4.png',width=1000, height=480)
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission from coal sources")
dev.off()
