# Regression Example: Age, Speech Rate and Memory Span

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
# In this example the predictors are Age (X) and Speech Rate (T)
X = c(4, 4, 7, 7, 10, 10)
T = c(1, 2, 2, 4, 3, 6)

# The Regressors are the number of words correctly recalled (Y).
Y = c(14, 23, 30, 50, 39, 67)

# Create data frame
data = data.frame(X, T, Y)
print(data)

# We now get a summary of simple statistics for the data
mean = sapply(data, mean)
print(mean)

std_dev = sapply(data, sd)
print(std_dev)

# Now we perform an orthogonal multiple regression analysis on the data
multi_reg1 = ols(Y ~ X + T)
print(multi_reg1)

# Now we compute the predicted values and the residuals
Y_hat       = round(predict(multi_reg1), 2)
residual    = round(residuals(multi_reg1), 2)
predictions = data.frame(Y, Y_hat, residual)
print(predictions)

# We now compute the sum of squares of the residuals
ss_residual = sum(residual ^ 2)
print(ss_residual)

# Now we compute the correlation matrix between the variables
r    = cor(data)
corr = round(r, 4)
print(corr)

# Now we perform an ANOVA on the data that shows the semi-partial
# sums of squares
aov1 = anova(multi_reg1)
print(aov1)

#
# We now compute the semi-partial coefficients and create a plot
#
# NOTE:
#     Make sure to add the PATH to the location where the plot is
#     to be saved
#
pdf("semi_part_corr.pdf")
semi_part = plot(aov1, what = "partial R2")
dev.off()
print(semi_part)
