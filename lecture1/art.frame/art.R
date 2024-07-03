# ========================
#       ART.FRAME
#
# Problem to Solve
# 
# You’ve learned about data frames: objects for storing data in rows and columns. 
# In a file called art.R in a folder called art.frame, practice using data frames 
# to create your very own art in R.
#
# ========================

# ========================
#  INITIALIZE EMPTY DF       
# ========================

art <- data.frame(
  A = c(" ", " ", " ", " ", " "),
  B = c(" ", " ", " ", " ", " "),
  C = c(" ", " ", " ", " ", " "),
  D = c(" ", " ", " ", " ", " "),
  E = c(" ", " ", " ", " ", " ")
)

# ========================
#  ASSIGN VALUES        
# ========================

art$A <- c("1", "2", "3", "4", "5")
art$B <- c("1", "2", "3", "4", "5")
art$C <- c("1", "2", "3", "4", "5")
art$D <- c("1", "2", "3", "4", "5")
art$E <- c("1", "2", "3", "4", "5")

# ========================
#  CHANGE COLUMN NAMES        
# ========================

colnames(art) <- c("Column 1", "Column 2", "Column 3", "Column 4", "Column 5")

# ========================
#  CHANGE ROW NAMES        
# ========================

rownames(art) <- c("Row 1", "Row 2", "Row 3", "Row 4", "Row 5")

# ========================
#  PRINT ART      
# ========================

print(art)