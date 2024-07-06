# Problem to Solve
# 
# Tea is the most popular drink in the world—after, of course, water!
#   
# In a program called teahouse.R, in a folder called teahouse, write a program
# to recommend users a cup of tea that will be… well, their cup of tea.
# 
# Specification
# 
# This problem is composed of two parts. In the first part, you’ll write
# teahouse.R. In the second, you’ll write a program of your choice.

print("What's your favorite flavour? Type Light or Bold")
flavour <- readline()

print("Do you want coffeine? Type Yes or No")
caffeine <- readline()

teahouse_df <- data.frame(
  flavour = c( "Light", "Light", "Bold", "Bold" ),
  caffeine = c( "Yes", "No", "Yes", "No" ),
  tea = c( "green tea", "chamomile tea", "black tea", "rooibos tea" )
)

recommendation <- teahouse_df$tea[
  which(
    teahouse_df$flavour == flavour
    &
      teahouse_df$caffeine == caffeine
  )
]

print(recommendation)
