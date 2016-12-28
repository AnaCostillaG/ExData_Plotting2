#Exploratory data analysis peer review project 1
getwd()
setwd("./Documents/git/expdataanalysis/ExData_Plotting2")

temp = "exdata_data_NEI_data"

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

head(NEI)
head(SCC,2)

# generate dataset
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.
usemisions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)

##save plotted in png fie. 
png(file="plot1.png", width = 480, height = 480)
barplot(usemisions$x, names.arg=usemisions$Group.1, 
        main=expression('Total Emission of PM 2.5'),
        xlab='Year', ylab=expression(paste('PM 2.5')))
dev.off()
