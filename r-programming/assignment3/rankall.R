rankall <- function(outcome, num = "best") {
    
    ##Check if outcome is populated and
    ##check if outcome is 1 of the three expected outcomes.
    if (missing(outcome) || (outcome != "heart attack" && outcome != "heart failure" && outcome != "pneumonia")) {
        stop("invalid outcome")
    }
    
    outcomeCol <- character()
    
    ##Get the full column name of the outcome.
    if (outcome == "heart attack") {
        outcomeCol <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (outcome == "heart failure") {
        outcomeCol <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else if (outcome == "pneumonia") {
        outcomeCol <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    }
    
    ##Read the csv file
    fileData <- read.csv("outcome-of-care-measures.csv")
    
    ##Covert the outcome column to numeric
    fileData[,outcomeCol] <- suppressWarnings(as.numeric(as.character(fileData[,outcomeCol])))
    
    ##Remove redundant columns.
    fileData <- fileData[,c("State","Hospital.Name",outcomeCol)]
    
    ##Ignore states that have no data for outcome column
    fileData <- fileData[complete.cases(fileData),]
    
    ##Split the data by State
    splitData <- split(fileData, fileData$State)
    
    ##Create vectors to hold output values
    hospitals <- character(length(splitData))
    states <- character(length(splitData)) 
    
    ##Loop through each state
    for (i in 1:length(splitData)) {
        
        ##Code looks cleanier if we assign the state data to a new data frame.
        stateData <- splitData[[i]]
        
        ##Order columns by outcome column then alphabetically.
        stateData <- stateData[order(stateData[,3], stateData[,2]),]
        
        ##Work out the row index
        rowIndex <- numeric()
        if (num == "worst") {
            rowIndex <- nrow(stateData)
        } else if (num == "best") {
            rowIndex = 1
        } else {
            rowIndex <- num
        }
        
        ##Get the hospital name. Set to NA if none found.
        hospitalName <- levels(droplevels(stateData[rowIndex,2]))
        if (length(hospitalName) == 0) {
            hospitalName <- NA
        }
        
        ##Assign values to vectors.
        hospitals[i] <- hospitalName
        states[i] <- levels(droplevels(stateData[1,1]))
    }
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    outputData <- data.frame("hospital"=hospitals,"state"=states)
    outputData
}