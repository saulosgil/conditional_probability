# These script consists of an example of conditional probability:
# Requires:
#   - to install 'prob' package;
#
# To install 'prob' package was necessary to download file from
# https://cran.r-project.org/src/contrib/Archive/prob/ and install
# this package manually, for updated RStudio
#
#   - Click on the Tools option,
#   - Click on Install Package,
#   - Select Package Archive
# These example is from https://www.geeksforgeeks.org/how-to-calculate-conditional-probability-in-r/

# Library for calculation of conditional probability
library(prob)
library(tidyverse)

Money_Spent <- c("High", "Low", "High", "High",
                 "Low", "Low", "High", "Low",
                 "Low", "High", "Low", "Low",
                 "High", "High", "High")

Frequency <- c("Less", "More", "More", "Less",
               "Less", "More", "More", "Less",
               "Less", "More", "More", "Less",
               "Less", "More", "Less")

Customer <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
              11, 12, 13, 14, 15)

# Customer Data Frame
Customer_Data <-
  as.data.frame(cbind(Customer, Money_Spent, Frequency))

Customer_Data |>
  count(Money_Spent, Frequency, sort = T)

Customer_Data

# Creating two-way table from data frame
Customer_Data_Table <-
  addmargins(
    table(
      "Money_Spent" = Customer_Data$Money_Spent,
      "Frequency" = Customer_Data$Frequency
    )
  )

# view table
Customer_Data_Table

Customer_Data <- probspace(Customer_Data)

Customer_Data

# Probability of the customer spending high
# given that they are purchasing less often

Customer_Data_Table[1, 2] / Customer_Data_Table[3, 1]

# using prob function of the prob pkg
prob(Customer_Data,
     event = Money_Spent == "High",
     given = Frequency == "Less")

# Probability of the customer spending less
# given that they are purchasing more often
Customer_Data_Table[2, 2] / Customer_Data_Table[3, 2]

# using prob function of the prob pkg
prob(Customer_Data,
     event = Money_Spent == "Low",
     given = Frequency == "More")

# Probability of the customer spending less
# given that they are purchasing less often
Customer_Data_Table[2, 1] / Customer_Data_Table[3, 1]

# using prob function of the prob pkg
prob(Customer_Data,
     event = Money_Spent == "Low",
     given = Frequency == "Less")

# Probability of the customer spending high
# given that they are purchasing more often
Customer_Data_Table[1, 2] / Customer_Data_Table[3, 2]

# using prob function of the prob pkg
prob(Customer_Data,
     event = Money_Spent == "High",
     given = Frequency == "More")
