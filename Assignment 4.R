library(ggplot2)
#4
cars93 <- MASS::Cars93
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = FALSE, method = "loess", formula = y ~ x, color = "#0072B2") +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")

#LM
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "lm", color = "#8fe388") +
  ggtitle("LM Method") +
  theme(plot.title = (title = element_text(color='#8fe388', size = 14))) +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")

#GLM\cars93 <- MASS::Cars93
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "glm", color = "#fe8d6d") +
  ggtitle("GLM Method") +
  theme(plot.title = (title = element_text(color='#fe8d6d', size = 14))) +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)")

#GAM
ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) +
  geom_point(color = "grey60") +
  geom_smooth(se = TRUE, method = "gam", color = "#7c6bea") +
  ggtitle("GAM Method") +
  theme(plot.title = (title = element_text(color='#7c6bea', size = 14))) +
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)") 

#5
library(dplyr)
library(lubridate)
library(tidyr)
load("~/ICA6/preprint_growth.rda") #please change the path if needed

preprint_growth %>% drop_na(count)
preprint_full <- filter(preprint_growth, count != 0 & date > ymd("2007-01-01"))
head(preprint_full)

preprint_5c <- filter(preprint_growth, archive =="bioRxiv" | archive == "F1000Research")
head(preprint_5c)

ggplot(preprint_5c) +
  aes(date, count, color = archive, fill = archive) +
  geom_line(size = 1) +
  labs(title = "Preprint Counts") +
  scale_x_date(name = "year",
               limits = c(min(ymd ("2014-2-01")), ymd("2017-01-01"))) +
  scale_color_manual(values = c("#7c6bea", "#fe8d6d"), name = NULL) +
  theme(legend.position = "right")


