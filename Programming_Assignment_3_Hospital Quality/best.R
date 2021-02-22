## The function reads the outcome-of-care-measures.csv file and returns a 
## character vector with the name of the hospital that has the best (i.e. lowest)
## 30-day mortality for the specified outcome in that state.

best <- function(state, outcome) {
    ## Read outcome data
    df <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                        colClasses = "character")
    ## Check that state and outcome are valid
    if (state %in% df$State == FALSE) 
        {stop("invalid state")}
    else if (outcome %in% c( "heart attack","pneumonia","heart failure")==FALSE)
    {stop("invalid outcome")}
    ## assign column indexes according to `outcome` argu
    else {if (outcome == "heart attack") {colindex <- 11}
        else if (outcome == "heart failure") {colindex <- 17}
        else {colindex <- 23}
        ## subset stat name and outcome columns 
        mask <- df[df["State"]==state,c(2,colindex)]
        ## Return hospital name in that state with lowest 30-day death
        ## if tied, return the first hospital name by alphabetical order 
        result <- sort(mask[which.min(mask[,2]),1])[1]
        result
        }
}