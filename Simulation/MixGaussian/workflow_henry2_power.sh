#!/bin/tcsh

#BSUB -J FCP_sim[1-100]      #job name AND job array
#BSUB -n 8                   #number of cores
#BSUB -R span[hosts=1]       #distribute across 1 node
#BSUB -W 50:00               #walltime limit: hh:mm
#BSUB -o /share/hmmrs/skoner/MFPCA_testing/SimStudy/MixGaussian/Cluster_out/Output_%J_%I.out 
#BSUB -e /share/hmmrs/skoner/MFPCA_testing/SimStudy/MixGaussian/Cluster_out/Error_%J_%I.err  #error - %J is the job-id %I is the job-array index 
#BSUB -R "rusage[mem=32GB]"


module load R

#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 50 sparse medium 51 0.2 0
#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 70 sparse medium 51 0.2 0
#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 100 sparse medium 51 0.2 0
#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 200 sparse medium 51 0.2 0
#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 300 sparse medium 51 0.2 0

#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 50 sparse low 51 0.2 0
#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 70 sparse low 51 0.2 0
#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 100 sparse low 51 0.2 0
#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 200 sparse low 51 0.2 0
#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 300 sparse low 51 0.2 0

#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 50 sparse high 51 0.2 0
#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 70 sparse high 51 0.2 0
#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 100 sparse high 51 0.2 0
#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 200 sparse high 51 0.2 0
#Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 100 300 sparse high 51 0.2 0


#*******************************************************************************************
#                                          n = 100                                         *
#*******************************************************************************************

Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 0.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 0.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 1.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 1.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 1.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 1.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 2.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 2.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 2.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 3.1
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 3.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 3.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 4.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 4.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 4.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 4.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 5.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 5.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 5.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse low 51 0.2 6.1

Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 0.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 0.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 1.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 1.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 1.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 1.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 2.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 2.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 2.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 3.1
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 3.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 3.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 4.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 4.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 4.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 4.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 5.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 5.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 5.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse medium 51 0.2 6.1

Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 0.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 0.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 1.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 1.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 1.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 1.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 2.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 2.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 2.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 3.1
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 3.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 3.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 4.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 4.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 4.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 4.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 5.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 5.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 5.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 100 sparse high 51 0.2 6.1

#*******************************************************************************************
#                                          n = 200                                         *
#*******************************************************************************************

Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 0.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 0.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 1.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 1.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 1.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 1.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 2.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 2.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 2.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 3.1
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 3.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 3.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 4.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 4.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 4.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 4.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 5.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 5.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 5.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse low 51 0.2 6.1

Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 0.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 0.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 1.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 1.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 1.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 1.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 2.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 2.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 2.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 3.1
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 3.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 3.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 4.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 4.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 4.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 4.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 5.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 5.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 5.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse medium 51 0.2 6.1

Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 0.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 0.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 1.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 1.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 1.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 1.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 2.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 2.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 2.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 3.1
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 3.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 3.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 4.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 4.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 4.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 4.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 5.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 5.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 5.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 200 sparse high 51 0.2 6.1


#*******************************************************************************************
#                                          n = 300                                         *
#*******************************************************************************************

Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 0.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 0.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 1.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 1.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 1.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 1.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 2.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 2.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 2.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 3.1
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 3.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 3.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 4.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 4.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 4.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 4.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 5.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 5.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 5.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse low 51 0.2 6.1

Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 0.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 0.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 1.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 1.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 1.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 1.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 2.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 2.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 2.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 3.1
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 3.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 3.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 4.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 4.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 4.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 4.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 5.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 5.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 5.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse medium 51 0.2 6.1

Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 0.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 0.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 1.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 1.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 1.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 1.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 2.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 2.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 2.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 3.1
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 3.4
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 3.7
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 4.0
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 4.3
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 4.6
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 4.9
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 5.2
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 5.5
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 5.8
Rscript sim_mFace_2Sample.R $LSB_JOBINDEX $LSB_DJOB_NUMPROC 20 300 sparse high 51 0.2 6.1


