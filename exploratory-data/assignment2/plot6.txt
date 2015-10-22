require(ggplot2)

#Read the data in from files
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Only pull data for Baltimore City, Maryland (fips == "24510") and Los Angeles County, California (fips == "06037")
NEI <- NEI[NEI$fips %in% c("24510","06037"),]

#Get the SCC numbers returned from the following filter
vehicle_related_scc <- as.character(SCC[grepl(".*Vehicle.*",SCC$EI.Sector),1])

#Filter the NEI data by only selecting the rows relevant to the above SCCs
NEI <- NEI[NEI$SCC %in% vehicle_related_scc,]

#Get the sum of each year
emissions_byyear <- aggregate(NEI$Emissions, by=list(Year=NEI$year,fips=NEI$fips), FUN=sum)

#Plot the graph
qplot(Year,x, data = emissions_byyear, color = fips, geom = "line", ylab = "PM2.5 Emissions (tons)")

#Save to PNG file
dev.copy(png, "plot6.png")
dev.off()