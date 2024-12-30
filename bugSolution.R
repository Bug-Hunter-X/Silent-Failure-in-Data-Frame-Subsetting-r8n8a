```r
# This code uses dplyr to safely subset a data frame
library(dplyr)

data <- data.frame(A = 1:3, B = 4:6, C = 7:9)

# Using dplyr::select, this will issue an error if "D" doesn't exist:

subset <- data %>% select(A, D)

print(subset) #will result in an error

#This will only select existing columns and ignore 'D'

subset <- data %>% select(A,B,D) %>% select_if(~!is.na(.)) #alternative solution
print(subset)

#To use base R and handle potential errors:

subset <- data[, c("A", "D", "B"), drop = FALSE]
print(subset)

#Using tryCatch

select_columns <- function(df, cols){    
  result <- tryCatch({df[, cols, drop = FALSE]}, error = function(e) { 
      warning("The error is:", e) 
        df[,intersect(names(df), cols),drop =FALSE]  #return columns that exist      
  })
  return(result)
}

subset <- select_columns(data, c("A", "D", "B"))
print(subset)
```