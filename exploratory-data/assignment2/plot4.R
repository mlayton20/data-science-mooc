require(ggplot2)

#Read the data in from files
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Get the SCC numbers returned from the following filter
coal_related_scc <- as.character(SCC[grepl(".*Coal.*",SCC$EI.Sector),1])

#Filter the NEI data by only selecting the rows relevant to the above SCCs
NEI <- NEI[NEI$SCC %in% coal_related_scc,]

#Get the sum of each year
emissions_byyear <- aggregate(NEI$Emissions, by=list(Year=NEI$year), FUN=sum)

#Plot the graph
qplot(Year,x, data = emissions_byyear, geom = "line", ylab = "PM2.5 Emissions (tons)")

#Save to PNG file
dev.copy(png, "plot4.png")
dev.off()