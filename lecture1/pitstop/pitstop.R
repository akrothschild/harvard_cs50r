print("whats your set?")

set_name <- readline()

analyze <- function(set_path) {
  pitstops <- read.csv(set_path)
  pitstops_number <- nrow(pitstops)
  pitstops_shortest <- min(pitstops$time)
  pitstops_longest <- max(pitstops$time)
  pitstops_time_spent <- sum(pitstops$time)
  cat("Total pitstops:", pitstops_number, "\n")
  cat("Shortest pitstop:", pitstops_shortest, "\n")
  cat("Longest pitstop:", pitstops_longest, "\n")
  cat("Time spent on pitstops:", pitstops_time_spent, "\n")
}

analyze(set_name)
