# 1. Use the Data that you collect from internet or R already define datasets.
data(mtcars)

# Display the first six rows of the dataset
head(mtcars)

# 2. Data Preparation
# a. Check if there is NA( if not state that using Rcode)
if (any(is.na(mtcars))) {
  print("There are NA values in the dataset.")
} else {
  print("There are no NA values in the dataset.")
}

# b. Replace or remove NA values
mtcars <- na.omit(mtcars)  # Remove rows with NA values
# OR
# Replace NA values with mean (for numeric columns)
# mtcars[is.na(mtcars)] <- colMeans(mtcars, na.rm = TRUE)

# Display the modified dataset
head(mtcars)

library(ggplot2)

# 3. Sketch 2 different graph that shows a relation between the columns of the dataset by using the ggplot2 package
# Graph 1: Scatter plot for mpg (miles per gallon) and hp (horsepower)
tmpcolor <- c("#31a354")

ggplot(mtcars, aes(x = mpg, y = hp)) +
  geom_point(color = tmpcolor) +
  labs(title = "Scatter Plot: mpg vs hp", x = "mpg", y = "hp")



# Graph 2: Bar plot for cyl (number of cylinders) and disp (displacement)
ggplot(mtcars, aes(x = as.factor(cyl), y = disp)) +
  geom_bar(stat = "identity", aes(fill = as.factor(cyl))) + 
  scale_fill_manual(values = c("#a6bddb", "#9ebcda", "#756bb1")) +  # Use custom colors
  labs(title = "Bar Plot: Number of Cylinders vs Displacement", x = "Number of Cylinders", y = "Displacement")

# 4. Use dplyr module functionality in your homework. Pipe, summarise(), mutate() and groupby()  
library(dplyr)

result <- mtcars %>%
  group_by(cyl) %>%
  mutate(mean_mpg = mean(mpg), max_hp = max(hp)) %>%
  summarise(avg_mpg = mean(mean_mpg), max_hp_all = max(max_hp))

# Display the result
print(result)
