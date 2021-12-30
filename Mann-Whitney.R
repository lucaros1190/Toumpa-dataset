
# Data analysis: Mann-Whitney U test Toumeyella - Di Sora et al.
# Last update 31 December 2021
# E-mail: luca.rossini@unitus.it

# Second part of the analysis: Comparison analysis between treated and untreated data within each sampling date

# Data acquisition and variable settings - File: 'DatasetMWT.csv'
# This is the second analysis: Mann-Whitney U test repeated within each sampling date independently.
# We aimed to compare treated and untreated plants to define the timing of the treatment with abamectin


# Libraries

library(multcompView)
library(emmeans)

# Data acquisition and array assignation

data_kruskal = read.csv2(file.choose(), header=T, sep=";", dec=".", na.string="NA")
head(data_kruskal)

trattamento <- as.factor(data_kruskal$Trattamento)
exp1 <- as.numeric(data_kruskal$Tot_exp1)
exp2 <- as.numeric(data_kruskal$Tot_exp2)
exp3 <- as.numeric(data_kruskal$Tot_exp3)
exp4 <- as.numeric(data_kruskal$Tot_exp4)
exp5 <- as.numeric(data_kruskal$Tot_exp5)
exp6 <- as.numeric(data_kruskal$Tot_exp6)
exp7 <- as.numeric(data_kruskal$Tot_exp7)
exp8 <- as.numeric(data_kruskal$Tot_exp8)
exp9 <- as.numeric(data_kruskal$Tot_exp9)

# Comparisons

# Date 1 - 8 Jun

wilcox.test(exp1 ~ trattamento,
            p.adjust.method = "BH")

# Date 2 - 23 Jun

wilcox.test(exp2 ~ trattamento,
            p.adjust.method = "BH")

# Date 3 - 8 Jul

wilcox.test(exp3 ~ trattamento,
            p.adjust.method = "BH")

# Date 4 - 23 Jul

wilcox.test(exp4 ~ trattamento,
            p.adjust.method = "BH")

# Date 5 - 6 Aug

wilcox.test(exp5 ~ trattamento,
            p.adjust.method = "BH")

# Date 6 - 27 Aug

wilcox.test(exp6 ~ trattamento,
            p.adjust.method = "BH")

# Date 7 - 15 Sep

wilcox.test(exp7 ~ trattamento,
            p.adjust.method = "BH")

# Date 8 - 30 Sep

wilcox.test(exp8 ~ trattamento,
            p.adjust.method = "BH")
# Date 9 - 15 Oct

wilcox.test(exp9 ~ trattamento,
            p.adjust.method = "BH")

