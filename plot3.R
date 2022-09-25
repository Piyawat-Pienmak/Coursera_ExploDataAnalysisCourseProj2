library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_Baltimore <- NEI[NEI$fips=="24510",]
NEI_Baltimore$year <- as.factor(NEI_Baltimore$year)

png(file="plot3.jpeg",width=480, height=480)
p <- ggplot(NEI_Baltimore,aes(x=year, y=log10(Emissions)))+geom_boxplot()+facet_wrap(~NEI_Baltimore$type)
p            
dev.off()
