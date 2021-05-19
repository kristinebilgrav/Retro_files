import sys

#takes SVDB.vcf, builds matrix

genomecodes = {}
for name in open(sys.argv[3]):
    name = name.strip("\n").split("\t")
    if name[0] not in genomecodes:
        genomecodes[name[0]] = name[-1]


output = open(sys.argv[2]+".filtered.tab","w")
output.write("#" + "\t")

popocc = {}
popids = []
all_populations=set([])

for line in open(sys.argv[1]):

    line = line.strip()
    if line.startswith("#"):
        if line.startswith("#CHROM"):
            idinfo = line.strip("\n").split("\t")[9:]
            for i in idinfo:
                if i in genomecodes:
                    output.write(i + "\t")
                    popids.append(genomecodes[i])
                    all_populations.add(genomecodes[i])
                    if genomecodes[i] not in popocc:
                        popocc[genomecodes[i]] =0.0
                    popocc[genomecodes[i]] += 1
            output.write("\n")
        continue

    popcount = {}
    for p in all_populations:
        popcount[p] = 0

    clusters = line.split()[9:]
    clustername = line.split()[2]
    matrix = [clustername]

    for i in range(0,len(clusters)):
        if clusters[i] == "./1":
            popcount[popids[i]] += 1
        if clusters[i] == "0/0":
            matrix.append("0")
        if clusters[i]  == "./1":
            matrix.append("1")
        else:
            continue

    ok=False
    for p in all_populations:
        allele_freq = popcount[p]/ popocc[p]

        if allele_freq > 0.05:
            ok=True
    if ok:
       output.write("\t".join(matrix) + "\n")

