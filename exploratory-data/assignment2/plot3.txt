require(ggplot2)

#Read the data in from files
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

#Only pull data for Baltimore City, Maryland (fips == "24510") 
NEI <- NEI[which(NEI$fips == "24510"),]

#Get the sum of each year and type
emissions_byyear <- aggregate(NEI$Emissions, by=list(Year=NEI$year,Type=NEI$type), FUN=sum)

#Plot the graph
qplot(Year,x, data = emissions_byyear, color = Type, geom = "line", ylab = "PM2.5 Emissions (tons)")

#Save to PNG file
dev.copy(png, "plot3.png")
dev.off()
