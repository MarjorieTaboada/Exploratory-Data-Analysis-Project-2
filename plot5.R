# Reading the data
sum_PM25 <- readRDS("/Exploratory Data Analysis Project 2/summarySCC_PM25.rds")
classif_Code <- readRDS("/Exploratory Data Analysis Project 2/Source_Classification_Code.rds")

# Make a plot for emissions from motor vehicle sources in Baltimore City
vehicles <- grepl("vehicle", classif_Code$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- classif_Code[vehicles,]$classif_Code
vehiclesNEI <- sum_PM25[sum_PM25$classif_Code %in% vehiclesSCC,]

# Subset the vehicles NEI data to Baltimore's fip
balt_vehicles_NEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]

png("plot5.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

ggp <- ggplot(balt_vehicles_NEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

dev.off()
