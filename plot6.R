#Exploratory data analysis peer review project 1
getwd()
setwd("./Documents/git/expdataanalysis/ExData_Plotting2")
install.packages('ggplot2')
library(ggplot2)
temp = "exdata_data_NEI_data"

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

# generate dataset
# Compare emissions from motor vehicle sources in Baltimore City with
# emissions from motor vehicle sources in Los Angeles County,
# California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater ch
# anges over time in motor vehicle emissions?
BCMemissions <- NEI[(NEI$fips %in% c('24510', '06037') & NEI$type == 'ON-ROAD'),]
plotEmissions <- aggregate(Emissions ~ year + fips, BCMemissions, sum)
plotEmissions$fips[plotEmissions$fips=='24510'] <- 'baltimore'
plotEmissions$fips[plotEmissions$fips=='06037'] <- 'california'
##save plotted in png fie. 
png(file="plot6.png", width = 480, height = 480)
ggplot(plotEmissions, aes(factor(year), Emissions)) +
  facet_grid(. ~ fips) +
  geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('PM 2.5')) +
  ggtitle('Total Emissions from motor vehicle')
dev.off()
