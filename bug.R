```r
# This code attempts to subset a data frame using a character vector that doesn't match column names.

data <- data.frame(A = 1:3, B = 4:6, C = 7:9)

subset <- data[, c("A", "D")] # 'D' is not a column name

print(subset)
```