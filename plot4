# Reading the data
sum_PM25 <- readRDS("/Exploratory Data Analysis Project 2/summarySCC_PM25.rds")
classif_Code <- readRDS("/Exploratory Data Analysis Project 2/Source_Classification_Code.rds")

# Make a plot to show emissions from coal combustion-related sources from 1999–2008
combustion_related <- grepl("comb", classif_Code$SCC.Level.One, ignore.case=TRUE)
coal_related <- grepl("coal", classif_Code$SCC.Level.Four, ignore.case=TRUE)
combustion_SCC <- classif_Code[combustion_related & coal_related, ]
combustion_NEI <- sum_PM25[sum_PM25$classif_Code %in% combustion_SCC, ]

png("plot4.png", width=480,height=480,units="px",bg="transparent")

ggplot(combustion_NEI,aes(x = factor(year),y = Emissions/10^5)) +
  geom_bar(stat="identity", fill ="grey", width=0.75) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

dev.off()
