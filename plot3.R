# Reading the data
sum_PM25 <- readRDS("/Exploratory Data Analysis Project 2/summarySCC_PM25.rds")
classif_Code <- readRDS("/Exploratory Data Analysis Project 2/Source_Classification_Code.rds")

# Using ggplot to identify which the four sources decreases in emission for Baltimore City
# Assuming your data has columns named "Emissions", "Year", and "fips"
# Filter the data based on fips == "24510"
baltimore <- sum_PM25[sum_PM25$fips == "24510", ]

# Calculate the sum of emissions per year for the filtered data
baltimore <- aggregate(baltimore$Emissions, by = list(Year = baltimore$year), FUN = sum)

png("plot2.png",width=480,height=480,units="px",bg="transparent")

# Create a bar plot
barplot(baltimore$x, names.arg = baltimore$Year, xlab = "Year", ylab = "Emissions (Tons)", main = "Total Emissions in Baltimore per Year")

dev.off()
