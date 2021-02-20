pollutantmean <- function(directory, pollutant, id=1:332){
        # load in readr library
        library(readr)
        # define path-- wd is a level above data set level
        path <- file.path("C:/Users/victo/OneDrive/??????/R_Programing/
                          Programming_Assignment_1_INSTRUCTIONS_Air_Pollution",directory)
        # list of files, subset to id range
        files <- list.files(directory,pattern = "*.csv",full.names = TRUE)[id]
        # lapply apply a function to every element in a list
        # do.call takes arguments only in a list form, applys rbind to to list
        concat <- do.call(rbind, lapply(files,read.csv, stringsAsFactors = FALSE))
        # compute mean exclude NAN
        mean(concat[[pollutant]],na.rm=TRUE)
}