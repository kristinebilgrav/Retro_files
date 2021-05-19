#!/bin/bash -l
#SBATCH -A sens2017106
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 7-00:00:00
#SBATCH -J SVDB

singularity exec /proj/nobackup/sens2017106/wharf/kbilgrav/kbilgrav-sens2017106/SVDB/SVDB_2.4.0.sif svdb --query --query_vcf $1 --db $2  --overlap -1 --bnd_distance 150 > $3

