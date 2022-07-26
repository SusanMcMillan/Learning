##  Why Distributions Matter for mean and variance...
#   Bimodal distribution of Penguins by Flipper Length

library(ggpp)
library(ggplot2)
library(tibble)


library(palmerpenguins)
data(penguins)
d <- penguins

mu <- round(mean(d$flipper_length_mm, na.rm = TRUE),2)
var <- round(var(d$flipper_length_mm, na.rm = TRUE),2)
df <- tibble(x = 220, y = 50,
             table = list(tibble(estimate = c("widehat(mu)", "sigma^2"),
                                 value = c(mu, var))))

plot <- ggplot(data = d, aes(flipper_length_mm)) +
  geom_histogram() +  
  geom_table(data = df, aes(x,y, label = table), parse = TRUE) +
  ggtitle("Penguin Flipper Length") +
  xlab("millimeters") +
  ylab("Penguin Count") +
  theme_minimal()+
  theme(
    plot.title.position = "plot")
plot


plot2 <- ggplot(data = d, aes(flipper_length_mm)) +
  geom_histogram(fill = "grey80", color = "grey70") +  #  fill and outline colors
  geom_table(data = df, aes(x,y, label = table), parse = TRUE) +
  ggtitle("Penguin Flipper Length") +
  xlab("millimeters") +
  ylab("Penguin Count") +
  theme_minimal()+
  theme(
    plot.title.position = "plot")
plot2

# As PNG
ggsave(plot = plot2, filename = "Penguin_Flipper_Length_Hist.png",
       height = 7, width = 7, units = "in", dpi = 400)
