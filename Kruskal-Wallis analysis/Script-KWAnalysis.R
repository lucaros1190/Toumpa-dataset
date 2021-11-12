# Comparison analysis between treated and untreated data within each sampling date

library(multcompView)
library(emmeans)

# Dataset acquisition

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

# Date 1
# Kruskal Wallis test
kruskal.test(exp1 ~ trattamento, data = data_kruskal)

# Pairwise comparison
wilcox.test(exp1 ~ trattamento,
            p.adjust.method = "BH")

# Date 2
# Kruskal Wallis test
kruskal.test(exp2 ~ trattamento, data = data_kruskal)

# Pairwise comparison
wilcox.test(exp2 ~ trattamento,
            p.adjust.method = "BH")

# Date 3
# Kruskal Wallis test
kruskal.test(exp3 ~ trattamento, data = data_kruskal)

# Pairwise comparison
wilcox.test(exp3 ~ trattamento,
            p.adjust.method = "BH")

# Date 4
# Kruskal Wallis test
kruskal.test(exp4 ~ trattamento, data = data_kruskal)

# Pairwise comparison
wilcox.test(exp4 ~ trattamento,
            p.adjust.method = "BH")

# Date 5
# Kruskal Wallis test
kruskal.test(exp5 ~ trattamento, data = data_kruskal)

# Pairwise comparison
wilcox.test(exp5 ~ trattamento,
            p.adjust.method = "BH")

# Date 6
# Kruskal Wallis test
kruskal.test(exp6 ~ trattamento, data = data_kruskal)

# Pairwise comparison
wilcox.test(exp6 ~ trattamento,
            p.adjust.method = "BH")

# Date 7
# Kruskal Wallis test
kruskal.test(exp7 ~ trattamento, data = data_kruskal)

# Pairwise comparison
wilcox.test(exp7 ~ trattamento,
            p.adjust.method = "BH")

# Date 8
# Kruskal Wallis test
kruskal.test(exp8 ~ trattamento, data = data_kruskal)

# Pairwise comparison
wilcox.test(exp8 ~ trattamento,
            p.adjust.method = "BH")
