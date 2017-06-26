# Regression Example: Memory Set and Reaction Time

# We first arrange the data into the Predictors (X) and Regressor (Y)
# In this example, the predictors are the sizes of the memory set and
# the regressors are the reaction time of the participants.
X    = c(1, 1, 1, 1, 1, 3, 3, 3, 3, 3, 5, 5, 5, 5, 5, 7, 7, 7, 7, 7)
Y    = c(433, 435, 434, 441, 457, 519, 511, 513, 520, 537, 598, 584, 606, 605, 607, 666, 674, 683, 685, 692)
data = data.frame(X, Y)

# We now get a summary of simple statistics for the data
mean    = sapply(data, mean)
std_dev = sapply(data, sd)
r       = cor(X, Y)

# We now perform the regression analysis on the data
reg1 = lm(Y ~ X)

# We now perform an ANOVA on the data
aov1 = aov(Y ~ X)

#
# We now plot the points and the regression line and SAVE the plot as a PDF
#
# NOTE:
#     Make sure to add the PATH to the location where the plot is to be saved
#
pdf('reg_plot.pdf')
plot(X, Y, main = "Plot of Memory Set (X) vs Reaction Time (Y)")
abline(reg1)
dev.off()

# We now print the data and all the results
print(data)
print(mean)
print(std_dev)
print(r)
print(summary(reg1))
print(summary(aov1))
