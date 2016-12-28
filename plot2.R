#Exploratory data analysis peer review project 1
getwd()
setwd("./Documents/git/expdataanalysis/ExData_Plotting2")

temp = "exdata_data_NEI_data"

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")

# generate dataset
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999
# to 2008? Use the base plotting system to make a plot answering this 
# question.
BCMemisions <- NEI[NEI$fips=='24510',]
BCMemisions <- tapply(X=BCMemisions$Emissions, INDEX=BCMemisions$year, FUN=sum)
##save plotted in png fie. 
png(file="plot2.png", width = 480, height = 480)
barplot(BCMemisions, 
        main=expression('Total Emission in Baltimore City of PM 2.5'),
        xlab='Year', ylab=expression(paste('PM 2.5')))
dev.off()
