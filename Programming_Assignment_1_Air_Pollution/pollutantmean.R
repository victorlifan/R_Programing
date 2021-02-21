pollutantmean <- function(directory, pollutant, id=1:332){
        # load in readr library
        library(readr)
        # list of files, subset to id range
        files <- list.files(directory,pattern = "*.csv",full.names = TRUE)[id]
        # lapply apply a function to every element in a list
        # do.call takes arguments only in a list form, applys rbind to to list
        concat <- do.call(rbind, lapply(files,read.csv, stringsAsFactors = FALSE))
        # compute mean exclude NAN
        mean(concat[[pollutant]],na.rm=TRUE)
}