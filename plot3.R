##########################################################################################
## Author:  Pascal Favre
## Date:    17.09.2014
## Goal:    Create a plot based on given rds file showing the evolution of PM2.5 in 
##          Baltimore coloured by type.
##########################################################################################

#Activate necessary libraries
library(ggplot2)

#Read sourcefiles
SCC <- readRDS('./data/Source_Classification_Code.rds')
NEI <- readRDS('./data/summarySCC_PM25.rds')

##subset data for baltimore
neiBaltimore <- subset(NEI, fips == "24510")

#Create a png file
png(filename="./plots/plot3.png", width=480, height=480, units = "px")

#Plot the graph based on ggplot2
ggplot(neiBaltimore, aes(year, Emissions, color=type)) +
  geom_line(stat="summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emission")) +
  ggtitle(expression("Total Emissions of PM" [2.5]*" in Baltimore from 1999 to 2008"))

#Close printing device
dev.off()
