#This is the start.

library(tidyverse)
library(ggplot2)
library(dplyr)

library(readxl)
sentiments <- read_excel("data/edld652data.xlsx")
View(sentiments)

#Sentiment per year plot
ggplot(sentiments, aes(x = year, y = sentiment, color = as.factor(year))) + 
  geom_line(size = 1.2) + 
  geom_point() +
  scale_color_viridis_d(option = "plasma") +
  labs(
    title = "Genshin Impact Player's Sentiment about Representation",
    subtitle = "Analyzing sentiment scores from 2020 to 2024",
    x = "Year",
    y = "Sentiment",
    color = "Year", 
    caption = "Data source: r/Genshin_Impact"
  ) +
  theme_minimal() + 
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
    plot.subtitle = element_text(size = 14, hjust = 0.5),
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14)
  )

#New attempt
st_per_year <- sentiments %>%
  count(year, sentiment)
print(st_per_year)

ggplot(st_per_year, aes(x = year, y = n, color = sentiment, group = sentiment)) + 
  geom_line(size = 1.2) + 
  geom_point() +
  scale_color_viridis_d(option = "plasma") +
  labs(
    title = "Genshin Impact Player's Sentiment about Representation",
    subtitle = "Analyzing sentiment scores from 2020 to 2024",
    x = "Year",
    y = "Sentiment",
    color = "Year", 
    caption = "Data source: r/Genshin_Impact"
  ) +
  theme_minimal() + 
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
    plot.subtitle = element_text(size = 14, hjust = 0.5),
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14)
  )

#Success

#Sentiment per keyword plot

st_per_year_key <- sentiments %>%
  count(year, sentiment, keyword)
print(st_per_year_key)

ggplot(st_per_year_key, aes(x = year, y = n, color = sentiment, group = sentiment)) + 
  geom_line(size = 1.2) + 
  geom_point(size = 1.5) +
  scale_color_viridis_d(option = "plasma") +
  facet_wrap(~keyword) +
  labs(
    title = "Genshin Impact Player's Sentiments per Keyword",
    subtitle = "Analyzing sentiment scores from 2020 to 2024",
    x = "Year",
    y = "Sentiment",
    color = "Year", 
    caption = "Data source: r/Genshin_Impact"
  ) +
  theme_minimal() + 
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
    plot.subtitle = element_text(size = 14, hjust = 0.5),
    axis.text = element_text(size = 12),
    axis.title = element_text(size = 14)
  )











