#!/bin/bash
#$ -cwd -S /bin/bash
#$ -o /dev/null
#$ -e /dev/null
#$ -l mem=2G
#$ -l time=:1000:
#$ -M eag2186@cumc.columbia.edu

$MODULESHOME/init/bash
module load R/3.6.0

clear

R CMD BATCH --no-save RDA_to_CSV.R

