#!/bin/bash -l
#SBATCH -A sens2017106
#SBATCH -p core
#SBATCH -n 6
#SBATCH -t 7-00:00:00
#SBATCH -J SVDB

cd $TMPDIR
singularity exec /proj/nobackup/sens2017106/wharf/kbilgrav/kbilgrav-sens2017106/SVDB/SVDB_2.4.0.sif svdb --build --folder $1 --prefix $2

singularity exec /proj/nobackup/sens2017106/wharf/kbilgrav/kbilgrav-sens2017106/SVDB/SVDB_2.4.0.sif svdb --export --db $2.db --prefix $2.v24.nyversion --overlap -1 --bnd_distance 150
singularity exec /proj/nobackup/sens2017106/wharf/kbilgrav/kbilgrav-sens2017106/SVDB/SVDB_2.4.0.sif svdb --export --db $2.db --prefix $2.v24.500.nyversion --overlap -1 --bnd_distance 500
cp $TMPDIR/*vcf /proj/nobackup/sens2017106/kristine/1000Genomes/1KG_SVDB



