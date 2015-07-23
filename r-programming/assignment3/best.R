best <- function(state, outcome) {

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
    
    if (outcome == "heart attack") {
        outcomeCol <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (outcome == "heart failure") {
        outcomeCol <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else if (outcome == "pneumonia") {
        outcomeCol <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    }
    
    ##Read the csv file
    fileData <- read.csv("outcome-of-care-measures.csv", dec = ".")
    
    ##Filter out only hospitals in the state given
    stateData <- fileData[fileData$State == state,]
    
    ##Error out if no state data found.
    if (nrow(stateData) == 0) {
        stop("invalid state")
    }

    ##Covert the outcome column to numeric
    stateData[,outcomeCol] <- suppressWarnings(as.numeric(as.character(stateData[,outcomeCol])))
    
    ##Work out which records are the lowest
    minOutcome <- min(stateData[,outcomeCol], na.rm = TRUE)

    ##Get the hospital names
    hospitals <- vector()
    if (outcome == "heart attack") {
        hospitals <- levels(droplevels(stateData[stateData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == minOutcome,2]))
    } else if (outcome == "heart failure") {
        hospitals <- levels(droplevels(stateData[stateData$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == minOutcome,2]))
    } else if (outcome == "pneumonia") {
        hospitals <- levels(droplevels(stateData[stateData$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == minOutcome,2]))
    }
    
    ##Sort the hospitals alphabetically.
    hospitals = sort(hospitals)
    
    ##Return hospital name in that state with lowest 30-day death
    hospitals[1]
}
