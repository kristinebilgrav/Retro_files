import sys

#extracts freq/occ information in queried files

fileInput = open(sys.argv[1], "r") #txt file with links to files
fileOutput = open(sys.argv[2], "w") #file with freq, ID, ME type
fileOutput.write("#ID" + "\t" + "IDnum" + "\t" + "MEtype" + "\t" + "frequency" + "\n")

#filter frequency/occurances

freq = []
i=0
for line in fileInput:
    line = line.strip("\n")
    ID = line.split("/")[-1].split("_")[0]
    for row in open(line):
        if row.startswith("#"):
            continue
        tabs = row.split("\t")

        Metype =row.split("MEINFO=")[-1].split(",")[0]
        frq="0"
        i+=1
	if "OCC" in tabs[-3]:
            #print(line)
            #occ = row.split(";OCC=")[-1].split(";")[0]
            frq = row.split(";FRQ=")[-1].split("\t")[0]
        if float(frq) > float(0):
            #print(ID + "\t" + str(i)+ "\t" + Metype + "\t" +frq)
            fileOutput.write(ID + "\t" + str(i)+ "\t" + Metype + "\t" + frq + "\n")
        if "OCC" not in tabs[-3]:
            fileOutput.write(ID + "\t" + str(i)+ "\t" + Metype + "\t" + "0.0" + "\n")


#fileOutput.close()

