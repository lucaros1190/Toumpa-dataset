
# Plots: Figures Toumeyella - Di Sora et al.
# Last update 31 December 2021
# E-mail: nico.disora@unitus.it

# Scatterplots with errorbars: File 'DatasetScattPlot.csv'

# Data acquisition and array assignation

data_scatterplot = read.csv2(file.choose(), header=T, sep=";", dec=".", na.string="NA")
head(data_scatterplot)


tempo <- as.factor(data_scatterplot$Date)
trattato <- as.numeric(data_scatterplot$Trattato)
controllo <- as.numeric(data_scatterplot$Controllo)
abamectina <- as.numeric(data_scatterplot$Abamectina)
ramot <- as.numeric(data_scatterplot$Ramot)
fogliat <- as.numeric(data_scatterplot$Fogliat)
ramoc <- as.numeric(data_scatterplot$Ramoc)
fogliac <- as.numeric(data_scatterplot$Fogliac)


library(gplots)

# Plotmeans untreated plants data

par(mfrow=c(2,1))

plotmeans(ramoc ~ tempo, data = data_scatterplot, 
          frame = TRUE,
          connect = TRUE, 
          barwidth = 3, 
          barcol = "red",
          pch = 20,
          lwd = 3,
          col = "red",
          n.label = FALSE,
          main = "", 
          xlab = "", 
          ylab = "", 
          ylim = c(0,120),
          cex.lab = 1.5,
          cex.axis = 1.5)

# Allows the second barplot to be overwritten on top of the first one

par(new=TRUE)

# Plotmeans treated plants data

plotmeans(ramot ~ tempo, data = data_scatterplot, frame = TRUE,
          mean.labels = FALSE, n.label = FALSE, connect = TRUE, lwd = 3, barwidth = 3, barcol = "blue", col = "blue", main = "", xlab = "", ylab = "", ylim = c(0,120), cex.lab = 1.5, cex.axis = 1.5)

# Adding abamectin variable

par(new=TRUE)
plot(tempo, abamectina, lty=0, lwd=0, pch=0,  xlab="", ylab="", ylim=c(0,0.146), 
     axes=FALSE, type="0", col="red")
axis(4, ylim=c(0,0.146),cex.axis=1.5, col="black",col.axis="black")

lines(tempo, abamectina, lwd=2, lty=6, col = "black")

# Adding the legend

legend("topright", c("Untreated", "Treated", "Abamectin"),
       lty = c(1,1,1),
       lwd = 4,
       col = c("red", "blue", "black"),
       box.lty = 1, box.lwd = 1,
       cex = 1.5)

# Second graph

plotmeans(fogliac ~ tempo, data = data_scatterplot, 
          frame = TRUE,
          connect = TRUE, 
          barwidth = 3, 
          barcol = "red",
          pch = 20,
          lwd = 3,
          col = "red",
          n.label = FALSE,
          main = "", 
          xlab = "", 
          ylab = "", 
          ylim = c(0,10),
          cex.lab = 1.5,
          cex.axis = 1.5)

# Allows the second barplot to be overwritten on top of the first one

par(new=TRUE)

# Plotmeans treated plants data

plotmeans(fogliat ~ tempo, data = data_scatterplot, frame = TRUE,
          mean.labels = FALSE, n.label = FALSE, connect = TRUE, lwd = 3, barwidth = 3, barcol = "blue", col = "blue", main = "", xlab = "", ylab = "", ylim = c(0,10), cex.lab = 1.5, cex.axis = 1.5)

# Adding abamectin variable

par(new=TRUE)
plot(tempo, abamectina, lty=0, lwd=0, pch=0,  xlab="", ylab="", ylim=c(0,0.146), 
     axes=FALSE, type="0", col="red")
mtext("",cex=1.5,side=4,col="black")
axis(4, ylim=c(0,0.146),cex.axis=1.5, col="black",col.axis="black")

lines(tempo, abamectina, lwd=2, lty=6, col = "black")


