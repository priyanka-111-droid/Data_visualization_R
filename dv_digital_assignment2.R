# Load required libraries
library(ggplot2)
library(MASS)

# Load the diamonds dataset and store it as 'diamonds_data'
data("diamonds")
diamonds_data <- diamonds
attach(diamonds_data)

# Standardize the numerical features
numerical_features <- c("carat", "depth", "table", "x", "y", "z")
diamonds_data[, numerical_features] <- scale(diamonds_data[, numerical_features])

# Create a categorical target variable based on price
diamonds_data$price_category <- cut(diamonds_data$price, 
                                    breaks = c(0, quantile(diamonds_data$price, 0.5), max(diamonds_data$price)), 
                                    labels = c("Low", "High"))

# Use 70% of dataset as training set and remaining 30% as testing set
sample <- sample(c(TRUE, FALSE), nrow(diamonds_data), replace = TRUE, prob = c(0.7, 0.3))
train <- diamonds_data[sample, ]
test <- diamonds_data[!sample, ] 

# Perform LDA for data classification
lda_model <- lda(price_category ~ ., data = train)

# use LDA model to make predictions on test data
predicted <- predict(lda_model, test)

# Calculate accuracy
accuracy <- mean(predicted$class == test$price_category)
cat("Accuracy:", accuracy * 100, "%\n")

# Create a plot using ggplot2 with LD1 and LD2
lda_results <- data.frame(LD1 = predict(lda_model)$x)
lda_results$price_category <- train$price_category

ggplot(lda_results, aes(x = LD1, fill = price_category)) +
  geom_density(alpha = 0.5) +
  labs(x = "LD1", title = "LDA Results") +
  theme_minimal()
#Way 2

# Perform LDA for data classification with "cut" as the target
lda_model_cut <- lda(cut ~ ., data = train)

# Predict on the test data
predicted_cut <- predict(lda_model_cut, test)

# Calculate accuracy
accuracy_cut <- mean(predicted_cut$class == as.character(test$cut))
cat("Accuracy (Cut as Target):", accuracy_cut * 100, "%\n")


#Way 3

# Perform LDA for data classification with "color" as the target
lda_model_color <- lda(color ~ ., data = train)

# Predict on the test data
predicted_color <- predict(lda_model_color, test)

# Calculate accuracy
accuracy_color <- mean(as.character(predicted_color$class) == as.character(test$color))
cat("Accuracy (Color as Target):", accuracy_color * 100, "%\n")

#Way 4
# Perform LDA for data classification with "clarity" as the target
lda_model_clarity <- lda(clarity ~ ., data = train)

# Predict on the test data
predicted_clarity <- predict(lda_model_clarity, test)

# Calculate accuracy
accuracy_clarity <- mean(as.character(predicted_clarity$class) == as.character(test$clarity))
cat("Accuracy (Clarity as Target):", accuracy_clarity * 100, "%\n")


#Way 5
# Perform LDA for data classification with "table" as the target
lda_model_table <- lda(table ~ ., data = train)

# Predict on the test data
predicted_table <- predict(lda_model_table, test)

# Calculate accuracy
accuracy_table <- mean(as.character(predicted_table$class) == as.character(test$table))
cat("Accuracy (Table as Target):", accuracy_table*100,"%\n")




