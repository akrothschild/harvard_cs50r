print("Do you like frontend or backend? Type Frontend or Backend")
frontOback <- readline()

print("Do you like to suffer? Type Yes or No")
suffering <- readline()

language_df <- data.frame(
  frontOback = c( "Frontend", "Frontend", "Backend", "Backend" ),
  suffering = c( "Yes", "No", "Yes", "No" ),
  language = c( "JavaScript", "VueJs, Angular, React", "C/C++", "Python" )
)

recommendation <- language_df$language[
  which(
    language_df$frontOback == frontOback
    &
      language_df$suffering == suffering
  )
]

print(recommendation)
