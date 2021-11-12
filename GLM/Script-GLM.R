
# Data analysis: GLM Toumeyella

# Dataset and variables

data_complete = read.csv2(file.choose(), header=T, sep=";", dec=".", na.string="NA")
head(data_complete)


tempo <- as.factor(data_complete$Data)
trattamento <- as.factor(data_complete$Trattamento)
ramo <- as.numeric(data_complete$Rametto)
foglia <- as.numeric(data_complete$Foglia)
totale <- as.numeric(data_complete$Totale)


# GLM - Twigs significant differences:

GenLin_ramo <- glm(ramo ~ trattamento, family="poisson", data=data_complete)
summary(GenLin_ramo)

# Pairwise comparison:

library(multcompView)
library(emmeans)
marginal_ramo = emmeans(GenLin_ramo, ~ trattamento)
pairs(marginal_ramo, adjust="bonferroni")

# Significance letters:

library(multcomp)
lettere_ramo <- cld(marginal_ramo, alpha=0.05, Letters=letters, adjust="bonferroni")
lettere_ramo


# GLM - Leaves significant differences:

GenLin_foglie <- glm(foglia ~ trattamento, family="poisson", data=data_complete)
summary(GenLin_foglie)

# Pairwise comparison:

library(multcompView)
library(emmeans)
marginal_foglie = emmeans(GenLin_foglie, ~ trattamento)
pairs(marginal_foglie, adjust="bonferroni")

# Significance letters:

library(multcomp)
lettere_foglie <- cld(marginal_foglie, alpha=0.05, Letters=letters, adjust="bonferroni")
lettere_foglie


# GLM - Twigs + Leaves significant differences:

GenLin_tot <- glm(totale ~ trattamento, family="poisson", data=data_complete)
summary(GenLin_tot)

# Pairwise comparison:

library(multcompView)
library(emmeans)
marginal_tot = emmeans(GenLin_tot, ~ trattamento)
pairs(marginal_tot, adjust="bonferroni")

# Significance letters:

library(multcomp)
lettere_tot <- cld(marginal_tot, alpha=0.05, Letters=letters, adjust="bonferroni")
lettere_tot


# Boxplot treatment vs twig

library(ggplot2)
boxplot_ramo <- ggplot(data_complete, aes(x=trattamento, y=ramo, fill=tempo)) + 
  geom_boxplot(width=0.43) + xlab("Treatment") + ylab("Population") + ggtitle("Branch samplings") +
  theme(legend.position = "right", plot.title = element_text(hjust=0.5), text = element_text(size=21))

boxplot_ramo

# Boxplot treatment vs leaves

library(ggplot2)
boxplot_foglie <- ggplot(data_complete, aes(x=trattamento, y=foglia, fill=tempo)) + 
  geom_boxplot(width=0.43) + xlab("Treatment") + ylab("Population") + ggtitle("Leaf samplings") +
  theme(legend.position = "right", plot.title = element_text(hjust=0.5), text = element_text(size=21))

boxplot_foglie

# Boxplot treatment vs total

library(ggplot2)
boxplot_totale <- ggplot(data_complete, aes(x=trattamento, y=totale, fill=tempo)) + 
  geom_boxplot(width=0.43) + xlab("Treatment") + ylab("Population") + ggtitle("Branch and leaf samplings") +
  theme(legend.position = "right", plot.title = element_text(hjust=0.5), text = element_text(size=21))

boxplot_totale


# Three plots on the same figure

library(ggpubr)
grid_plot <- ggarrange(boxplot_ramo, boxplot_foglie, boxplot_totale, ncol =1, nrow= 3, common.legend = TRUE, legend = "right")
grid_plot

