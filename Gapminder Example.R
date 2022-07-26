

library(gapminder)
library(tidyverse)


#  Code with Mistakes
africa <- gapminder[gapminder$continent == "Africa", ]
africa_mm <- max(africa$lifeExp) - min(africa$lifeExp)

americas <- gapminder[gapminder$continent == "Americas", ]
americas_mm <- max(americas$lifeExp) - min(americas$lifeExp)

asia <- gapminder[gapminder$continent == "Asia", ]
asia_mm <- max(asia$lifeExp) - min(asia$lifeExp)

europe <- gapminder[gapminder$continent == "Europe", ]
europe_mm <- max(europe$lifeExp) - min(europe$lifeExp)

oceania <- gapminder[gapminder$continent == "Oceania", ]
oceania_mm <- max(oceania$lifeExp) - min(oceania$lifeExp)

cbind(
  continent = c("Africa", "Americas", "Asia", "Europe", "Oceania"),
  max_minus_min = c(africa_mm, americas_mm, asia_mm, europe_mm, oceania_mm)
)


#  Summarize
gap_summary <- gapminder |> 
  group_by(continent) |> 
  summarize(max_minus_min = max(lifeExp) - min(lifeExp))

gap_summary


#  Past conferences - using for
year <- 2017:2021
location <- c("Orlando", "San Diego", "Austin", "San Francisco", "remote")

conf <- rep_len("", length(year))
for (i in seq_along(conf)) {
  conf[i] <- paste0("The ", year[i], " RStudio Conference was in ", location[i], ".")
}
conf

#  or paste the two vectors
paste0("The ", year, " RStudio Conference was in ", location, ".")

#  Using "glue"
glue::glue("The {year} RStudio Conference was in {location}.")




