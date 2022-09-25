library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_Baltimore <- NEI[NEI$fips=="24510",]
SCC_MotorVehicle <- SCC %>% filter(grepl("Motor Vehicle",Short.Name))
NEI_MotorVehicle <- NEI_Baltimore[which(NEI_Baltimore$SCC %in% SCC_MotorVehicle$SCC),]
NEI_MotorVehicle$year <- as.Date(NEI_MotorVehicle$year)

png(file="plot5.jpeg",width=480, height=480)
plot(Emissions~year,NEI_MotorVehicle)
dev.off()
