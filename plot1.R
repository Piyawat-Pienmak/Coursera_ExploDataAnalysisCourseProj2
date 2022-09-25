library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="plot1.jpeg",width=480, height=480)
boxplot(log10(Emissions)~year,NEI)
dev.off()
