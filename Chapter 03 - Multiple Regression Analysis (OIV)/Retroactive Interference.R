# Regression Example: Retroactive Interference

# NOTE: Install and load package "rms" in order to use the "ols"
# function.

# TODO:
#     Install these packages first via
#     install.packages("package-name")
#     if they aren't yet installed

# Import required packages
if (!require(zoo))
{
    install.packages("zoo")
    library(zoo)
}

if (!require(mvtnorm))
{
    install.packages("mvtnorm")
    library(mvtnorm)
}

if (!require(rms))
{
    install.packages("rms")
    library(rms)
}

# We first arrange the data into the Predictors (X and T) and Regressor (Y)
# In this example the predictors are Number of Learning Trials (X) and
# Number of interpolated lists (T)
X = c(2, 2, 2, 4, 4, 4, 8, 8, 8, 2, 2, 2, 4, 4, 4, 8, 8, 8)
T = c(2, 4, 8, 2, 4, 8, 2, 4, 8, 2, 4, 8, 2, 4, 8, 2, 4, 8)

# The Regressors are the number of words correctly recalled (Y).
Y = c(35, 21, 6, 40, 34, 18, 61, 58, 46, 39, 31, 8, 52, 42, 26, 73, 66, 52)

# Create data frame
data = data.frame(X, T, Y)
print(data)

# We now get a summary of simple statistics for the data
mean = sapply(data, mean)
print(mean)

std_dev = sapply(data, sd)
print(std_dev)

# We now perform an orthogonal multiple regression analysis on the data
multi_reg1 = ols(Y ~ X + T)
print(multi_reg1)

# We now compute the predicted values and the residuals
Y_hat       = predict(multi_reg1)
residual    = round(residuals(multi_reg1), 2)
predictions = data.frame(Y, Y_hat, residual)
print(predictions)

# We now compute the sum of squares of the residuals
SS_residual = sum(residual ^ 2)
print(SS_residual)

# We now compute the correlation matrix between the variables
r    = cor(data)
corr = round(r, 4)
print(corr)

#
# We now compute the semi-partial coefficients and create a plot
#
# NOTE:
#     Make sure to add the PATH to the location where the plot is
#     to be saved
#
pdf("semi_part_corr.pdf")
semi_part = plot(anova(multi_reg1), what = "partial R2")
dev.off()
print(semi_part)

# We now perform an ANOVA on the data that shows the semi-partial
# sums of squares
aov1 = anova(multi_reg1)
print(aov1)
