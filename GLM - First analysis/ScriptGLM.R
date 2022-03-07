
# Data analysis: GLM Toumeyella - Di Sora et al.
# Last update 31 December 2021
# E-mail: luca.rossini@unitus.it

# First part of the analysis: efficacy of the treatment with abamectin and preference of the individuals towards leaves or twigs

# Data acquisition and variable settings - File: 'DatasetGLM.csv'
# This is the first analysis: GLM with negative binomial distribution carried out
# independently on twigs, leaves and twigs+leaves considering time and treatment as
# factors.

# Data acquisition and array assignation

data_split = read.csv2(file.choose(), header=T, sep=";", dec=".", na.string="NA")
head(data_split)

tempo_split <- as.factor(data_split$Data)
trattamento_split <- as.factor(data_split$Trattamento)
pianta_split <- as.factor(data_split$Pianta)
posizione_split <- as.factor(data_split$Posizione)
popolazione_split <- as.numeric(data_split$Popolazione)


# GLM:
# Factors are the sampling date, treatment and position.
# Negative binomial as GLM distribution - It requires "lme4" package

library(lme4)

GenLin_split <- glmer.nb(popolazione_split ~ trattamento_split + posizione_split + (1 | pianta_split), data=data_split)
summary(GenLin_split)

# Pairwise comparison:

library(multcompView)
library(emmeans)
marginal_split = emmeans(GenLin_split, ~ trattamento_split + posizione_split)
pairs(marginal_split, adjust="bonferroni")

# Letters of significance:

library(multcomp)
lettere_split <- cld(marginal_split, alpha=0.05, Letters=letters, adjust="bonferroni")
lettere_split
