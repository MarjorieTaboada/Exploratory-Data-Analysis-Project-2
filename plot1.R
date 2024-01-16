# Reading the data
sum_PM25 <- readRDS("/Exploratory Data Analysis Project 2/summarySCC_PM25.rds")
classif_Code <- readRDS("/Exploratory Data Analysis Project 2/Source_Classification_Code.rds")

# Make a plot showing the total PM2.5 emission from all sources for each of the years.
result_aggregate <- aggregate(sum_PM25$Emissions, by = list(Year = sum_PM25$year), FUN = sum)

png("plot1.png",width=480,height=480,units="px",bg="transparent")

barplot(result_aggregate$x/10^6, names.arg = result_aggregate$Year, xlab = "Year", ylab = "Total Emissions", main = "Total Emissions per Year")

dev.off()
