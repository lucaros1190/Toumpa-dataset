# Barplots twigs + leaves (untreated and treated)

library(stats)
library(babynames)
library(dplyr)
library(ggplot2)

# Dataset acquisition

data_sommati = read.csv2(file.choose(), header=T, sep=";", dec=".", na.string="NA")
head(data_sommati)

tempo <- as.factor(data_sommati$Data)
trattato <- as.numeric(data_sommati$Trattato)
controllo <- as.numeric(data_sommati$Controllo)
abamectina <- as.numeric(data_sommati$Abamectina)
fogliaT <- as.numeric(data_sommati$Fogliat)
fogliaC <- as.numeric(data_sommati$Fogliac)
ramoT <- as.numeric(data_sommati$Ramot)
ramoC <- as.numeric(data_sommati$Ramoc)

# Two plots on the same row

par(mfrow=c(1,2))

# Barplot "Control"

barplot(controllo, 
        main = "Trend untreated plants",
        xlab = "Time (days)",
        ylab = "Population abundance (n° individuals)",
        ylim=c(0,10000),
        cex.axis=1.5,
        cex.names=1.5,
        cex.lab=1.4,
        names.arg = c("8 Jun", "23 Jun", "8 Jul", "23 Jul", "6 Aug", "27 Aug", "15 Sep", "30 Sep"),
        col = "dodgerblue3",)

# Allows the second barplot to be overwritten on top of the first one

par(new=TRUE)

# Barplot to overwrite

barplot(fogliaC, 
        main = "",
        xlab = "",
        ylab = "",
        names.arg = c(""),
        col = "chocolate1",
        ylim=c(0,10000), 
        axes=FALSE)

# Adding abamectin variable

par(new=TRUE)
plot(tempo, abamectina, lty=0, lwd=2, pch=15,  xlab="", ylab="", ylim=c(0,0.146), 
     axes=FALSE, type="1", col="red")

lines(tempo, abamectina, lwd=4, col = "red")
points(tempo, abamectina,  pch = 19, col = "red")

# Barplot "treated"

barplot(trattato, 
        main = "Trend treated plants",
        xlab = "Time (days)",
        ylab = "",
        ylim=c(0,10000),
        axes=FALSE,
        cex.axis=1.5,
        cex.names=1.5,
        cex.lab=1.4,
        names.arg = c("8 Jun", "23 Jun", "8 Jul", "23 Jul", "6 Aug", "27 Aug", "15 Sep", "30 Sep"),
        col = "dodgerblue3",)

# Allows the second barplot to be overwritten on top of the first one

par(new=TRUE)

# Barplot to overwrite

barplot(fogliaT, 
        main = "",
        xlab = "",
        ylab = "",
        names.arg = c(""),
        col = "chocolate1",
        ylim=c(0,10000), 
        axes=FALSE)

# Adding abamectin variable

par(new=TRUE)
plot(tempo, abamectina, lty=0, lwd=2, pch=15,  xlab="", ylab="", ylim=c(0,0.146), 
     axes=FALSE, type="1", col="red")
mtext("Abamectin (mg/kg)",cex=1.5,side=4,col="black")
axis(4, ylim=c(0,0.146),cex.axis=1.5, col="black",col.axis="black")

lines(tempo, abamectina, lwd=4, col = "red")
points(tempo, abamectina,  pch = 19, col = "red")

# Drawing the map

legend("topright", c("twigs", "leaves", "abamectin"),
       lty = c(0,0,1),
       pch = c(15,15,20),
       col = c("dodgerblue3", "chocolate1", "red"),
       cex = 1.1)
