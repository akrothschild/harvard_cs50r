
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

#===============================================================================
# Function to calculate the average yearly growth rate in visitor numbers
#===============================================================================

calculate_growth_rate <- function(years, visitors) {
  # Combine the year and visitor lists into a data frame and sort by years
  data_frame <- data.frame(years = years, visitors = visitors)
  data_frame <- data_frame[order(data_frame$years),]
  
  # Compute the difference in visitor numbers between the last and first years
  visitor_difference <- data_frame$visitors[nrow(data_frame)] - data_frame$visitors[1]
  # Compute the difference in years between the last and first records
  year_difference <- data_frame$years[nrow(data_frame)] - data_frame$years[1]
  
  # Calculate the average increase in visitors per year
  avg_annual_growth <- visitor_difference / year_difference
  return(avg_annual_growth)
}

#===============================================================================
# Function to predict the number of visitors for a specified future year
#===============================================================================

predict_visitors <- function(years, visitors, year) {
  # Obtain the average yearly growth rate
  avg_annual_growth <- calculate_growth_rate(years, visitors)
  
  # Identify the most recent year and its corresponding visitor count
  latest_year <- max(years)
  latest_visitor_count <- visitors[which(years == latest_year)]
  
  # Determine the number of years between the latest year and the target year
  years_to_target <- year - latest_year
  
  # Predict the future visitor count based on the growth rate and time span
  predicted_visitor_count <- latest_visitor_count + (avg_annual_growth * years_to_target)
  return(predicted_visitor_count)
}

visitors <- read.csv("visitors.csv")
year <- as.integer(readline("Year: "))
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)
cat(paste0(predicted_visitors, " million visitors\n"))
