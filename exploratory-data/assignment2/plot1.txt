#Read the data in from files
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

#Get the sum of each year
emissions_byyear <- aggregate(NEI$Emissions, by=list(Year=NEI$year), FUN=sum)

#Convert to megatons
emissions_byyear$x <- emissions_byyear$x/1000000

#Plot the graph
plot(emissions_byyear$Year, emissions_byyear$x, xlab = "Year", ylab = "PM2.5 Emissions (megatons)")
lines(emissions_byyear$Year, emissions_byyear$x)

#Save to PNG file
dev.copy(png, "plot1.png")
dev.off()
