library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_Baltimore <- NEI[NEI$fips=="24510",]

png(file="plot2.jpeg",width=480, height=480)
boxplot(log10(Emissions)~year,NEI_Baltimore)
dev.off()
