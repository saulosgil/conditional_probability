# This example is from site https://www.statology.org/conditional-probability-in-r/

#create data frame to hold survey responses
df <- data.frame(gender = rep(c('Male', 'Female'), each = 150),
                 sport = rep(
                   c('Baseball',
                     'Basketball',
                     'Football',
                     'Soccer',
                     'Baseball',
                     'Basketball',
                     'Football',
                     'Soccer'
                   ),
                   times = c(34, 40, 58, 18, 34, 52, 20, 44)
                 ))

#create two-way table from data frame
survey_data <-
  addmargins(
    table(gender = df$gender,
          sport = df$sport))

#view table
survey_data

#calculate probability of being male, given that individual prefers baseball
survey_data[2, 1] / survey_data[3, 1]

#calculate probability of preferring basketball, given that individual is female
survey_data[1, 2] / survey_data[1, 5]

