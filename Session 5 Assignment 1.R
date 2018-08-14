## 1. How many vowels are there in the names of USA States?
data("USArrests")
States = rownames(USArrests)
library(stringr)
vowels = c("a", "e", "i", "o", "u")
num_vowels = vector(mode = "integer", length = 5)
for (j in seq_along(vowels)) {
  num_aux = str_count(tolower(States), vowels[j])
  num_vowels[j] = sum(num_aux)
}
names(num_vowels) = vowels
num_vowels
sort(num_vowels, decreasing = TRUE)
## 2. Visualize the vowels distribution.
library(ggplot2)
pct <- round(num_vowels/sum(num_vowels)*100)
vowels <- paste(vowels, "=", pct) # add percents to
vowels <- paste(vowels,"%",sep="") # add % to
pie(num_vowels, labels = vowels, main = "visualisation of vowels in USA states")