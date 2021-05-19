import sys

#input: txt file with paths to files to be filtered
#output: filtered files according to flag and protein coding

input = open(sys.argv[1], "r")

for path in input:
    path = path.strip("\n")
    name = (path.split("/")[-1].split("."))
    filename = name[0] + "_f.vcf"
    output = open(filename, "w")

    file = open(path, "r")
    for line in file:
        line = line.strip("\n")
        if line.startswith("#"):
            output.write(line + "\n")
            continue
        flags  = line.split("CLIP3 ")[-1].split("\t")[-1].split(":")
        theflag = flags[2] #string
        if int(theflag) > 5:
            exon_type = line.split("EXON_type=")[-1].split(";")[0].split(",")
            if "protein_coding" in exon_type:
                output.write(line + "\n")
                continue

