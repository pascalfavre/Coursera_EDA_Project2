##########################################################################################
## Author:  Pascal Favre
## Date:    17.09.2014
## Goal:    Create a plot based on given rds file showing how coal combustion-related 
##          sources changed from 1999 to 2008 in the US
##########################################################################################

#Activate necessary libraries
library(ggplot2)

#Read sourcefiles
SCC <- readRDS('./data/Source_Classification_Code.rds')
NEI <- readRDS('./data/summarySCC_PM25.rds')

#Find coal combustion-related information
#Check if "coal" exists in EI.Sector and subset datasets in order to get only coal data
coalRelated <- grep("coal", SCC$EI.Sector, ignore.case = T)
coalLines <- SCC[coalRelated, ]
coalData <- subset(NEI, SCC %in% coalLines$SCC)

#Create a png file
png(filename="./plots/plot4.png", width=480, height=480, units = "px")

#Plot the graph based on ggplot2
ggplot(coalData, aes(year, Emissions)) +
  geom_line(stat="summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emission")) +
  ggtitle(expression("Total Emissions from Coal combustion-related\n sources in the US from 1999 to 2008"))

#Close printing device
dev.off()
