

library(dplyr)
library(ggplot2)


get_data = 'realEstate.csv'

# Getting data 
data = read.csv(get_data)


data <- data %>% filter(Town != "***Unknown***")
average_prices <- aggregate(Sale.Amount ~ List.Year, data, FUN = mean)
average_salesRatios <- aggregate(Sales.Ratio ~ Town, data, FUN = mean)



#Which town has the highest average sale amount?
highest_avg_price = max(average_prices)
town = average_prices$Town[which.max(average_prices$Sale.Amount)]
print(highest_avg_price)
print(town)

#Which town has the highest (min) expt price/sold price average sales ratio?
lowest_ratio = min(average_salesRatios$Sales.Ratio)
ratio_town = average_salesRatios$Town[which.min(average_salesRatios$Sales.Ratio)]
print(lowest_ratio)
print(ratio_town)

## What is the trend of average prices of residential homes over time?

##data = data %>% filter(Property.Type == "Residential")
##data = data %>% filter(Date.Recorded == "2020")

data = data %>% group_by(List.Year)

ggplot(average_prices, aes(x = List.Year, y = Sale.Amount)) +
  geom_line() +
  labs(title = "Trend of Average Prices of Residential Homes", x = "Years", y = "Average Prices")

