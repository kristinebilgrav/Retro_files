import sys

#counts ME in file
#input: txt file with paths to files
#output: ID, numME, ME type ,Genome

fileInput = open(sys.argv[1], "r")
fileOutput = open(sys.argv[2], "w")

id = 0

for line in fileInput:
    line = line.strip("\n")
    name = (line.split("/")[-1].split("_"))
    #print(id)
    id += 1
    alus = 0
    sva = 0
    herv = 0
    l1 = 0
    file = open(line, "r")
    for row in file:
        row= row.strip("\n")
        #print(row)
        if row.startswith("#"):
            continue
        meinfo = row.split("MEINFO=")[-1].split(",")
        #print(meinfo)
        if "hybrid" in meinfo[0]:
            continue
        if meinfo[0] == "ALU":
            alus += 1
            continue
        if meinfo[0] =="L1":
            l1 += 1
            continue
        if meinfo[0] =="SVA":
            sva += 1
            continue
        if meinfo[0] == "HERV":
            herv += 1
            continue
    print(str(id) + "\t" + str(alus) + "\t" +  "ALU" + "\t" + "SweGen38")

    if alus > 0 :
        fileOutput.write(str(id) + "\t" + str(alus) + "\t" +  "ALU" + "\t" + "\n")
    if l1 > 0 :
        fileOutput.write(str(id) + "\t" + str(l1) + "\t" +  "L1" + "\t" + "\n")
    if sva > 0 :
        fileOutput.write(str(id) + "\t" + str(sva) + "\t" +  "SVA" + "\t" + "\n")
    if herv > 0 :
        fileOutput.write(str(id) + "\t" + str(herv) + "\t" +  "HERV" + "\t" + "\n")



