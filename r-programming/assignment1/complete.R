complete <- function(directory, id = 1:332) {
    ##set working directory
    oldwd <- getwd()
    setwd(directory)
    
    ##Create vector to store mean values
    fileList <- numeric()
    nobsList <- numeric()
    
    ##Loop through each file
    for (i in id) {
        ##read the file
        fileName <- paste(sprintf("%03d",i),".csv",sep = "")
        fileData <- read.csv(fileName)
        
        ##Append the column results to the master list of column values
        fileList <- append(fileList,i)
        nobsList <- append(nobsList,sum(complete.cases(fileData)))
    }
    
    ##Put wd back to normal
    setwd(oldwd)
    
    ##Make data frame based on the vectors
    df <- data.frame(id = fileList, nobs = nobsList)
    df
}

##Testing
##> source("complete.R")
##> complete("specdata", 1)
##id nobs
##1  1  117
##> complete("specdata", c(2, 4, 8, 10, 12))
##id nobs
##1  2 1041
##2  4  474
##3  8  192
##4 10  148
##5 12   96
##> complete("specdata", 30:25)
##id nobs
##1 30  932
##2 29  711
##3 28  475
##4 27  338
##5 26  586
##6 25  463
##> complete("specdata", 3)
##id nobs
##1  3  243