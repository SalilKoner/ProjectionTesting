
design      <- "sparse"
sp.levels   <- c("high", "medium", "low")
eff.all     <- 0
samp.sizes  <- c(50, 70, 100, 200, 300)
sig.all     <- 0.2
all_dat     <- NULL
for (n_samp in samp.sizes){
  for (sparsity in sp.levels){
    for (sig in sig.all){
      for (eff in eff.all){
        data_path <- paste0("./Results/", design, "/", sparsity, "/sig = ", sig, "/n = ",
                            n_samp, "/delta = ", eff)
        filenames    <- list.files(path = data_path, pattern = "pVal_dsn*")
        all_pVal <- c()
        for (itid in seq_along(filenames)){
          load(paste0(data_path, "/", filenames[itid]))
          all_pVal <- rbind(all_pVal, pValues)
        }
        emp.cov.F <- sapply(c(0.01,0.05,0.1,0.15), function(alp) mean(all_pVal[,2] < alp))
        emp.cov.B <- sapply(c(0.01,0.05,0.1,0.15), function(alp) mean(all_pVal[,3] < alp))
        sd.emp.cov.F <- sqrt(emp.cov.F * (1-emp.cov.F)/10000)
        sd.emp.cov.B <- sqrt(emp.cov.B * (1-emp.cov.B)/10000)
        LB.F         <-  emp.cov.F - 1.96*sd.emp.cov.F
        UB.F         <-  emp.cov.F + 1.96*sd.emp.cov.F
        LB.B         <-  emp.cov.B - 1.96*sd.emp.cov.B
        UB.B         <-  emp.cov.B + 1.96*sd.emp.cov.B
        
        dat          <- data.frame(n_samp, design, sparsity, sig, eff)
        dat          <- expand_grid(dat, nom.probs = c(0.01,0.05,0.1,0.15)) %>% 
                        mutate(cov.F = emp.cov.F, cov.B = emp.cov.B, 
                               sd.F = sd.emp.cov.F, sd.B = sd.emp.cov.B, 
                               cover.F = (nom.probs >= LB.F) & (nom.probs <= UB.F),
                               cover.B = (nom.probs >= LB.B) & (nom.probs <= UB.B))
        all_dat      <- bind_rows(all_dat, dat)
      }
    }
  }
}


require(tidyverse)
design      <- "sparse"
sp.levels   <- c("high", "medium", "low")
eff.all     <- c(0,seq(0.4,6.1,0.3))
samp.sizes  <- c(50, 70, 100, 200, 300)
sig.all     <- 0.2
all_dat     <- NULL
for (n_samp in samp.sizes){
  for (sparsity in sp.levels){
    for (sig in sig.all){
      for (eff in eff.all){
        data_path <- paste0("./Results/", design, "/", sparsity, "/sig = ", sig, "/n = ",
                            n_samp, "/delta = ", eff)
        filenames    <- list.files(path = data_path, pattern = "pVal_dsn*")
        all_pVal <- c()
        for (itid in seq_along(filenames)){
          load(paste0(data_path, "/", filenames[itid]))
          all_pVal <- rbind(all_pVal, pValues)
        }
        emp.cov.F <- sapply(c(0.01,0.05,0.1,0.15), function(alp) mean(all_pVal[,2] < alp))
        emp.cov.B <- sapply(c(0.01,0.05,0.1,0.15), function(alp) mean(all_pVal[,3] < alp))
        
        dat          <- data.frame(n_samp, design, sparsity, sig, eff)
        dat          <- expand_grid(dat, nom.probs = c(0.01,0.05,0.1,0.15)) %>% 
                        mutate(cov.F = emp.cov.F, cov.B = emp.cov.B)
        all_dat      <- bind_rows(all_dat, dat)
      }
    }
  }
}
save(all_dat, file="power_gaussian.Rdata")


load("power_gaussian.Rdata")
load("power_mixgaussian.Rdata")

library(tidyverse)

abc <- all_dat %>% filter(n_samp %in% c(100, 200, 300) & sig == 0.2, design == "sparse" & nom.probs == 0.1) %>% 
  mutate(n = paste0("n = ", factor(n_samp)), sp.level = factor(sparsity,
                                               levels = c("high", "medium", "low"),
                                               labels = c("High", "Medium", "Low"))) 

ggplot(abc, aes(x = eff, y = cov.F)) + 
  geom_line(aes(color = n, linetype = sp.level), size=1.5, alpha=2) + 
  geom_point(aes(shape = sp.level), size=1.5) + 
  scale_y_continuous(breaks = c(0.1, 0.3, 0.5, 0.65, 0.8, 0.95, 1.00)) +
  scale_x_continuous(breaks = seq(0,6,0.8)) +
  scale_color_manual(guide=guide_legend("Sample size", nrow=3, ncol=1, override.aes = list(size = 5)),
                     values = c("red", "purple",
                                "#8FD400")) +
  scale_shape_discrete(guide=guide_legend("Sparsity", nrow=3, ncol=1)) +
  # scale_linetype_discrete(guide=guide_legend("Sparsity", nrow=3, ncol=1)) +
  scale_linetype_manual(guide=guide_legend("Sparsity", nrow=3, ncol=1), 
                        values = c("High" = "dotted", "Medium" = "twodash", "Low" = "solid")) +
  labs(x=bquote(delta), y = "Power") +
  theme_bw() +
  theme(
    panel.grid.minor = element_blank(),
    panel.border = element_rect(colour = "black", fill = NA, size=1.6), 
    axis.line.x = element_line(size = 1.4),
    axis.text = element_text(face="bold", size=14, color = 'blue'),
    strip.text.x = element_text( size=18, face="bold", color='Brown'),
    strip.text.y = element_text( size=18, color='Brown'),
    strip.background = element_rect(color = "black", fill = 'white', size = 2),
    axis.title = element_text(size=18),
    legend.text= element_text(size=24),
    legend.box = "horizontal",
    legend.box.background = element_rect(color = "blue", size=0.9, linetype = "dotted"),
    legend.position=c(0.6, 0.4),
    legend.direction = "vertical",
    legend.key.size = unit(2, 'lines'),
    legend.background = element_rect(color = "grey", size=2),
    legend.box.margin = margin(0.4,0.4,0.4,0.4,"cm"),
    legend.title = element_text(size = 24, face="bold"),
    plot.title = element_blank())
                               



design <- "sparse";  sparsity <- "medium" ; eff <- 0; n_samp <- 100; sig <- 0.2;
data_path <- paste0("./Results/", design, "/", sparsity, "/sig = ", sig, "/n = ",
                   n_samp, "/delta = ", eff)
filenames    <- list.files(path = data_path, pattern = "pVal_dsn*")
all_pVal <- c()
for (itid in seq_along(filenames)){
  load(paste0(data_path, "/", filenames[itid]))
  all_pVal <- rbind(all_pVal, pValues)
}
sapply(c(0.01,0.05,0.1,0.15), function(alp) mean(all_pVal[,3] < alp))


setwd("C:\\Users\\Salil Koner\\Dropbox\\Duke_Postdoc_Research\\MFPCA_testing\\Simulation\\Multivariate_Setup")
design <- "sparse";  sparsity <- "high" ; eff <- 0; n_samp <- 200; sig <- 0.2;
tocheck <- setdiff(1:25, c())
all_pVal <- c()
for (dsn in tocheck){
  load(paste0("./Results/", design, "/n = ",
              n_samp, "/delta = ", eff,  "/pVal_dsn", dsn, ".Rdata"))
  all_pVal <- rbind(all_pVal, pValues)
}
sapply(c(0.01,0.05,0.1,0.15), function(alp) mean(all_pVal[,2] < alp))

