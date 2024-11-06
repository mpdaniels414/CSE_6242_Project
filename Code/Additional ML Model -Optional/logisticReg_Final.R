#Change file path and file references in the first two lines
setwd("Your File Path Here")
clash_data  <- read.csv("results_ml.csv")

library(caret)

split_data <- createDataPartition(clash_data$Winner, p = 0.8, list = FALSE)
train <- clash_data[split_data,]
test <- clash_data[-split_data,]

logistic_full <- glm(Winner ~ . -player_kingTowerHitPoints -opponent_kingTowerHitPoints, data = train, family = "binomial")
#summary(logistic_full)


#summary(smallreg)

full_pred <- predict(logistic_full, test, type = "response")


#convert to true/false

test$predict.full <- ifelse(full_pred >= 0.5,1,0)


full_acc <- mean(test$predict.full == test$Winner)

print(full_acc)

