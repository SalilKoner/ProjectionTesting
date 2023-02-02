#!/bin/tcsh

#BSUB -J FCP_sim[1-100]      #job name AND job array
#BSUB -n 8                   #number of cores
#BSUB -R span[hosts=1]       #distribute across 1 node
#BSUB -W 18:00               #walltime limit: hh:mm
#BSUB -o /share/hmmrs/skoner/MFPCA_testing/SimStudy/MixGaussian/Cluster_out/Output_%J_%I.out 
#BSUB -e /share/hmmrs/skoner/MFPCA_testing/SimStudy/MixGaussian/Cluster_out/Error_%J_%I.err  #error - %J is the job-id %I is the job-array index 
#BSUB -R "rusage[mem=8GB]"


module load R

Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 50 sparse medium 51 0.2 0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 70 sparse medium 51 0.2 0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 100 sparse medium 51 0.2 0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 200 sparse medium 51 0.2 0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 300 sparse medium 51 0.2 0

Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 50 sparse low 51 0.2 0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 70 sparse low 51 0.2 0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 100 sparse low 51 0.2 0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 200 sparse low 51 0.2 0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 300 sparse low 51 0.2 0

Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 50 sparse high 51 0.2 0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 70 sparse high 51 0.2 0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 100 sparse high 51 0.2 0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 200 sparse high 51 0.2 0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 300 sparse high 51 0.2 0
