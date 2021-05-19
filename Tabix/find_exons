import os
import sys
from os import path

#loop through retrooutput, find positions, make interval, tabix if exists in bed file, if match add to new file with info from both files

fileInput = open(sys.argv[1], "r") # txt file with retro output paths
fileOutput = open(sys.argv[2] + "_exons_merged.vcf", "w")
filename = sys.argv[2] + "_exons.vcf" #change to exons, etcetc


for l in fileInput:
    l = l.strip("\n")
    if l.startswith("#"):
        if l.startswith("#CHROM"):
            fileOutput.write("##INFO=<ID=EXON_gene,Number=.,Type=String,Description=\"Gene name\"\n")
            fileOutput.write("##INFO=<ID=EXON_type,Number=.,Type=String,Description=\"Gene type\"\n")
            fileOutput.write("##INFO=<ID=EXON_ID,Number=.,Type=String,Description=\"Exon ID\"\n")
        fileOutput.write(l + "\n")
        continue
    linesplit  = l.split("\t")
    chro = (linesplit[0])
    position = int(linesplit[1])
    interval_start  = position - 100
    interval_stop = position + 100
    search = ( chro + ":" + str(interval_start) + "-" + str(interval_stop))
    #print("tabix /proj/nobackup/sens2017106/wharf/kbilgrav/kbilgrav-sens2017106/ENCODE/hg37_exons_fix.bed.gz " + search + " " + ">" + " " + filename)
    os.system("tabix /proj/nobackup/sens2017106/wharf/kbilgrav/kbilgrav-sens2017106/ENCODE/hg37_exons_fix.bed.gz " + search + " " + ">" + " " + filename) #change to sysargv

    gene_tag=";EXON_gene="
    type_tag = ";EXON_type="
    id_tag = ";EXON_ID="
    exon_id = []
    genes = []
    genetype = []
    for ex in open(filename):
        ex = ex.strip("\n")
        exname = (ex.split("\t"))
        exon_id.append(exname[-1])
        genetype.append(exname[-2])
        genes.append(exname[-3])

    if not len(exon_id) ==0:
        gene_tag+= ",".join(genes)
        type_tag+= ",".join(genetype)
        id_tag+=",".join(exon_id)

        linesplit[7]+= gene_tag + type_tag + id_tag
    fileOutput.write("\t".join(linesplit) + "\n")


fileOutput.close()
