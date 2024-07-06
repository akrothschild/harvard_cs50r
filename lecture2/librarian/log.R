
#==============================================================================
# Problem to Solve
# 
# You have tended to a vast library at the edge of the woods for many years, 
# helping readers find the knowledge they need to continue on their journey.
# 
# In a folder named library, in files named log.R and answers.txt, help several 
# readers find the books they are looking for.
# 
# Specification
# 
# For this problem, equally as important as finding the books is the process you
# use to do so. In log.R, keep a log of all R code you run to find each reader’s 
# book. Label each section with a comment: in R, comments are any lines that 
# begin with #, per the below:
# 
# # This is a comment in R
#
# The comment should describe why you’ve written the code you’ve written, as 
# well as what information you’re hoping to glean from it. Ultimately, log.R 
# should serve as evidence of the process you used to find each book!
#   
#   Upon finding a book, complete the corresponding line in answers.txt by 
# filling in the book’s title. Be sure not to change any of the existing text 
# in the file or to add any other lines to the file!
#   
#   See a sample completed answers.txt file
# Ultimately, you should submit both your log.R and answers.txt files.
#==============================================================================

# INSTALL AND INITIALIZE PACKAGES
install.packages("readr", "dplyr")
library(readr, dplyr)

# READ THE DATASETS
authors_df <- read_csv("authors.csv")
books_df <- read_csv("books.csv")

# FIND A BOOK FOR WRITER 
# SELECT title FROM books_df WHERE author = "Mia Morgan"
writers_book <- books_df$title[(
  which(
    books_df$author == "Mia Morgan"))] 

# FIND A BOOK FOR MUSICIAN 
# SELECT title FROM books_df WHERE year = 1613 AND topic = "Music"
musicians_book <- books_df$title[(
  which(
    books_df$year == 1613 & 
    books_df$topic == "Music"))]

# FIND A BOOK FOR TRAVELER WHERE author = Lysandra Silverleaf or Elena Petrova 
# AND year = 1775
travellers_book <- books_df$title[(
  which(
    books_df$year == 1775 & 
      (books_df$author == "Lysandra Silverleaf" | 
         books_df$author == "Elena Petrova")))]

# FIND A BOOK FOR PAINTER 
# SELECT title FROM books_df WHERE (year = 1990 OR year = 1992) AND 
# (pages BETWEEN 200 AND 300)
painters_book <- books_df$title[
  which
  (
    (
      books_df$year == 1990 
      | 
      books_df$year == 1992
    )
    &
    (
      books_df$pages > 199
      &
      books_df$pages < 301
    )
  )
]


# FIND A BOOK FOR SCIENTIST 
# SELECT title FROM books_df WHERE title LIKE '%Quantum Mechanics%' 
scientists_book <- books_df$title[
  grep("quantum mechanics", books_df$title, ignore.case = TRUE)
]

# FIND A BOOK FOR TEACHER
# SELECT title FROM books_df 
#   INNER JOIN authors_df ON books_df.author = authors_df.author 
#     WHERE year > 1699 AND year < 1800 AND topic = 'Education'
joined_books_authors_df <- inner_join(books_df, authors_df, by = c("author" = "author"))
teachers_book <- joined_books_authors_df$title[
  which(
    (
        joined_books_authors_df$year > 1699
      &
        joined_books_authors_df$year < 1800
    )
    &
      joined_books_authors_df$topic == "Education"
    &
      joined_books_authors_df$hometown == "Zenthia"
  )
]

# Create and save string to answers.txt
answers <- paste(
    sprintf("The Writer is looking for: %s", writers_book),
    sprintf("The Musician is looking for: %s", musicians_book),
    sprintf("The Traveler is looking for: %s", travellers_book),
    sprintf("The Painter is looking for: %s", painters_book),
    sprintf("The Scientist is looking for: %s", scientists_book),
    sprintf("The Teacher is looking for: %s", teachers_book), 
  sep = "\n")

write(answers, "answers.txt")

# Save .RData
save(authors_df, books_df, joined_books_authors_df, writers_book, musicians_book, 
     travellers_book, painters_book, scientists_book, teachers_book, answers,
     file = "librarian.RData")
