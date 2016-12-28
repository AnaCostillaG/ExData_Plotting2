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
# Of the four types of sources indicated by the
#𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these
#four sources have seen decreases in emissions from 1999–2008 for
# Baltimore City?
# Which have seen increases in emissions from 1999–2008?
# Use the ggplot2 plotting system to make a plot answer this question.
BCMemisions <- NEI[NEI$fips=='24510',]
BCMemisions$year <- factor(BCMemisions$year, levels=c('1999', '2002', '2005', '2008'))
##save plotted in png fie. 
png(file="plot3.png", width = 480, height = 480)
ggplot(data=BCMemisions, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
  geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
  ylab(expression(paste('Log', ' of PM 2.5'))) + xlab('Year') + 
  ggtitle('Emissions per Type in Baltimore City') +
  geom_jitter(alpha=0.10)
dev.off()
