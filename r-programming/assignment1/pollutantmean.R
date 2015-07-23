pollutantmean <- function(directory, pollutant, id = 1:332) {

    ##if pollutant is not nitrate or sulfate
    if (pollutant != "sulfate" && pollutant != "nitrate") {
        message("Enter a correct pollutant: sulfate or nitrate")
        return
    }
    
    ##set working directory
    oldwd <- getwd()
    setwd(directory)
    
    ##Create vector to store mean values
    meanValues <- 0
    
    ##Loop through each file
    for (i in id) {
        ##read the file
        fileName <- paste(sprintf("%03d",i),".csv",sep = "")
        fileData <- read.csv(fileName)

        ##Append the column results to the master list of column values
        meanValues <- append(meanValues,fileData[[pollutant]])
    }
    
    ##Put wd back to normal
    setwd(oldwd)
    
    ##Calculate the mean across the whole set of records
    mean(meanValues, na.rm = TRUE)
}

##Tests
##> pollutantmean("specdata", "sulfate", 1:10)
##[1] 4.062988
##> pollutantmean("specdata", "nitrate", 70:72)
##[1] 1.704242
##> pollutantmean("specdata", "nitrate", 23)
##[1] 1.278235
##> pollutantmean("specdata", "nitrate")
##[1] 1.702917
##> pollutantmean("specdata", "nitrate",1:332)
##[1] 1.702917
##> source("pollutantmean.R")
##> pollutantmean("specdata", "nitrate",1:332)
##[1] 1.702917