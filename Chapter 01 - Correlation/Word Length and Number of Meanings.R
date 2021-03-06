# Correlation Example: Word Length and Number of Meanings

# We first enter the data under two different variable names
length   = c(3, 6, 2, 6, 2, 9, 6, 5, 9, 4, 7, 11, 5, 4, 3, 9, 10, 5, 4, 10)
meanings = c(8, 4, 10, 1, 11, 1, 4, 3, 1, 6, 2, 1, 9, 3, 4, 1, 3, 3, 3, 2)

# Create data frame
data = data.frame(length, meanings)
print(data)

# We now get a summary of simple statistics for the data
mean = sapply(data, mean)
print(mean)

std_dev = sapply(data, sd)
print(std_dev)

# We now perform a correlation and a test on the data which gives
# confidence intervals
cor1 = cor.test(length, meanings, method = c("pearson"))
print(cor1)

# We now perform a regression analysis on the data
reg1 = lm(length ~ meanings)
print(summary(reg1))

# We now perform an ANOVA on the data
aov1 = aov(length ~ meanings)
print(summary(aov1))

#
# We now plot the points and SAVE the plot as a PDF
#
# NOTE:
#     Make sure to add the PATH to the location where the plot is
#     to be saved
#
pdf('corr_plot.pdf')
plot(length, meanings, main = "Plot of Length vs Meanings")
dev.off()
