reverseMRdata <-
function(nSNP=3,X,M,Y,SEED=1){
  
  # Set the seed
  set.seed(SEED)
  
  # Import the MR library
  library(MendelianRandomization)
  
  # Error checks
  if(nSNP<3 | nSNP==0 | floor(nSNP)!=ceiling(nSNP) ){stop("Error: nSNP must be an integer greater than or equal to 3")}
  if(nSNP!=ncol(X)){stop("Error: the columns in X must equal the number of SNPS (nSNP)")}
  if(nrow(X)!=length(M)){stop("Error: the rows of X must equal the length of M")}
  if(nrow(X)!=length(Y)){stop("Error: the rows of X must equal the length of Y")}
  
  # Creat a results matrix for each simulation
  mat_results <- matrix(NA,nrow=12,ncol=1)
  rownames(mat_results) <- c("EMR.EggerNR","PMR.EggerNR","EMR.IVWNR","PMR.IVWNR","EMR.MedianNR","PMR.MedianNR",
                             "EMR.EggerR","PMR.EggerR","EMR.IVWR","PMR.IVWR","EMR.MedianR","PMR.MedianR")
  
  # Get the input for MR methods
  betaXM <- c(); betaXMse <- c()
  betaXY <- c(); betaXYse <- c()
  
  for(snp in 1:nSNP){
    # betaX are the beta-coefficients from univariable regression analyses of the exposure on each
    # genetic variant in turn, and betaXse are the standard errors
    fitM <- lm(M~X[,snp])
    betaXM <- c(betaXM,summary(fitM)$coefficients[2,1])
    betaXMse <- c(betaXMse,summary(fitM)$coefficients[2,2])
    
    # betaXy are the beta-coefficients from regression analyses of the outcome on each genetic
    # variant in turn, and betaXsey are the standard errors
    fitY <- lm(Y~X[,snp])
    betaXY <- c(betaXY,summary(fitY)$coefficients[2,1])
    betaXYse <- c(betaXYse,summary(fitY)$coefficients[2,2])
  }
  
  # Create MR.input object
  mr.input <- mr_input(bx = betaXM, bxse = betaXMse, by = betaXY, byse = betaXYse)
  mr.input2 <- mr_input(bx = betaXY, bxse = betaXYse, by = betaXM, byse = betaXMse)
  
  # Get the estimates and p-values from the methods
  mat_results["EMR.EggerNR",1] <- mr_egger(mr.input,robust = F,penalized = F)$Estimate
  mat_results["PMR.EggerNR",1] <- mr_egger(mr.input,robust = F,penalized = F)$Pvalue.Est
  mat_results["EMR.IVWNR",1] <- mr_ivw(mr.input,robust = F,penalized = F)$Estimate
  mat_results["PMR.IVWNR",1] <- mr_ivw(mr.input,robust = F,penalized = F)$Pvalue
  mat_results["EMR.MedianNR",1] <- mr_median(mr.input,seed = NA)$Estimate
  mat_results["PMR.MedianNR",1] <- mr_median(mr.input,seed = NA)$Pvalue
  
  # Get the estimates and p-values from the methods reversed
  mat_results["EMR.EggerR",1] <- mr_egger(mr.input2,robust = F,penalized = F)$Estimate
  mat_results["PMR.EggerR",1] <- mr_egger(mr.input2,robust = F,penalized = F)$Pvalue.Est
  mat_results["EMR.IVWR",1] <- mr_ivw(mr.input2,robust = F,penalized = F)$Estimate
  mat_results["PMR.IVWR",1] <- mr_ivw(mr.input2,robust = F,penalized = F)$Pvalue
  mat_results["EMR.MedianR",1] <- mr_median(mr.input2,seed = NA)$Estimate
  mat_results["PMR.MedianR",1] <- mr_median(mr.input2,seed = NA)$Pvalue
  
  # Print out the matrix but use list
  list(mat_results)
  
}
