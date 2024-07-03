art <- data.frame(
  A = c(" ", " ", " ", " ", " "),
  B = c(" ", " ", " ", " ", " "),
  C = c(" ", " ", " ", " ", " "),
  D = c(" ", " ", " ", " ", " "),
  E = c(" ", " ", " ", " ", " ")
)

art$A <- c("1", "2", "3", "4", "5")
art$B <- c("1", "2", "3", "4", "5")
art$C <- c("1", "2", "3", "4", "5")
art$D <- c("1", "2", "3", "4", "5")
art$E <- c("1", "2", "3", "4", "5")

colnames(art) <- c("Column 1", "Column 2", "Column 3", "Column 4", "Column 5")
rownames(art) <- c("Row 1", "Row 2", "Row 3", "Row 4", "Row 5")

print(art)