require(tidyverse)
require(mgcv)
require(face)
require(mfaces)
require(MFPCA)
require(Hotelling)

mFPCA_score_test <- function(dat.id, n.ind.samp, samp.design, sparsity.level, 
                             grid.size, effect.size, sig.e){
  n               <- n.ind.samp # Total number of subjects
  ncord           <- 3 # Number of coordinates in the multivariate data for at fixed t
  unif.t.cord     <- FALSE
  g               <- 1 + (sample(1:n, n) > n/2) # Group indicators, 1 = Control 2 = Sample
  sp.ds           <- samp.design # Sampling design
  if (sp.ds == "sparse"){
    m.range       <- switch(sparsity.level, "low"=c(15,20), 
                            "medium"=c(8,12), "high" = c(3,7))
  }
  mu.f            <- function(tt, cord) {switch(cord, 5*sin(2*pi*tt), 5*cos(2*pi*tt), 5*{(tt-1)^2}) } # General mean
  tr.sz           <- effect.size
  trt.f           <- function(tt, cord, del) { 5*del*(tt/4-0.5)^3 } # Treatment effect
  snr             <- 2 
  rho             <- 0.5
  sd.e            <- sig.e
  R               <- grid.size
  tgr             <- seq(0,1,length.out=R)
  
  phi1.f          <- function(tt, cord){sqrt(2/3)*switch(cord, sin(2*pi*tt), sin(0.5*pi*tt), sin(1*pi*tt))}
  phi2.f          <- function(tt, cord){sqrt(2/3)*switch(cord, cos(4*pi*tt), sin(1.5*pi*tt), sin(2*pi*tt))}
  phi3.f          <- function(tt, cord){sqrt(2/3)*switch(cord, sin(4*pi*tt), sin(2.5*pi*tt), sin(3*pi*tt))}
  
  # Check whether the multivariate basis functions are orthogonal w.r.t the induced norm
  mv.phi.f        <- function(i) Vectorize(get(paste0("phi",i, ".f")), vectorize.args = "cord")
  multi.ip        <- function(f1, f2){integrate(Vectorize(function(y) sum(f1(y,1:3)*f2(y,1:3)), vectorize.args = "y"), 0, 1)$value}
  
  if (max(apply(combn(1:3, 2), 2, function(row) multi.ip(mv.phi.f(row[1]), mv.phi.f(row[2])))) > .Machine$double.eps || 
      sqrt(sum({sapply(1:3, function(i) multi.ip(mv.phi.f(i), mv.phi.f(i)))-rep(1,3)}^2))  > .Machine$double.eps  ){
    stop("Eigen functions are not orthonormal")
  }
  
  evalues.tr      <- c(6,3,1.5)
  #xis            <- sapply(evalues.tr, function(sxi) rnorm(n, 0, sqrt(sxi)))

  xis             <- do.call(cbind, lapply(sqrt(evalues.tr), function(sxi) {
                                             z <- rbinom(n,1,0.5)
                                             z*rnorm(n, sxi/sqrt(2), sxi/sqrt(2)) +
                                             (1-z)*rnorm(n, -sxi/sqrt(2), sxi/sqrt(2))
                             }))

  
  aldat           <- vector("list", length=ncord)
  fdat            <- vector("list", length=ncord)
  fdat.nw         <- vector("list", length=ncord)
  for (k in 1:ncord) {
    if ((k == 1) || (k > 1 && !unif.t.cord)){
      m           <- switch(sp.ds, "dense"=rep(R,n), 
                            "sparse"=sample(m.range[1]:m.range[2], n, replace = TRUE))
      tind        <- switch(sp.ds, "dense"=lapply(m, function(i) 1:R), 
                            "sparse"=lapply(m, function(mi) sort(sample(1:R, mi, replace = FALSE))) )
      t           <- lapply(tind, function(tindi) tgr[tindi])
    }
    
    PHI           <- rbind(phi1.f(tgr, k), phi2.f(tgr, k), phi3.f(tgr, k))
    U             <- xis %*% PHI 
    MU            <- matrix(mu.f(tgr, k), n, R, byrow=TRUE)
    TRT           <- matrix(g==2,n,R) * matrix(trt.f(tgr, k, tr.sz), n, R, byrow=TRUE)
    X             <- MU + TRT + U
    Y             <- lapply(1:n, function(i) X[i, tind[[i]], drop=TRUE] + rnorm(m[i],0, sd.e) )
    dat           <- data.frame("subj"=rep(1:n, m), "argvals" = unlist(t), "y" = unlist(Y), "Group" = rep(g, m)) %>%
                     mutate(trt.ind = as.numeric(Group == 2))
    fit.mean      <- gam(y ~ s(argvals, k=10) + s(argvals, k=10, by=trt.ind), data=dat)
    y_mean        <- dat$y - as.vector(predict(fit.mean, newdata=dat %>% mutate(trt.ind = 0)))
    faceDat.nw    <- dat %>% dplyr::select(subj, argvals) %>% mutate(y = y_mean) 
    faceDat       <- dat %>% dplyr::select(subj, argvals) %>% mutate(y=fit.mean$residuals)
    aldat[[k]]    <- dat
    fdat[[k]]     <- faceDat
    fdat.nw[[k]]  <- faceDat.nw
  }
  
  names(aldat) <- names(fdat) <- names(fdat.nw) <- paste0("y", 1:ncord)
  # cat(str(aldat)); cat(str(fdat)); cat(str(fdat.nw));
  
  mfaceObj        <- mfaces::mface.sparse(fdat, newdata=fdat.nw, center = F, argvals.new = tgr,
                                          knots=6, calculate.scores = TRUE, pve=0.99)
  
  # mfaceObj_r      <- mfaces::mface.sparse(aldat, newdata=aldat, center = T, argvals.new = tgr,
  #                                         knots=10, calculate.scores = TRUE, pve=0.99)
  
  sum_of_scores          <- rowSums(mfaceObj$scores$scores)
  tStat                  <- (mean(sum_of_scores[g==2])-mean(sum_of_scores[g==1]))/sqrt(sum(mfaceObj$eigenvalues)*4/n)
  pVal                   <- 2*(1-pnorm(abs(tStat)))
  
  
  # sum_of_scores_r          <- rowSums(mfaceObj_r$scores$scores)
  # tStat_r                  <- (mean(sum_of_scores_r[g==2])-mean(sum_of_scores_r[g==1]))/sqrt(sum(mfaceObj_r$eigenvalues)*4/n)
  # pVal_r                   <- 2*(1-pnorm(abs(tStat_r)))
  
  
  # Edited on April 13, 2022, evening to make it less conservative
  
  grp1_xi   <- mfaceObj$scores$scores[g==1, , drop=FALSE]
  grp2_xi   <- mfaceObj$scores$scores[g==2, , drop=FALSE]
  HT.test   <- hotelling.test(x = grp2_xi, y = grp1_xi, 
                              shrinkage = FALSE, var.equal = TRUE,
                              perm = FALSE, B = 10000, progBar = (perm && TRUE))
  
  pVal_HT   <- HT.test$pval
  
  print("Hotelling T test")
  
  HT.testB  <- hotelling.test(x = grp2_xi, y = grp1_xi, 
                              shrinkage = FALSE, var.equal = TRUE,
                              perm = TRUE, B = 10000, progBar = FALSE)
  pVal_HTB   <- HT.testB$pval
  
  c(pVal, pVal_HT, pVal_HTB)

}

