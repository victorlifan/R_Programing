corr <- function(directory, threshold =0) {
    # a list of file
    files <- list.files(directory,"*.csv",full.names = TRUE)
    # create an empty numerical vector
    result <- vector("numeric")
    # for loop check each file
    for(i in files) {
        # read csv
        readin <- read.csv(i)
        # column sum "sulfate" and "nitrate"
        both <- colSums(!is.na(readin)[,2:3])
        # if statement to filter out greater than threshold
        if (both["sulfate"]>threshold & both["nitrate"]>threshold)
            # append right records' correlation to result vector
            {result <- append(result,cor(readin["sulfate"],readin["nitrate"],use="complete"))}
    }
    # return result
    result
}