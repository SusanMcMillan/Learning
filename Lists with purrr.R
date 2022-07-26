

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
#  The ~ is purrr syntax; it's a shortcut for an anonymous function in purrr
map(got_chars, ~ length(.x[["aliases"]]))

#  Alternatively (only first 3 actors)
map(got_chars[1:3], ~ length(.x$aliases))

map(got_chars[1:3], ~ length(.x$aliases)) %>%  #  pipe is now |>
  map(length)


sw_people[[1]][["name"]]
sw_people[[1]][["starships"]]

map(sw_people, ~ length(.x[["starships"]]))

#  use map_int to retrieve an integer rather than list
#  map_char to retrieve a vector of character values
map_int(sw_people, ~ length(.x[["starships"]]))

map_chr(sw_people, ~ .x[["hair_color"]])

map_chr(sw_people, ~ .x[["name"]])

map_lgl(got_chars, ~ .x[["alive"]])

#  Exploring star wars people
sw_people

map_chr(sw_people, ~.x[["homeworld"]])
map_chr(sw_people, ~.x[[9]])

map(sw_vehicles, "pilots")
map_chr(sw_vehicles, "pilots", .default = NA)

map_chr(sw_vehicles, list("pilots",1), .default = NA)


#  Vector of positions
map(got_chars, c(14,1))

#  create readable output - name lists...
got_names <- map_chr(got_chars, "name")

got_chars_named <- set_names(got_chars, got_names)

map_chr(got_chars_named, "alive")
