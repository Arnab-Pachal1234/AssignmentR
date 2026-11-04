library(readr)
df <- read_csv('C:/Users/Arnab/Documents/DS_LAB/Assignment4/Titanic-Dataset.csv')
# 3. Now run your separation script on 'df'
numeric_cols <- names(df)[sapply(df, is.numeric)]
cat("Numeric Columns:\n")
print(numeric_cols)

categorical_cols <- names(df)[sapply(df, function(x) is.character(x) || is.factor(x))]
cat("\nCategorical Columns:\n")
print(categorical_cols)
print(head(df,n=10))
print(tail(df,n=10))


#To find the datatype 
types<-sapply(df,class)


# -------------------------------------------------------------------------
# Question 6: Check for missing values in each column.
# -------------------------------------------------------------------------
missing_counts <- colSums(is.na(df))
cat("\n6. Missing Values per Column:\n")
print(missing_counts)

# -------------------------------------------------------------------------
# Question 7: Impute missing values in the Age column using the median.
# -------------------------------------------------------------------------
# na.rm = TRUE ignores NA values when calculating the median

get_mode <- function(v) {
  uniqv <- unique(v[!is.na(v)]) # ignore NA values
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# # Replace missing values in Age with the most frequent category (e.g., "Adult")
df$Age[is.na(df$Age)] <- mean(df$Age ,na.rm=TRUE)

get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# If Embarked has empty strings "" or NA, replace them with mode
df$Embarked[df$Embarked == "" | is.na(df$Embarked)] <- get_mode(df$Embarked)
cat("8. Embarked missing values replaced with the most frequent category.\n")

duplicated_counts <- sum(duplicated(df))
cat("9. Total Duplicated Counts are :",duplicated_counts,"\n")

# Remove duplicates
df <- df[!duplicated(df),]
cat("   Duplicates removed. New row count:", nrow(df), "\n")

# -------------------------------------------------------------------------
# Question 10: Convert Survived, Pclass, Sex, and Embarked into factor variables.
# -------------------------------------------------------------------------
df$Survived <- as.factor(df$Survived)
df$Pclass   <- as.factor(df$Pclass)
df$Sex      <- as.factor(df$Sex)
df$Embarked <- as.factor(df$Embarked)

cat("\n10. Converted Survived, Pclass, Sex, and Embarked into factor variables.\n")
print(sapply(df[, c("Survived", "Pclass", "Sex", "Embarked")], class))

names(df) <- make.names(names(df))
cat("\n11. Column names cleaned using valid R naming conventions:\n")
print(names(df))

df$Age_ZScore  <- scale(df$Age)
df$Fare_ZScore <- scale(df$Fare)


cat("\n12. Age and Fare standardized using Z-score normalization (scale).\n")
print(head(data.frame(Original_Age = df$Age, Age_Z = df$Age_ZScore, 
                      Original_Fare = df$Fare, Fare_Z = df$Fare_ZScore), 5))


print("-----------------------------------------------------")
print("Univariate Analysis")

cat("=== 13. Descriptive Statistics for All Numerical Variables ===\n")
# summary() gives Min, 1st Qu, Median, Mean, 3rd Qu, and Max for all columns
print(summary(df))

numeric_vars <- df[sapply(df, is.numeric)]

num_summary <- data.frame(
  Mean = sapply(numeric_vars, mean, na.rm = TRUE),
  Median = sapply(numeric_vars, median, na.rm = TRUE),
  Std_Dev = sapply(numeric_vars, sd, na.rm = TRUE),
  Min = sapply(numeric_vars, min, na.rm = TRUE),
  Max = sapply(numeric_vars, max, na.rm = TRUE)
)
print(num_summary)

# -------------------------------------------------------------------------
fare_mean   <- mean(df$Fare, na.rm = TRUE)
fare_median <- median(df$Fare, na.rm = TRUE)
fare_var    <- var(df$Fare, na.rm = TRUE)
fare_sd     <- sd(df$Fare, na.rm = TRUE)

fare_mode   <- get_mode(df$Fare)

cat("Mean:", fare_mean, "\n")
cat("Median:", fare_median, "\n")
cat("Mode:", fare_mode, "\n")
cat("Variance:", fare_var, "\n")
cat("Standard Deviation:", fare_sd, "\n")

# -------------------------------------------------------------------------
# Question 15: Compute the range, quartiles, and interquartile range (IQR) of Age.
# -------------------------------------------------------------------------
age_range <- range(df$Age, na.rm = TRUE)
age_quartiles <- quantile(df$Age, probs = c(0.25, 0.5, 0.75), na.rm = TRUE)
age_iqr <- IQR(df$Age, na.rm = TRUE)

cat("\n=== 15. Age Statistics ===\n")
cat("Range (Min to Max):", age_range[1], "to", age_range[2], "\n")
cat("Quartiles (25%, 50%, 75%):\n")
print(age_quartiles)
cat("Interquartile Range (IQR):", age_iqr, "\n")

hist(df$Age, 
     main = "Histogram of Age", 
     xlab = "Age", 
     col = "skyblue", 
     border = "black",
     breaks = 15)

hist(df$Fare, 
     main = "Histogram of Fare", 
     xlab = "Fare", 
     col = "lightgreen", 
     border = "black",
     breaks = 20)


plot(density(df$Age, na.rm = TRUE), 
     main = "Density Plot of Age", 
     xlab = "Age", 
     col = "blue", 
     lwd = 2)

plot(density(df$Fare, na.rm = TRUE), 
     main = "Density Plot of Fare", 
     xlab = "Fare", 
     col = "darkgreen", 
     lwd = 2)

bp_age <- boxplot(df$Age, 
                  main = "Boxplot of Age (Outliers)", 
                  ylab = "Age", 
                  col = "orange")

bp_fare <- boxplot(df$Fare, 
                   main = "Boxplot of Fare (Outliers)", 
                   ylab = "Fare", 
                   col = "coral")
cat("\n=== 18. Outlier Detection ===\n")
cat("Age Outliers:", bp_age$out, "\n")
cat("Fare Outliers (Extreme high ticket prices):", bp_fare$out, "\n")

class_counts <- table(df$Pclass)
barplot(class_counts, 
        main = "Frequency of Passenger Class", 
        xlab = "Passenger Class", 
        ylab = "Frequency", 
        col = c("gold", "orange", "brown"))

sex_counts <- table(df$Sex)
barplot(sex_counts, 
        main = "Frequency of Gender", 
        xlab = "Gender", 
        ylab = "Frequency", 
        col = c("pink", "lightblue"))
# Question 20: Interpret the distribution of passengers based on age and fare.
# -------------------------------------------------------------------------
cat("\n=== 20. Interpretation of Age and Fare Distributions ===\n")
cat("1. Age Distribution: The age distribution is typically right-skewed (or mound-shaped with a peak among young adults), indicating that a majority of the passengers on the Titanic were young adults (ages 20-40), along with a smaller proportion of children and elderly passengers.\n")
cat("2. Fare Distribution: The fare distribution is heavily right-skewed. Most passengers paid relatively low ticket prices (traveling in 3rd class), while a small minority of wealthy passengers paid exceptionally high fares (traveling in 1st class), resulting in numerous high-end outliers in the boxplot.\n")

# =========================================================================
# Part C: Bivariate Data Analysis on Titanic Dataset
# =========================================================================

# -------------------------------------------------------------------------
# Question 21: Create a scatter plot of Age vs Fare with appropriate labels.
# -------------------------------------------------------------------------
plot(df$Age, df$Fare,
     main = "Scatter Plot of Age vs Fare",
     xlab = "Age (Years)",
     ylab = "Fare (Ticket Price)",
     col = "darkblue",
     pch = 16,
     cex = 1.2)
grid()


# -------------------------------------------------------------------------
# Question 22: Compute the Pearson correlation coefficient between Age and Fare.
# -------------------------------------------------------------------------
cor_age_fare <- cor(df$Age, df$Fare, use = "complete.obs")
cat("\n=== 22. Correlation Analysis ===\n")
cat("Pearson correlation coefficient between Age and Fare:", round(cor_age_fare, 4), "\n")


# -------------------------------------------------------------------------
# Question 23: Draw grouped boxplots of Fare by Passenger Class.
# -------------------------------------------------------------------------
# Using formula syntax: Fare ~ Pclass (plots Fare grouped by Passenger Class)
boxplot(Fare ~ Pclass, data = df,
        main = "Fare Distribution by Passenger Class",
        xlab = "Passenger Class (Pclass)",
        ylab = "Fare",
        col = c("gold", "red", "brown"),
        border = "black")


# -------------------------------------------------------------------------
# Question 24: Create grouped boxplots of Age by Gender.
# -------------------------------------------------------------------------
boxplot(Age ~ Sex, data = df,
        main = "Age Distribution by Gender",
        xlab = "Gender",
        ylab = "Age (Years)",
        col = c("pink", "lightblue"),
        border = "black")


# -------------------------------------------------------------------------
# Question 25: Generate a stacked bar chart of Survival Status by Gender.
# -------------------------------------------------------------------------
# Create a 2-way contingency table for Sex and Survived
gender_survival_table <- table(df$Sex, df$Survived)

barplot(gender_survival_table,
        main = "Survival Status by Gender",
        xlab = "Survival Status (No / Yes)",
        ylab = "Number of Passengers",
        col = c("pink", "lightblue"),
        legend.text = TRUE,
        args.legend = list(x = "topright", bty = "n"))


# -------------------------------------------------------------------------
# Question 26: Create a contingency table for Pclass and Survived.
# -------------------------------------------------------------------------
pclass_survived_table <- table(df$Pclass, df$Survived)
cat("\n=== 26. Contingency Table: Pclass vs Survived ===\n")
print(pclass_survived_table)


# -------------------------------------------------------------------------
# Question 27: Perform a Chi-square test to examine the association between 
# Passenger Class and Survival.
# -------------------------------------------------------------------------
chi_sq_result <- chisq.test(pclass_survived_table)
cat("\n=== 27. Chi-Square Test of Independence (Pclass vs Survived) ===\n")
print(chi_sq_result)


# -------------------------------------------------------------------------
# Question 28: Interpret the relationship between gender, class, and survival.
# -------------------------------------------------------------------------
cat("\n=== 28. Interpretation of Relationships (Gender, Class, and Survival) ===\n")
cat("1. Gender & Survival: Women had a significantly higher survival rate compared to men, adhering to the 'women and children first' evacuation protocol during the disaster.\n")
cat("2. Class & Survival: Passenger class strongly influenced survival outcomes (confirmed by a very low p-value in the Chi-square test). First-class passengers had a much higher probability of survival due to better cabin locations and priority access to lifeboats, whereas third-class passengers faced higher fatality rates.\n")
cat("3. Combined Impact: Both gender and socio-economic class were primary determinants of survival likelihood aboard the Titanic.\n")

# =========================================================================
# Part D: Multivariate Data Analysis & Advanced Techniques
# =========================================================================

# -------------------------------------------------------------------------
# Question 29: Generate a scatter plot matrix for all numerical variables.
# -------------------------------------------------------------------------
# Extract only numerical variables for the matrix
numeric_df <- df[sapply(df, is.numeric)]

# pairs() creates a scatter plot matrix (pairwise scatter plots)
pairs(numeric_df,
      main = "Scatter Plot Matrix of Numerical Variables",
      col = "darkblue",
      pch = 16)


# -------------------------------------------------------------------------
# Question 30: Compute and display the correlation matrix.
# -------------------------------------------------------------------------
# use = "complete.obs" ensures missing values are handled
cor_matrix <- cor(numeric_df, use = "complete.obs")

cat("\n=== 30. Correlation Matrix ===\n")
print(round(cor_matrix, 4))


# -------------------------------------------------------------------------
# Question 31: Visualize the correlation matrix using a heatmap.
# -------------------------------------------------------------------------
# Base R heatmap() function visualizes the correlation matrix
# rev() and heat.colors or cm.colors can be used for aesthetic color palettes
heatmap(cor_matrix,
        main = "Heatmap of Correlation Matrix",
        col = heat.colors(256),
        symm = TRUE,              # Symmetric matrix
        margins = c(8, 8))


# -------------------------------------------------------------------------
# Question 32: Perform Principal Component Analysis (PCA) on numerical variables.
# -------------------------------------------------------------------------
# scale. = TRUE standardizes the variables to have mean = 0 and variance = 1
pca_result <- prcomp(numeric_df, scale. = TRUE, center = TRUE)

cat("\n=== 32. PCA Summary & Component Loadings ===\n")
print(summary(pca_result))
print(pca_result$rotation) # Shows loadings of variables on each principal component


# -------------------------------------------------------------------------
# Question 33: Plot the first two principal components colored by survival status.
# -------------------------------------------------------------------------
# Extract scores of PC1 and PC2
pc_scores <- as.data.frame(pca_result$x)

# Plot PC1 vs PC2, colored by Survived (assuming df$Survived is a factor: 0/1 or No/Yes)
plot(pc_scores$PC1, pc_scores$PC2,
     main = "PCA: PC1 vs PC2 Colored by Survival",
     xlab = "Principal Component 1 (PC1)",
     ylab = "Principal Component 2 (PC2)",
     col = as.numeric(df$Survived) + 1,  # Color coding by survival status
     pch = 16,
     cex = 1.2)

legend("topright", 
       legend = levels(df$Survived), 
       col = c(2, 3), 
       pch = 16, 
       title = "Survived")
grid()


# -------------------------------------------------------------------------
# Question 34: Identify the variables with the highest contribution to PC1 and PC2.
# -------------------------------------------------------------------------
cat("\n=== 34. Variable Contributions (Loadings) to PC1 and PC2 ===\n")
loadings <- pca_result$rotation[, 1:2]
print(loadings)

# Find variable with maximum absolute loading for PC1 and PC2
pc1_top_var <- rownames(loadings)[which.max(abs(loadings[, "PC1"]))]
pc2_top_var <- rownames(loadings)[which.max(abs(loadings[, "PC2"]))]

cat("Variable with highest contribution to PC1:", pc1_top_var, "\n")
cat("Variable with highest contribution to PC2:", pc2_top_var, "\n")


# -------------------------------------------------------------------------
# Question 35: Summarize the major multivariate patterns observed in the dataset.
# -------------------------------------------------------------------------
cat("\n=== 35. Summary of Major Multivariate Patterns ===\n")
cat("1. Correlation Structure: Numerical variables exhibit distinct linear interdependencies, visible as clusters and linear trends in the scatter plot matrix and highlighted by high/low values in the correlation matrix heatmap.\n")
cat("2. Dimensionality Reduction: PCA successfully compresses multi-attribute numeric data into orthogonal principal components (PC1 and PC2), capturing the primary variance of the dataset.\n")
cat("3. Survival Separation: The PCA scatter plot (PC1 vs PC2) colored by survival status reveals underlying structural patterns, showing how multi-variable attributes cluster together relative to passenger survival outcomes.\n")