# Reading the data
sum_PM25 <- readRDS("/Exploratory Data Analysis Project 2/summarySCC_PM25.rds")
classif_Code <- readRDS("/Exploratory Data Analysis Project 2/Source_Classification_Code.rds")

# Make a plot to compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County
vehicles <- grepl("vehicle", classif_Code$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- classif_Code[vehicles,]$classif_Code
vehiclesNEI <- sum_PM25[sum_PM25$classif_Code %in% vehiclesSCC,]

# Subset the vehicles NEI data by each city's fip and add city name.
veh_NEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]
veh_NEI$city <- "Baltimore City"

veh_ANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
veh_ANEI$city <- "Los Angeles County"

# Combine the two subsets with city name into one data frame
all_NEI <- rbind(veh_baltimoreNEI,veh_ANEI)

png("plot6.png",width=480,height=480,units="px",bg="transparent")
 
ggp <- ggplot(all_NEI, aes(x=factor(year), y=Emissions, fill=city)) +
 geom_bar(aes(fill=year),stat="identity") +
 facet_grid(scales="free", space="free", .~city) +
 guides(fill=FALSE) + theme_bw() +
 labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
 labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))
 
print(ggp)

dev.off()
