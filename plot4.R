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
# Across the United States, how have emissions from
# coal combustion-related sources changed from 1999–2008?
COALSCC = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

merge <- merge(x=NEI, y=COALSCC, by='SCC')
coalsum<- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(coalsum)<- c('Year', 'E')

##save plotted in png fie. 
png(file="plot4.png", width = 480, height = 480)
ggplot(data=coalsum, aes(x=Year, y=E)) + 
  geom_line() + 
  ggtitle(expression('Total Emissions of PM 2.5')) + 
  ylab(expression(paste('PM 2.5')))
dev.off()
