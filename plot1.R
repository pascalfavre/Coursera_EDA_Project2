##########################################################################################
## Author:  Pascal Favre
## Date:    17.09.2014
## Goal:    Create a plot based on given rds file showing the evolution of PM2.5 in the 
##          US.
##########################################################################################

#Read sourcefiles
SCC <- readRDS('./data/Source_Classification_Code.rds')
NEI <- readRDS('./data/summarySCC_PM25.rds')

#Calculate the total emissions per year
totalEmissions <- aggregate(NEI$Emissions, list(NEI$year), FUN = "sum")

#Create a png file
png(filename="./plots/plot1.png", width=480, height=480, units = "px")

#Plot the graph based on base graph system
plot(totalEmissions, type = "l", xlab = "Year",
     main = expression("Total Emissions of PM" [2.5]*" in the United States from 1999 to 2008"), 
     ylab = expression('Total PM'[2.5]*" Emission"))

#Close printing device
dev.off()
