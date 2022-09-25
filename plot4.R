library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_Coal <- SCC %>% filter(grepl("Coal",EI.Sector))
NEI_Coal <- NEI[which(NEI$SCC %in% SCC_Coal$SCC),]

png(file="plot4.jpeg",width=480, height=480)
boxplot(log10(Emissions)~year,NEI_Coal)
dev.off()
