#===============================================================================
#
# Specification
# 
# In ontime.R, use the data provided in bus.csv and rail.csv to write a 
# program that:
#   
#   Prompts the user to enter a route they intend to take.
# Outputs the mean reliability for all services along that route. Output two 
# means: one for peak hours and one for off-peak hours. Express the mean as a 
# percentage, rounded to the nearest whole percentage point.
# For instance, if a user enters “Blue,” find the mean reliability—for both peak
# and off-peak hours—among all rows with “Blue” as the listed route. Express the 
# result as a percentage, rounded to the nearest whole percentage point.
# Tells the user to enter a valid route if they enter an invalid one.
# If you haven’t already, learn more about the schema of this data before 
# starting!
#
#===============================================================================

#=====================
# INITIALIZE LIBRARIES
#=====================

library(readr)

#=====================
# READ DATA
#=====================

bus <- read_csv("bus.csv", show_col_types = FALSE)
rail <- read_csv("rail.csv", show_col_types = FALSE)

#=====================
# COMBINE INTO ONE DF
#=====================

br_df <- rbind(bus, rail)

#=====================
# CALCULATE RELIABILITY
#=====================

br_df$reliability <- br_df$numerator / br_df$denominator

#=====================
# INITIALIZE ROUTE
#=====================

route <- ""

#=====================
# GET USER INPUT
#=====================
  
while (!(route %in% br_df$route)) {
  route <- trimws(readline())
}

#=====================
# INITIALIZE NEW DF
# with the given route
#=====================

df <- br_df[br_df$route == route, ]

#=====================
# CALC MEAN
#=====================

mean_rel <- mean(df$reliability)

#=====================
# CALC MEAN OFF PEAK
#=====================

mean_rel_off_peak <- mean(
  df$reliability[
    which(
      df$peak == "OFF_PEAK"
    )
  ]
)

#=====================
# CALC MEAN ON PEAK
#=====================
    
mean_rel_peak <- mean(
  df$reliability[
    which(
      df$peak == "PEAK"
    )
  ]
)

#=====================
# PRINT PEAK
#=====================

sprintf("On time %.0f%% of the time during peak hours.", 
            round(mean_rel_peak * 100))

#=====================
# PRINT OFF PEAK
#=====================

sprintf("On time %.0f%% of the time during off-peak hours.", 
            round(mean_rel_off_peak * 100))


