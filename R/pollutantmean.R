pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## either "sulfate" or "nitrate".
    finall_vect <- NULL
    for (i in id){
        while(nchar(i) != 3) 
        {
            i <- paste0(0, i)
        }
        path_to_file <- paste0(directory, "/", i, ".csv")
        all_tabl <- read.csv(path_to_file)
        vect_pollut <- all_tabl[, pollutant]
        finall_vect <- append(finall_vect, vect_pollut[!is.na(vect_pollut)])
    }
    mean(finall_vect)
}