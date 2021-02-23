## The function reads the outcome-of-care-measures.csv file and returns a 
## character vector with the name of the hospital that has the ranking 
## specified by the num argument.

rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    df <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                   colClasses = "character")
    ## Check that state and outcome are valid
    if (state %in% df$State == FALSE) 
        {stop("invalid state")}
    else if (outcome %in% c( "heart attack","pneumonia","heart failure")==FALSE)
        {stop("invalid outcome")}
    
    ## Return hospital name in that state with the given rank
    ## assign column indexes according to `outcome` argu
    else {if (outcome == "heart attack") {colindex <- 11}
            else if (outcome == "heart failure") {colindex <- 17}
            else {colindex <- 23}}
        ## subset stat name and outcome columns 
        mask <- df[df["State"]==state,c(2,colindex)]
        ## change `outcome` datatype to numeric
        mask[[2]] <- as.numeric(mask[[2]])
        ## sort by `outcome` then `hospital name`, drop NAN
        sorted <- mask[order(mask[,2],mask[,1],na.last = NA),]
        ## assign `best` as 1 and `worst` as last one
        if (num== "best") 
            {result <- sorted[which.min(sorted[,2]),1]}
        else if (num== "worst")
            (result <- sorted[which.max(sorted[,2]),1])
        # use `num` argu to subset hospital name with desired rank
        else {result <- mask[order(mask[,2],mask[,1],na.last = NA),][num,1]}
        # return result
        result
}
