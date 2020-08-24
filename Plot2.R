#Plot2 
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds" )
summary(NEI)
summary(SCC)
str(NEI)
str(SCC)

subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalYear <- aggregate(Emissions ~ year, subsetNEI, sum)

png("Project.Plot2.png")

barplot(height = aggregatedTotalYear$Emissions, names.arg = aggregatedTotalYear$year,
        xlab = "Years", ylab = expression("total PM"[2.5]*" emission"), 
        main = expression("Total PM"[2.5]*" in the Baltimore City, MD emissions at various years"))
        
dev.off()
