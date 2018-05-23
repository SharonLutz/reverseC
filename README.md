## reverseC
This package examines the performance of mediation analysis (reverseMA) and Mendelian Randomization (reverseMR) methods in the presence of reverse causality. 2 functions determine the power and type 1 error rate to detect the indirect and direct path when the mediator and outcome are switched. (reverseMAsim and reverseMRsim) 2 functions implement these methods for user inputted data. (reverseMAdata and reverseMRdata).

## Installation
```
install.packages("devtools") # devtools must be installed first
install.packages("mediation")
install.packages("MendelianRandomization")

devtools::install_github("SharonLutz/reverseC")
```

## Example
Example 1:
```
library(reverseC)
?reverseMRsim # For details on this function

reverseMRsim(n = 1000, nSNP = 3, MAF = c(0.2, 0.2, 0.2), gamma0 = 0, gammaX = c(0.2, 0.2, 0.2), 
varM = 1, beta0 = 0, betaM = c(0, 0.1,0.2), varY = 1, nSim = 100, plot.pdf = T, 
plot.name = "reverseMRplot.pdf", alpha_level = 0.05, SEED = 1)

```
Example 2:
```
?reverseMAsim # For details on this function

reverseMAsim(n = 1000, pX = 0.2, gamma0 = 0, gammaX = 0.1, varM = 1, beta0 = 0, betaX = 1, 
betaM = c(0, 0.1, 0.2), varY = 1, nSim = 100, nSimImai = 1000, SEED = 1, plot.pdf = T, 
plot.name = "reverseMAplot.pdf", alpha_level = 0.05)
```

## Output
For Example 1, we get the following matrix of results and corresponding plot.
```
[[1]]
             [,1] [,2] [,3]
PMR.EggerNR  0.02 0.03 0.06
PMR.IVWNR    0.07 0.08 0.31
PMR.MedianNR 0.03 0.02 0.09
PMR.EggerR   0.22 0.21 0.20
PMR.IVWR     0.72 0.72 0.89
PMR.MedianR  0.00 0.00 0.00
```
<img src="https://github.com/SharonLutz/reverseC/blob/master/reverseMRplot.png" width="600">

For Example 2, we get the following matrix of results and corresponding plot.

```
[[1]]
     DirectNR IndirectNR DirectR IndirectR
[1,]        1       0.01    0.38      0.06
[2,]        1       0.29    0.05      0.79
[3,]        1       0.38    0.40      1.00
```
<img src="https://github.com/SharonLutz/reverseC/blob/master/reverseMAplot.png" width="600">

