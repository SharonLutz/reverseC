

## reverseC for Mediation Analysis
These functions examines the performance of mediation analysis methods in the presence of reverse causality.

## Installation
```
# you need R v3.4 or higher
# devtools must be installed first
install.packages("devtools") 
install.packages("mediation")
install.packages("MendelianRandomization") 

#this package does not install automatically, but is needed by TwoSampleMR
install.packages("psych")

# this is a dependency not present in R CRAN, it should be installed before reverseC
devtools::install_github("MRCIEU/TwoSampleMR") 

devtools::install_github("SharonLutz/reverseC")
```

## Example:
```
library(reverseC)
?reverseMAsim # For details on this function

reverseMAsim(n = 1000, pX = 0.2, gamma0 = 0, gammaX = 0.2, varM = 1, beta0 = 0, betaX = 0, 
betaM = c(0.1, 0.2, 0.3), varY = 1, nSim = 500, nSimImai = 500, SEED = 1, plot.pdf = T, 
plot.name = "reverseMAplot.pdf", alpha_level = 0.05)

 reverseMAsim(n = 1000, pX = 0.2, gamma0 = 0, gammaX = 0, varM = 1, beta0 = 0, betaX = 0.2, 
betaM = c(0.1, 0.2, 0.3), varY = 1, nSim = 500, nSimImai = 500, SEED = 1, plot.pdf = T, 
plot.name = "reverseMAplotDirect.pdf", alpha_level = 0.05)

 reverseMAsim(n = 1000, pX = 0.2, gamma0 = 0, gammaX = 0.2, varM = 1, beta0 = 0, betaX = 0.2, 
betaM = c(0.1, 0.2, 0.3), varY = 1, nSim = 500, nSimImai = 500, SEED = 1, plot.pdf = T, 
plot.name = "reverseMAplotBoth.pdf", alpha_level = 0.05)
```

## Output

<img src="plots/reverseMAplot.png" width="600">
