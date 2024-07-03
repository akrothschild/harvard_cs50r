# ========================
#         PIT STOP  
# 
# Problem to Solve
# 
# Ever changed your car’s tires in less than 3 seconds? 
# In Formula One, that’s the usual!
#   
# Formula One is a type of elite, international racing. 
# Races take place all over the world, including destinations like Miami, 
# Florida, and Suzuka, Japan. Besides the racer themselves, each team is 
# composed of a “pit crew” of up to 22 people. The pit crew changes tires, 
# fixes the car, and refuels very quickly. Nowadays, an excellent pit stop can 
# take less than 3 seconds.
# 
# In a program called pitstop.R, in a folder called pitstop, write a program 
# to analyze pit stop times at Formula One races.
#
# ========================

# ========================
#  READ USER´S SET        
# ========================

print("whats your set?")
set_name              <- readline()

# ========================
#  CREATE FUNCTION
#  to analyze the pit stops
# ========================

analyze               <- function(set_path) {
  pitstops              <- read.csv(set_path)
  pitstops_number       <- nrow(pitstops)
  pitstops_shortest     <- min(pitstops$time)
  pitstops_longest      <- max(pitstops$time)
  pitstops_time_spent   <- sum(pitstops$time)
  cat("Total pitstops:",         pitstops_number,     "\n")
  cat("Shortest pitstop:",       pitstops_shortest,   "\n")
  cat("Longest pitstop:",        pitstops_longest,    "\n")
  cat("Time spent on pitstops:", pitstops_time_spent, "\n")
}

# ========================
#  LAUNCH THE FUNCTION        
# ========================

analyze(set_name)
