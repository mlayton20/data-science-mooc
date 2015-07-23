corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    
    ##Run complete.R to get the files which are above the threshold
    fileStats <- complete(directory)
    
    ##fileStats
    filesAboveThresh <- fileStats[fileStats[,"nobs"] > threshold,"id"]
    
    ##for each file in the threshold
    ##set working directory
    oldwd <- getwd()
    setwd(directory)
    
    ##Create vector to store mean values
    corrVals <- numeric()
    
    ##Loop through each file
    for (i in filesAboveThresh) {
        ##read the file
        fileName <- paste(sprintf("%03d",i),".csv",sep = "")
        fileData <- read.csv(fileName)
        fileData <- fileData[complete.cases(fileData),]
        
        ##perform cor() function on sulfate vs nitrate
        corrVals <- append(corrVals,cor(fileData$sulfate,fileData$nitrate))
        ##Append value to vector
        ##corrVals
        
        ##Append the column results to the master list of column values
        ##fileList <- append(fileList,i)
        ##nobsList <- append(nobsList,sum(complete.cases(fileData)))
    }
    
    ##Put wd back to normal
    setwd(oldwd)
    
    corrVals
}

##Testing
##> cr <- corr("specdata",150)
##> head(cr)
##[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
##> summary(cr)
##Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##-0.21060 -0.04999  0.09463  0.12530  0.26840  0.76310 
##> cr <- corr("specdata",400)
##> head(cr)
##[1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860
##> summary(cr)
##Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##-0.17620 -0.03109  0.10020  0.13970  0.26850  0.76310 
##> cr <- corr("specdata", 5000)
##> summary(cr)
##Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##
##> length(cr)
##[1] 0
##> cr <- corr("specdata")
##> summary(cr)
##Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##-1.00000 -0.05282  0.10720  0.13680  0.27830  1.00000 
##> length(cr)
##[1] 323