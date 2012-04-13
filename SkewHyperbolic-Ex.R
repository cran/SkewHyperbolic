pkgname <- "SkewHyperbolic"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('SkewHyperbolic')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("SkewHyperbolicDistribution")
### * SkewHyperbolicDistribution

flush(stderr()); flush(stdout())

### Name: SkewHyperbolicDistribution
### Title: Skewed Hyperbolic Student t-Distribution
### Aliases: dskewhyp pskewhyp qskewhyp rskewhyp ddskewhyp
### Keywords: distribution

### ** Examples

param <- c(0,1,40,10)
par(mfrow = c(1,2))
range <- skewhypCalcRange(param = param, tol = 10^(-2))

### curves of density and distribution
curve(dskewhyp(x, param = param), range[1], range[2], n = 1000)
title("Density of the \n Skew Hyperbolic Distribution")
curve(pskewhyp(x, param = param),
      range[1], range[2], n = 500)
title("Distribution Function of the \n Skew Hyperbolic Distribution")

### curves of density and log density
par(mfrow = c(1,2))
data <- rskewhyp(1000, param = param)
curve(dskewhyp(x, param = param), range(data)[1], range(data)[2],
      n = 1000, col = 2)
hist(data, freq = FALSE, add = TRUE)
title("Density and Histogram of the\n Skew Hyperbolic Distribution")
logHist(data, main = "Log-Density and Log-Histogram of\n the Skew
      Hyperbolic Distribution")
curve(dskewhyp(x, param = param, log = TRUE),
      range(data)[1], range(data)[2],
      n = 500, add = TRUE, col = 2)

##plots of density and derivative
par(mfrow = c(2,1))
curve(dskewhyp(x, param = param), range[1], range[2], n = 1000)
title("Density of the Skew\n Hyperbolic Distribution")
curve(ddskewhyp(x, param = param), range[1], range[2], n = 1000)
title("Derivative of the Density\n of the Skew Hyperbolic Distribution")

##example of density and random numbers for beta large and nu small
par(mfrow = c(1,2))
param1 <- c(0,1,10,1)
data1 <- rskewhyp(1000, param = param1)
curve(dskewhyp(x, param = param1), range(data1)[1], range(data1)[2],
      n = 1000, col = 2)
hist(data1, freq = FALSE, add = TRUE)
title("Density and Histogram\n when nu is small")
logHist(data1, main = "Log-Density and Log-Histogram\n when nu is small")
curve(dskewhyp(x, param = param1, log = TRUE),
      range(data1)[1], range(data1)[2],
      n = 500, add = TRUE, col = 2)



graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("ais")
### * ais

flush(stderr()); flush(stdout())

### Name: ais
### Title: Australian Institute of Sport data
### Aliases: ais
### Keywords: datasets

### ** Examples

data(ais)
Fe <- ais$Fe
### Not enough data to find starting values
### Use default parameter values as starting values
FeFit <- skewhypFit(Fe, startValues = "US", paramStart = c(0,1,1,1))
### Ferritin must always be non-negative
### Probability of negative values is small for fitted distribution
pskewhyp(0, param = FeFit$param)



cleanEx()
nameEx("lrdji")
### * lrdji

flush(stderr()); flush(stdout())

### Name: lrdji
### Title: Dow Jones Log Return Data
### Aliases: lrdji
### Keywords: datasets

### ** Examples

data(lrdji)
##fit a skew hyperbolic student t-distribution to the data
fit <- skewhypFit(lrdji, plot = TRUE, print = TRUE)



cleanEx()
nameEx("lrnokeur")
### * lrnokeur

flush(stderr()); flush(stdout())

### Name: lrnokeur
### Title: Log Returns of the NOK/EUR Exchange Rate
### Aliases: lrnokeur
### Keywords: datasets

### ** Examples

##Fit the skew hyperbolic students-t distribution to the data
data(lrnokeur)
fit <- skewhypFit(lrnokeur, method = "nlm", plot = TRUE, print = TRUE)



cleanEx()
nameEx("skewhypCalcRange")
### * skewhypCalcRange

flush(stderr()); flush(stdout())

### Name: skewhypCalcRange
### Title: Range of a Skew Hyperbolic Student t-Distribution
### Aliases: skewhypCalcRange skewhypStepSize
### Keywords: distribution

### ** Examples

param <- c(0,1,10,10)
range <- skewhypCalcRange(param = param, tol = 10^(-2))
range
curve(dskewhyp(x, param = c(0,1,5,10), range[1], range[2]))

param <- c(0,1,20,1)
(range <- skewhypCalcRange(param = param))
round(integrate(dskewhyp, -Inf, range[1], param = param)$value,7)
round(integrate(dskewhyp, range[2], Inf, param = param)$value,7)



cleanEx()
nameEx("skewhypCheckPars")
### * skewhypCheckPars

flush(stderr()); flush(stdout())

### Name: skewhypCheckPars
### Title: Check Parameters of the Skew Hyperbolic Student t-distribution
### Aliases: skewhypCheckPars
### Keywords: distribution

### ** Examples

skewhypCheckPars(c(0,1,1,1))     #normal
skewhypCheckPars(c(0,0,1,1))     #error
skewhypCheckPars(c(0,1,1,-1))    #error
skewhypCheckPars(c(0,1,1))       #error



cleanEx()
nameEx("skewhypFit")
### * skewhypFit

flush(stderr()); flush(stdout())

### Name: skewhypFit
### Title: Fit the Skew Hyperbolic Student t-Distribution to Data
### Aliases: skewhypFit plot.skewhypFit print.skewhypFit
### Keywords: distribution

### ** Examples

## See how well skewhypFit works
param <- c(0, 1, 4, 10)
data <- rskewhyp(500, param = param)
fit <- skewhypFit(data)
## Use data set NOK/EUR as per Aas&Haff
data(lrnokeur)
nkfit <- skewhypFit(lrnokeur, method = "nlm")
## Use data set DJI
data(lrdji)
djfit <- skewhypFit(lrdji)



cleanEx()
nameEx("skewhypFitStart")
### * skewhypFitStart

flush(stderr()); flush(stdout())

### Name: skewhypFitStart
### Title: Find Starting Values for Fittting a Skew Hyperbolic Student
###   t-Distribution
### Aliases: skewhypFitStart skewhypFitStartLA
### Keywords: distribution

### ** Examples

## find starting values to feed to skewhypFit
data(lrnokeur)
skewhypFitStart(lrnokeur, startValues="LA")$paramStart
## user supplied values
skewhypFitStart(lrnokeur, startValues="US",
                paramStart=c(0,0.01,0,5))$paramStart



cleanEx()
nameEx("skewhypMeanVarMode")
### * skewhypMeanVarMode

flush(stderr()); flush(stdout())

### Name: skewhypMeanVarMode
### Title: Moments and Mode of the Skew Hyperbolic Student t-Distribution.
### Aliases: skewhypMeanVarMode skewhypMean skewhypVar skewhypSkew
###   skewhypKurt skewhypMode
### Keywords: distribution

### ** Examples

param <- c(10,1,5,9)
skewhypMean(param = param)
skewhypVar(param = param)
skewhypSkew(param = param)
skewhypKurt(param = param)
skewhypMode(param = param)
range <- skewhypCalcRange(param = param)
curve(dskewhyp(x, param = param), range[1], range[2])
abline(v = skewhypMode(param = param), col = "red")
abline(v = skewhypMean(param = param), col = "blue")



cleanEx()
nameEx("skewhypMom")
### * skewhypMom

flush(stderr()); flush(stdout())

### Name: skewhypMom
### Title: Calculate Moments of the Skew Hyperbolic Student t-Distribution.
### Aliases: skewhypMom
### Keywords: distribution

### ** Examples

param = c(1,2,3,10)
##Raw moments of the skew hyperbolic t distribution
skewhypMom(3, param = param, momType = "raw")
##Mu moments
skewhypMom(3, param = param, momType = "mu")
##Central moments
skewhypMom(3, param = param, momType = "central")
##Moments about any location
skewhypMom(3, param = param, about = 5)



cleanEx()
nameEx("skewhypParam")
### * skewhypParam

flush(stderr()); flush(stdout())

### Name: skewhypParam
### Title: Parameter Sets for the Skew Hyperbolic t-Distribution
### Aliases: skewhypSmallShape skewhypLargeShape skewhypSmallParam
###   skewhypLargeParam

### ** Examples

data(skewhypParam)
### Testing the accuracy of skewhypMean
for (i in 1:nrow(skewhypSmallParam)) {
  param <- skewhypSmallParam[i, ]
  x <- rskewhyp(1000, param = param)
  sampleMean <- mean(x)
  distMean <- skewhypMean(param = param)
  difference <- abs(sampleMean - distMean)
  print(difference)
}




cleanEx()
nameEx("skewhypPlots")
### * skewhypPlots

flush(stderr()); flush(stdout())

### Name: SkewHyperbolicPlots
### Title: Skew Hyperbolic Student t-Distribution Quantile-Quantile and
###   Percent-Percent Plots
### Aliases: qqskewhyp ppskewhyp
### Keywords: distribution hplot

### ** Examples

par(mfrow = c(1,2))
param <- c(0,1,0,10)
y <- rskewhyp(500, param = param)
qqskewhyp(y, param = param, main = "Skew Hyperbolic\n Q-Q Plot")
ppskewhyp(y, param = param, main = "Skew Hyperbolic\n P-P Plot")



graphics::par(get("par.postscript", pos = 'CheckExEnv'))
cleanEx()
nameEx("skewhypTailPlotLine")
### * skewhypTailPlotLine

flush(stderr()); flush(stdout())

### Name: skewhypTailPlotLine
### Title: Tail Plot Line
### Aliases: skewhypTailPlotLine
### Keywords: distribution univar

### ** Examples

### Draw tail plot of some data
param <- c(0,1,1,10)
x <- rskewhyp(200, param = param)
tailPlot(x)
### Add skew hyperbolic t-distribution line
skewhypTailPlotLine(x, param = param)
### Parameters from fit may look better
paramFit <- skewhypFit(x, plots = FALSE)$param
tailPlot(x)
skewhypTailPlotLine(x, param = param)
skewhypTailPlotLine(x, param = paramFit, col = "steelblue")

### Left tail example
tailPlot(x, side = "l")
### Add skew hyperbolic t-distribution line
skewhypTailPlotLine(x, param = paramFit, side = "l")
### Log scale on both axes
tailPlot(x, side = "r", log = "xy")
### Add skew hyperbolic t-distribution line
skewhypTailPlotLine(x, param = paramFit, side = "r")




cleanEx()
nameEx("summary.skewhypFit")
### * summary.skewhypFit

flush(stderr()); flush(stdout())

### Name: summary.skewhypFit
### Title: Summarising the Skew Hyperbolic Student t-Distribution Fit
### Aliases: summary.skewhypFit print.summary.skewhypFit
### Keywords: distribution

### ** Examples

## Continuing the skewhypFit(.) example:
data(lrdji)
djfit <- skewhypFit(lrdji, print = FALSE, plot = FALSE, hessian = TRUE)
print(djfit)
summary(djfit)



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
