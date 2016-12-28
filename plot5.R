#Exploratory data analysis peer review project 1
getwd()
setwd("./Documents/git/expdataanalysis/ExData_Plotting2")
install.packages('ggplot2')
library(ggplot2)
temp = "exdata_data_NEI_data"

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")
head(NEI)
# generate dataset
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
BCMemissions <- NEI[(NEI$fips == '24510' & NEI$type == 'ON-ROAD'),]
plotEmissions <- aggregate(BCMemissions[, 'Emissions'], by=list(factor(BCMemissions$year, levels=c('1999', '2002', '2005', '2008'))), sum)
colnames(plotEmissions) <- c('year', 'Emissions')
##save plotted in png fie. 
png(file="plot5.png", width = 480, height = 480)
ggplot(data=plotEmissions, aes(x=year, y=Emissions)) + 
  geom_bar(stat="identity") +
  ylab(expression('PM 2.5')) +
  ggtitle('Total Emissions from motor vehicle in Baltimore City, Maryland')
dev.off()
