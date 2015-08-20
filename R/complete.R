complete <- function(directory, id = 1:332) {
    nobs <- NULL
    for (i in id){
        while(nchar(i) != 3) 
        {
            i <- paste0(0, i)
        }
        path_to_file <- paste0(directory, "/", i, ".csv")
        all_tabl <- read.csv(path_to_file)
        nobs <- append(nobs, nrow(all_tabl[(!is.na(all_tabl[, "nitrate"])) & (!is.na(all_tabl[, "sulfate"])), ]))
        
    }
    
    data.frame(id, nobs)
}