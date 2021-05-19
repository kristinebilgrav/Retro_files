#!/bin/bash -l
#SBATCH -A sens2017106
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 7-00:00:00
#SBATCH -J VEP


module load bioinfo-tools vep vcftools
#mkdir /proj/nobackup/sens2017106/kristine/clinical/VEP/$2
vcf-sort $1 >/proj/nobackup/sens2017106/kristine/clinical/VEP/$2/$2.sort.vcf
vep --cache --dir $VEP_CACHE --offline  -i /proj/nobackup/sens2017106/kristine/clinical/VEP/$2/$2.sort.vcf  -o $2_f_VEP.vcf  --vcf  --assembly GRCh37 --per_gene
mv $2_* /proj/nobackup/sens2017106/kristine/clinical/VEP/$2
