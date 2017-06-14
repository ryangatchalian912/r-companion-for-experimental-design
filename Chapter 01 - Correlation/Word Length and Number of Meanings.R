# Correlation Example: Word Length and Number of Meanings
# We first enter the data under two different variables names
Length=c(3,6,2,6,2,9,6,5,9,4,7,11,5,4,3,9,10,5,4,10)
Meanings=c(8,4,10,1,11,1,4,3,1,6,2,1,9,3,4,1,3,3,3,2)
data=data.frame(Length, Meanings)

# We now get a summary of simple statistics for the data
Mean=sapply(data, mean)
Std_Dev=sapply(data, sd)

# We now plot the points and SAVE it as a PDF
# Make sure to add the PATH to the location where the plot is
# to be saved
pdf('C:\\Users\\ryan.gatchalian\\Documents\\exercises\\PROG - R Programming\\R Companion for Experimental Psychology\\Chapter 01 - Correlation\\corr_plot.pdf')
plot(Length, Meanings, main="Plot of Length vs Meanings")
dev.off()

# We now perform a correlation and a test on the data which gives
# confidence intervals
cor1=cor.test(Length, Meanings, method = c("pearson"))

# We now perform a regression analysis on the data
reg1=lm(Length~Meanings)

# We now perform an ANOVA on the data
aov1=aov(Length~Meanings)

# We now print the data and all the results
print(data)
print(Mean)
print(Std_Dev)
print(cor1)
summary(reg1)
summary(aov1)