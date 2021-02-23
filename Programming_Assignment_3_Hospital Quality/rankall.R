## The function reads the outcome-of-care-measures.csv file and returns a 
## 2-column data frame containing the hospital in each state that has the 
## ranking specified in num.

rankall <- function(outcome, num = "best") {
    ## Read outcome data
    df <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                   colClasses = "character")
    ## Check outcome is valid
    if (outcome %in% c( "heart attack","pneumonia","heart failure")==FALSE)
    {stop("invalid outcome")}
    ## assign column indexes according to `outcome` argu
    else {if (outcome == "heart attack") {colindex <- 11}
        else if (outcome == "heart failure") {colindex <- 17}
        else {colindex <- 23}}
    ## subset stat name and outcome columns
    mask <- df[,c(2,7,colindex)]
    ## change `outcome` datatype to numeric
    mask[[3]] <- as.numeric(mask[[3]])
    
    ## For each state, find the hospital of the given rank
    ## sort ascendingly by `state`,`outcome` then `hospital name`, drop NAN
    sorted <- mask[order(mask[,2],mask[,3],mask[,1], na.last = NA),]
    ## create `rank` column rank outcome in each state group
    sorted$rank <-with(sorted, ave(seq_along(State), State, FUN = seq_along))
    ## assign `best` as 1
    if (num== "best") 
    {result <- sorted[sorted["rank"]==1,][,1:2]}
    ## sort `outcome` descendingly and create dec_rank to rank the worst the highest
    else if (num== "worst")
        {dec_sorted <-mask[order(mask[,2],-mask[,3],mask[,1],na.last = NA),]
        dec_sorted$dec_rank <-with(dec_sorted, ave(seq_along(State), State, FUN = seq_along))
        result <- dec_sorted[dec_sorted["dec_rank"]==1,][,1:2]}
    ## for numerical num, use sorted df
    else {result <- sorted[sorted["rank"]==num,][,1:2]}
    
    ## create a data frame contain unique state names
    state_list <- data.frame(unique(sorted$State))
    ## merge two dfs to create NA 
    df1<- merge.data.frame(result,state_list,by.x = "State", 
                     by.y = "unique.sorted.State.", all.y = TRUE)
    ## change column orders & names
    df1<- df1[,c("Hospital.Name","State")]
    colnames(df1)<- c("hospital","state")
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    df1
}
