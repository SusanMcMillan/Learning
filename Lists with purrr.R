

library(purrr)
library(repurrrsive)
help(package = "repurrrsive")

#  Game of Thrones (GoT) characters - list form
got_chars
View(got_chars)
got_chars[1]

#  Single bracket always returns a (sub)list
#  Double bracket extracts contents of a list

# Who is the 9th person? what info available?
got_chars[[9]]


#  How many alias does each GoT character have?
got_chars[[9]][["aliases"]]
length(got_chars[[9]][["aliases"]])

got_chars[[13]][["aliases"]]
length(got_chars[[13]][["aliases"]])


#  A purrr example that does the length function for each actor and aliases
map(got_chars, ~ length(.x[["aliases"]]))