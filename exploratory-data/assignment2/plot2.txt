#Read the data in from files
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

#Only pull data for Baltimore City, Maryland (fips == "24510") 
NEI <- NEI[which(NEI$fips == "24510"),]

#Get the sum of each year
emissions_byyear <- aggregate(NEI$Emissions, by=list(Year=NEI$year), FUN=sum)

#Plot the graph
plot(emissions_byyear$Year, emissions_byyear$x, xlab = "Year", ylab = "PM2.5 Emissions (tons)")
lines(emissions_byyear$Year, emissions_byyear$x)

#Save to PNG file
dev.copy(png, "plot2.png")
dev.off()
