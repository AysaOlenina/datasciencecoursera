best <- function(state, outcome){
    
    outcome_data <- read.csv("outcome-of-care-measures.csv")
    hrt_attck <- "heart attack"
    hrt_fail <- "heart failure"
    pnmn <- "pneumonia"
    
    if(identical(outcome, hrt_attck)) {col <- 11}
    else if (identical(outcome, hrt_fail)){ col <- 17}     
        else if (identical(outcome, pnmn)){ col <- 23}
            else{ return(print("invalid outcome"))}
    
    if(length(grep(state, levels(outcome_table[, 7]))) == 0){
        return(print("invalid state"))
    }
    
    best_mortality <- min(as.numeric(outcome_table[outcome_table[, "State"] == state, col]))
    name <- outcome_table[(outcome_table[, "State"] == state) & (as.numeric(outcome_table[, col]) == best_mortality), 2]
    name <- sort(as.character(name))[1]
    name
    #outcome_table[outcome_table[, "State"] == "TX", c(2, col)]
    #outcome <- sub(" ", ".", outcome)
        
}