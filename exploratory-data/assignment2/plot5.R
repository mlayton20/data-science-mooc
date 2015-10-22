require(ggplot2)

#Read the data in from files
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Only pull data for Baltimore City, Maryland (fips == "24510") 
NEI <- NEI[which(NEI$fips == "24510"),]

#Get the SCC numbers returned from the following filter
vehicle_related_scc <- as.character(SCC[grepl(".*Vehicle.*",SCC$EI.Sector),1])

#Filter the NEI data by only selecting the rows relevant to the above SCCs
NEI <- NEI[NEI$SCC %in% vehicle_related_scc,]

#Get the sum of each year
emissions_byyear <- aggregate(NEI$Emissions, by=list(Year=NEI$year), FUN=sum)

#Plot the graph
qplot(Year,x, data = emissions_byyear, geom = "line", ylab = "PM2.5 Emissions (tons)")

#Save to PNG file
dev.copy(png, "plot5.png")
dev.off()