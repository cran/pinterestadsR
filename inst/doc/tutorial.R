## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

load("my_pinterestads_data.RData")

## ----setup--------------------------------------------------------------------
library(pinterestadsR)

library(dplyr)
library(ggplot2)

## ---- eval = FALSE------------------------------------------------------------
#  
#  my_pinterestads_data <-
#    fetch_pinterestads(api_key = "your api key",
#             date_from = Sys.Date()-100,
#             date_to = Sys.Date(),
#             fields = c("campaign", "clicks",
#                        "spend", "impressions", "date"))

## -----------------------------------------------------------------------------
str(my_pinterestads_data)

## -----------------------------------------------------------------------------
ggplot(my_pinterestads_data, aes(y = clicks, fill = campaign)) + geom_boxplot()

## -----------------------------------------------------------------------------
lmod <- glm(clicks ~ campaign, data = my_pinterestads_data, family = "poisson")
summary(lmod)

