library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_CalifBalti <- NEI[NEI$fips=="06037"|NEI$fips=="24510",]
SCC_MotorVehicle <- SCC %>% filter(grepl("Motor Vehicle",Short.Name))
NEI_MotorVehicle <- NEI_CalifBalti[which(NEI_CalifBalti$SCC %in% SCC_MotorVehicle$SCC),]

png(file="plot6.jpeg",width=480, height=480)
with(NEI_MotorVehicle,plot(year,Emissions,type="n"))
with(subset(NEI_MotorVehicle,fips=="06037"),points(year,Emissions,col="blue"))
with(subset(NEI_MotorVehicle,fips=="24510"),points(year,Emissions,col="red"))
legend("bottomright",pch=1,col=c("blue","red"),legend=c("California","Baltimore"))
dev.off()
