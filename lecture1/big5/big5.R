# ========================
#         BIG R
# 
# # Problem to Solve
# 
# Ever taken a BuzzFeed quiz to determine whether you’re more like a brownie or a chocolate chip cookie? Turns out personality can be characterized in many ways and—within the present-day psychological community—some of the most common traits to describe personality include:
#   
# Extroversion, the extent to which one might be socially outgoing
# Neuroticism, the extent to which one might experience emotional swings
# Agreeableness, the extent to which one might seek to be cooperative and empathetic
# Conscientiousness, the extent to which one might prioritize order and self-discipline
# Openness, the extent to which one might be open to new experiences
# These 5 personality traits are together referred to as “The Big 5.” Psychologists (or those who are just curious about their personality!) might use various personality tests to assess the relative strength of these traits in one’s personality.
# 
# In a program called big5.R, in a folder called big5, write a program to analyze the results of thousands of Big 5 personality tests.
#  
# ========================


# ========================
#  READ DATAFRAME        
# ========================

df                    <- read.table("tests.tsv", 
                                    header = TRUE, 
                                    sep = "\t")

# ========================
#  CHANGE GENDER        
# ========================

df$gender             <- factor(df$gender, 
                                labels = c("Unanswered", "Male", 
                                           "Female", "Other"))

# ========================
#  ASSIGN MAX_VALUE POSSIBLE        
# ========================

max_value             <- 15

# ========================
#  CREATE NEW VECTORS IN DF        
# ========================

df$extroversion       <- round( (df$E1 + df$E2 + df$E3) / max_value , 2)
df$neuroticism        <- round( (df$N1 + df$N2 + df$N3) / max_value , 2)
df$agreeableness      <- round( (df$A1 + df$A2 + df$A3) / max_value , 2)
df$conscientiousness  <- round( (df$C1 + df$C2 + df$C3) / max_value , 2)
df$openness           <- round( (df$O1 + df$O2 + df$O3) / max_value , 2)

# ========================
#  SAVE .CSV FILE       
# ========================

write.csv(df, "analysis.csv")
