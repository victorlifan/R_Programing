complete <- function (directory , id=1:332){
    # id column values
    id <- id
    # a list of files to read
    files <- list.files(directory,pattern="*.csv",full.names = TRUE)[id]
    # create enpty vector to store for loop result
    result<-vector("numeric")
    for (i in files) {
        # read each file then sum column "sulfate","nitrate"
        both <- colSums(!is.na(read.csv(i))[,2:3])
        # pick the smaller result and store in `result` vector
        if (both["sulfate"]<=both["nitrate"]) {result<-append(result,both[["sulfate"]])}
        else {result<-append(result,both[["nitrate"]])}
    }
    # convert into DF
    data.frame(id=id,nobs=result)
}

