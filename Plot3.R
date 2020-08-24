#Plot 3 
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

SCC <- readRDS("Source_Classification_Code.rds" )
str(NEI)
str(SCC)
summary(NEI)
summary(SCC)

library(ggplot2)

subsetNEI  <- NEI[NEI$fips=="24510", ]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

png("Project.Plot3.png", width = 480, height = 480)

g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() + xlab("Year") + ylab(expression("Total PM"[2.5]*" Emissions"))+
        ggtitle("Total Emissions in Baltimore City, Marylan (fips == 24510) from 1999 to 2008")
print(g)

dev.off()
