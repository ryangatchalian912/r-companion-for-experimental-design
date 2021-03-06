# ANOVA One-factor between subjects, S(A)
# Imagery and Memory

# We have 1 Factor, A, with 2 levels: Experimental Group and Control Group.
# We have 5 subjects per group. Therefore 5 x 2 = 10 subjects total.

# We collect the data for each level of Factor A
expt    = c(1, 2, 5, 6, 6)
control = c(8, 8, 9, 11, 14)

# We now combine the observations into one long column (score)
score = c(expt, control)

# We generate a second column (group), that identifies the group for
# each score.
levels = factor(c(rep("expt", 5), rep("control", 5)))

# We now form a data frame with the dependent variable and the factors
data = data.frame(score = score, group = levels)
print(data)

# We now generate the ANOVA table based on the linear model
aov1 = aov(score ~ levels)
print(aov1)
print(summary(aov1))

# We now print the data and all the results
print(model.tables(aov1, type = "means"), digits = 3)
