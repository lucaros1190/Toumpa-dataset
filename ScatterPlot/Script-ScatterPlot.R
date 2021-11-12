# Means of the population abundances of the two treatments, scatterplots with errorbars

# Dataset

data_scatterplot = read.csv2(file.choose(), header=T, sep=";", dec=".", na.string="NA")
head(data_scatterplot)


tempo <- as.factor(data_scatterplot$Date)
trattato <- as.numeric(data_scatterplot$Trattato)
controllo <- as.numeric(data_scatterplot$Controllo)
abamectina <- as.numeric(data_scatterplot$Abamectina)

library(gplots)

# Plotmeans untreated plants data

plotmeans(controllo ~ tempo, data = data_scatterplot, 
          frame = TRUE,
          connect = TRUE, 
          barwidth = 3, 
          barcol = "red",
          pch = 20,
          lwd = 3,
          col = "red",
          n.label = FALSE,
          main = "", 
          xlab = "Time (days)", 
          ylab = "Population abundance (n° individuals)", 
          ylim = c(0,400),
          cex.lab = 1.5,
          cex.axis = 1.5)

# Allows the second barplot to be overwritten on top of the first one

par(new=TRUE)

# Plotmeans treated plants data

plotmeans(trattato ~ tempo, data = data_scatterplot, frame = TRUE,
          mean.labels = FALSE, n.label = FALSE, connect = TRUE, lwd = 3, barwidth = 3, barcol = "blue", col = "blue", main = "", xlab = "", ylab = "", ylim = c(0,400), cex.lab = 1.5, cex.axis = 1.5)

# Adding the legend

legend("topright", c("untreated", "treated"),
       lty = c(1,1),
       col = c("red", "blue"),
       cex = 1.4)
