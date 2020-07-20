#!/bin/bash
#$ -S /bin/bash
#$ -j y
#$ -cwd
#$ -q all.q
#BSUB -J MEsim8

PROJECT="/home/xxxxxx/dissertation/paper2/sims/predictions/"

/appl/R-3.2.5/bin/R CMD BATCH --no-save --no-restore $PROJECT/sim8_ME.r
