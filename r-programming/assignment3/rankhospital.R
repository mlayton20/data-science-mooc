rankhospital <- function(state, outcome, num = "best") {
    ##If its best, use the best function created.
    if (num == "best") {
        return(best(state, outcome))
    }
    
    ##Check if state value is populated
    if (missing(state) || nchar(state) != 2) {
        stop("invalid state")
    }
    
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
    
    ##Filter out only hospitals in the state given
    stateData <- fileData[fileData$State == state,]
    
    ##Error out if no state data found.
    if (nrow(stateData) == 0) {
        stop("invalid state")
    }
    
    ##Covert the outcome column to numeric
    stateData[,outcomeCol] <- suppressWarnings(as.numeric(as.character(stateData[,outcomeCol])))
    
    ##Remove redundant columns.
    stateData <- stateData[,c("Hospital.Name",outcomeCol)]
    
    ##Remove incomplete records. 
    stateData <- stateData[complete.cases(stateData),]
    
    ##Order columns by outcome column then alphabetically.
    stateData <- stateData[order(stateData[,2], stateData[,1]),]
    
    ##Work out the row index
    rowIndex <- numeric()
    if (num == "worst") {
        rowIndex <- nrow(stateData)
    } else {
        rowIndex <- num
    }
    
    ##Get the hospital name. Set to NA if none found.
    hospitalName <- levels(droplevels(stateData[rowIndex,1]))
    if (length(hospitalName) == 0) {
        hospitalName <- NA
    }
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    hospitalName
    
}