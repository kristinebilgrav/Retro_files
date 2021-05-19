#!/bin/bash -l
#SBATCH -A sens2017106
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 7-00:00:00
#SBATCH -J clinical_retro

module load bioinfo-tools samtools/0.1.19
#module load bioinfo-tools bcftools
#module load bioinfo-tools BEDTools

cd $TMPDIR
singularity exec --bind /proj/sens2017106/private/clinical_genomics  /proj/nobackup/sens2017106/wharf/kbilgrav/kbilgrav-sens2017106/RetroSeq/bin/retro_container.sif perl /bin/RetroSeq/bin/retroseq.pl -discover -bam $1  -output $2.output.vcf  -refTEs /proj/nobackup/sens2017106/test_retroseq/RetroSeq/repeatElement.tab

singularity exec --bind /proj/sens2017106/private/clinical_genomics /proj/nobackup/sens2017106/wharf/kbilgrav/kbilgrav-sens2017106/RetroSeq/bin/retro_container.sif perl /bin/RetroSeq/bin/retroseq.pl  -call -bam $1  -input $2.output.vcf  -ref /proj/sens2017106/reference_material/fasta/human_g1k_v37.fasta  -output $2.final.vcf
mkdir /proj/nobackup/sens2017106/kristine/clinical/$2
cp $TMPDIR/*vcf /proj/nobackup/sens2017106/kristine/clinical/$2
