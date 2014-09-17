##########################################################################################
## Author:  Pascal Favre
## Date:    17.09.2014
## Goal:    Create a plot based on given rds file showing how motor vehicles 
##          sources changed from 1999 to 2008 in Baltimore
##########################################################################################

#Activate necessary libraries
library(ggplot2)

#Read sourcefiles
SCC <- readRDS('./data/Source_Classification_Code.rds')
NEI <- readRDS('./data/summarySCC_PM25.rds')

##subset data for baltimore
neiBaltimore <- subset(NEI, fips == "24510")

#Find motor vehicles information
#Check if "motor" exists in Short.Name and subset datasets in order to get only coal data
motorRelated <- grep("motor", SCC$Short.Name, ignore.case = T)
motorLines <- SCC[motorRelated, ]
motorData <- subset(neiBaltimore, SCC %in% motorLines$SCC)

#Create a png file
png(filename="./plots/plot5.png", width=480, height=480, units = "px")

#Plot the graph based on ggplot2
ggplot(motorData, aes(year, Emissions)) +
  geom_line(stat="summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emission")) +
  ggtitle(expression("Total Emissions from motor vehicles\n in Baltimore from 1999 to 2008"))

#Close printing device
dev.off()
