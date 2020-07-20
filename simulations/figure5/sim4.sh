#!/bin/bash
#$ -S /bin/bash
#$ -j y
#$ -cwd
#$ -q all.q
#BSUB -J EDPsim4

PROJECT="/home/xxxxxx/dissertation/paper2/sims/predictions/mixed/"

/appl/R-3.2.5/bin/R CMD BATCH --no-save --no-restore $PROJECT/sim4.r
