
#===============================================================================
#
# Specification
# 
# In carpet.R, your goal is to use R to help PDX predict the number of travelers 
# who will walk across the PDX carpet in a given year.
# 
# Provided to you is visitors.csv, which documents—between 2002 and 2014—the 
# number of yearly visitors to PDX, in millions.
# 
# To predict the number of travelers who will walk across the PDX carpet in a 
# given year, you’ll implement two functions:
#   
#   calculate_growth_rate, which will calculate the average yearly increase in 
# visitors that PDX should expect
# predict_visitors, which will predict the number of visitors to PDX in a given 
# year
# The rest of the program is already done for you!
#
#===============================================================================

calculate_growth_rate <- function(years, visitors) {
  # Ensure the input is sorted by years
  data <- data.frame(years = years, visitors = visitors)
  data <- data[order(data$years),]
  
  # Calculate the difference in visitors and years
  visitor_diff <- data$visitors[nrow(data)] - data$visitors[1]
  year_diff <- data$years[nrow(data)] - data$years[1]
  
  # Calculate the average yearly growth
  average_yearly_growth <- visitor_diff / year_diff
  return(average_yearly_growth)
}

predict_visitors <- function(years, visitors, year) {
  average_yearly_growth <- calculate_growth_rate(years, visitors)
  
  # Get the most recent year and the corresponding number of visitors
  current_year <- max(years)
  current_visitors <- visitors[which(years == current_year)]
  
  # Calculate the number of years into the future
  n <- year - current_year
  
  # Predict future visitors
  future_visitors <- current_visitors + (average_yearly_growth * n)
  return(future_visitors)
}

visitors <- read.csv("visitors.csv")
year <- as.integer(readline("Year: "))
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)
cat(paste0(predicted_visitors, " million visitors\n"))
