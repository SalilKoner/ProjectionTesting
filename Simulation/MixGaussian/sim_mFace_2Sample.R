args     <- commandArgs(TRUE)
dsn      <- as.integer(args[1])
n_cores  <- as.integer(args[2])
ndat_per_array <- as.integer(args[3])
n_samp  <- as.integer(args[4])
design <- as.character(args[5])
sparsity <- as.character(args[6])
grid.size <- as.integer(args[7])
noise.sig <- as.numeric(args[8])
eff    <- as.numeric(args[9])

# dsn <- 1;
# n_cores <- 8
# ndat_per_array <- 2
# n_samp <- 100
# design <- "sparse"
# sparsity <- "high"
# grid.size <- 51
# eff <- 0
# noise.sig <- 0.2

print(paste0("Job array = ", dsn))
print(paste0("Number of cores = ",n_cores))
print(paste0("Number of jobs per array = ",ndat_per_array))
print(paste0("Number of samples = ",n_samp))
print(paste0("Grid size = ",grid.size))
print(paste0("Design = ", design))
print(paste0("Sparsity level = ", sparsity))
print(paste0("Effect size = ", eff))
print(paste0("noise sd = ", noise.sig))

sid      <- (dsn-1)*ndat_per_array + 1
eid      <- dsn*ndat_per_array


print(paste0("Run for ", sid, " to ", eid))
source("mFace_2Sample.R")

library(foreach); library(doSNOW) ; library(doParallel);
cl                  <- makeSOCKcluster(n_cores)
registerDoSNOW(cl)
progress            <- function(nfin, tag) { cat(sprintf('tasks completed:
                                                         %d; tag: %d\n', nfin, 
                                                         tag)) }
opts                <- list(progress=progress)
packages_req        <- c("mgcv", "tidyverse", "mfaces", "refund", "MFPCA", "Hotelling")
models              <- foreach(itid=sid:eid, .options.snow=opts, 
                               .packages =packages_req) %dopar% {
                                 mFPCA_score_test(dat.id = itid,
                                                     n.ind.samp = n_samp,
                                                     samp.design = design,
                                                     sparsity.level = sparsity,
                                                     grid.size = grid.size,
                                                     effect.size = eff,
                                                     sig.e = noise.sig) }

parallel::stopCluster(cl)
pValues             <- do.call(rbind, models)
print(pValues)
if (!file.exists("Results")){
  dir.create("Results")
}
setwd("Results")
if (!file.exists(design)){
  dir.create(design)
}
setwd(design)
if (!file.exists(sparsity)){
  dir.create(sparsity)
}
setwd(sparsity)
if (!file.exists(paste0("sig = ", noise.sig))){
  dir.create(paste0("sig = ", noise.sig)) 
}
setwd(paste0("sig = ", noise.sig))
if (!file.exists(paste0("n = ", n_samp))){
  dir.create(paste0("n = ", n_samp)) 
}
setwd(paste0("n = ", n_samp))
if (!file.exists(paste0("delta = ", eff))){
  dir.create(paste0("delta = ", eff))  
}
setwd(paste0("delta = ", eff))
save(pValues, file=paste0("pVal_dsn", dsn, ".Rdata"))


# design <- "sparse";  sparsity <- "low" ; eff <- 0; n_samp <- 70;
# tocheck <- setdiff(1:25, c())
# all_pVal <- c()
# for (dsn in tocheck){
#   load(paste0("Results/", sparsity, "/n = ",
#               n_samp, "/delta = ", eff,  "/pVal_dsn", dsn, ".Rdata"))
#   all_pVal <- rbind(all_pVal, pValues)
# }
# sapply(c(0.01,0.05,0.1,0.15), function(alp) mean(all_pVal[,3] < alp))
# 
# 
# for (dsn in tocheck){ load(paste0("Results/pVal_n",
#                                   n_samp, "_dsn", dsn, ".Rdata"))}
# pVals <- do.call(rbind, lapply(tocheck, function(dsn)
#   get(paste0("pVal_n", n_samp, "_dsn", dsn))))
