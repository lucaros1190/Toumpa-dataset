
# Correlation analysis

data_corr = read.csv2(file.choose(), header=T, sep=";", dec=".", na.string="NA")
head(data_corr)

sampling_date <- as.factor(data_corr$Date)
multires <- as.numeric(data_corr$Residual)
population <- as.numeric(data_corr$Population)

# Creating di C-squares variable 
square_multires <- multires^2

# Doing the fit
fit_parabola <- lm(population ~ multires + square_multires, data = data_corr)
summary(fit_parabola)

# Creating the sequence to draw the function (valori di C)
x_values <- seq(0, 0.15, 0.0001)

# Evaluate the function to derive y
y_values <- predict(fit_parabola, list(multires=x_values, square_multires=x_values^2))

# Drawing the plot, points + line
plot(multires, population, pch=16, 
     main="Correlation treatment-population", 
     xlab="Abamectin concentration (mg/kg)", ylab="Population abundance (n° individuals)",
     cex.axis=1.5, cex.main=1.5, cex.lab=1.5)
lines(x_values, y_values, col='blue')
