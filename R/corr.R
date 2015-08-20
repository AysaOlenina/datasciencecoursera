corr <- function(directory, threshold = 0){
    id = 1:332
    finish_vect <- NULL
    
    ncompl <- complete(directory, id)
    
    for (i in id){         
        if (ncompl[i, "nobs"] > threshold){
            
            while(nchar(i) != 3) 
            {
                i <- paste0(0, i)
            }
            path_to_file <- paste0(directory, "/", i, ".csv")
            all_tabl <- read.csv(path_to_file)
            
            cor_vect <- cor(all_tabl[, "nitrate"], all_tabl[, "sulfate"], use <- "complete.obs")
            finish_vect <- append(finish_vect,cor_vect)
        }
    }
    
    if (is.null(finish_vect)){
        numeric()
    }
    else {finish_vect}
}