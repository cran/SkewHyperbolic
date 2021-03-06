require(SkewHyperbolic)
## source("skewhypCalcRange.R")
## source("dskewhyp.R")

### default case: density = TRUE
param <- c(0,1,0,10)
(range <- skewhypCalcRange(param = param))
round(dskewhyp(range, param = param),7)
param <- c(1,1,0,10)
(range <- skewhypCalcRange(param = param))
round(dskewhyp(range, param = param),7)
param <- c(-2,1,0,10)
(range <- skewhypCalcRange(param = param))
round(dskewhyp(range, param = param),7)
param <- c(0,1,10,20)
(range <- skewhypCalcRange(param = param))
round(dskewhyp(range, param = param),7)
param <- c(0,1,10,10)
(range <- skewhypCalcRange(param = param))
round(dskewhyp(range, param = param),7)
param <- c(0,1,20,1)
(range <- skewhypCalcRange(param = param))
round(dskewhyp(range, param = param),7)
param <- c(0,1,-10,20)
(range <- skewhypCalcRange(param = param))
round(dskewhyp(range, param = param),7)
param <- c(0,1,-10,10)
(range <- skewhypCalcRange(param = param))
round(dskewhyp(range, param = param),7)
param <- c(0,1,-20,1)
(range <- skewhypCalcRange(param = param))
round(dskewhyp(range, param = param),7)

### cdf case: density = FALSE
param <- c(0,1,0,10)
(range <- skewhypCalcRange(param = param, density = FALSE))
round(integrate(dskewhyp, -Inf, range[1], param = param)$value,7)
round(integrate(dskewhyp, range[2], Inf, param = param)$value,7)
param <- c(1,1,0,10)
(range <- skewhypCalcRange(param = param, density = FALSE))
round(integrate(dskewhyp, -Inf, range[1], param = param)$value,7)
round(integrate(dskewhyp, range[2], Inf, param = param)$value,7)
param <- c(-2,1,0,10)
(range <- skewhypCalcRange(param = param, density = FALSE))
round(integrate(dskewhyp, -Inf, range[1], param = param)$value,7)
round(integrate(dskewhyp, range[2], Inf, param = param)$value,7)
param <- c(0,1,10,20)
(range <- skewhypCalcRange(param = param, density = FALSE))
round(integrate(dskewhyp, -Inf, range[1], param = param)$value,7)
round(integrate(dskewhyp, range[2], Inf, param = param)$value,7)
param <- c(0,1,10,10)
(range <- skewhypCalcRange(param = param, density = FALSE))
round(integrate(dskewhyp, -Inf, range[1], param = param)$value,7)
round(integrate(dskewhyp, range[2], Inf, param = param)$value,7)
param <- c(0,1,-10,20)
(range <- skewhypCalcRange(param = param, density = FALSE))
round(integrate(dskewhyp, -Inf, range[1], param = param)$value,7)
round(integrate(dskewhyp, range[2], Inf, param = param)$value,7)
param <- c(0,1,-10,10)
(range <- skewhypCalcRange(param = param, density = FALSE))
round(integrate(dskewhyp, -Inf, range[1], param = param)$value,7)
round(integrate(dskewhyp, range[2], Inf, param = param)$value,7)
