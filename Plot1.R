dir()

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds" )
names(NEI)
names(SCC)

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

aggregatedTotalYear <- aggregate(Emissions ~ year, NEI, sum)

png("Project.Plot1.png")
barplot(height = aggregatedTotalYear$Emissions, names.arg = aggregatedTotalYear$year, xlab="Years",
        ylab = expression("total PM"[2.5]*" emission at various years"))
        
dev.off()
