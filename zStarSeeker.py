from subprocess import call

def zStarSeek(benefit, capacity, loading, data_count, jobs, machines):

    z_star = []

    for x in range (1,int(data_count)+1):
        b_arr = []
        c_arr = []
        f_star = jobs+"J"+machines+"M"+"/ZPL/"+"z"+jobs+"J"+machines+"M"+benefit+capacity+loading+"-"+str(x)+".zpl"
        sf_star = jobs+"J"+machines+"M"+"/SOL/"+"z"+jobs+"J"+machines+"M"+benefit+capacity+loading+"-"+str(x)+".sol"
        f_dat = jobs+"J"+machines+"M"+"/DAT/"+jobs+"J"+machines+"M"+benefit+capacity+loading+"-"+str(x)+".dat"
        
        with open(f_dat, "r") as ins:
            Array_dat = []
            for line in ins:
                Array_dat.append(line)
        
        for dat_line in range(1,len(Array_dat)-1):
            b,c = Array_dat[dat_line].split()
            b_arr.append(str(b))
            c_arr.append(str(c))
        K = Array_dat[int(jobs)+1]

        f = open(f_star,'w')
        f.write("set JOB := {1 .. "+jobs+"};\n")
        f.write("set MACHINE := {1 .. "+machines+"};\n")
        f.write("set JM := JOB * MACHINE;\n\n")
        f.write("param benefit[JOB] := ")

        for j in range (1,int(jobs)+1):
            f.write("<"+str(j)+"> "+b_arr[j-1])
            if(j != int(jobs)):
                f.write(", ")        
        
        f.write(";\n")
        f.write("param workload[JOB] := ")


        for j in range (1,int(jobs)+1):
            f.write("<"+str(j)+"> "+c_arr[j-1])
            if(j != int(jobs)):
                f.write(", ")
        
        f.write(";\n")
        f.write("param capacity[MACHINE] := ")
        
        for i in range(1,int(machines)+1):
            f.write("<"+str(i)+"> "+str(K))
            if(i != int(machines)):
                f.write(", ")

        f.write(";\n\n")

        f.write("var x[JM] binary;\nvar z;\n")
        f.write("maximize minBenefit: z;\n")
        f.write("subto Z:\n")
        f.write("   forall <m> in MACHINE do\n")
        f.write("      sum <j> in JOB : benefit[j] * x[j,m] >= z;\n")
        f.write("subto K:\n")
        f.write("   forall <m> in MACHINE do\n")
        f.write("      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];\n")
        f.write("subto X:\n")
        f.write("   forall <j> in JOB do\n")
        f.write("      sum <m> in MACHINE : x[j,m] <= 1;\n")
        f.write("subto A:\n")
        f.write("   forall <j,m> in JM do\n")
        f.write("      x[j,m] >= 0;\n")
        f.close()

        call(["./../../scipoptsuite-3.1.1/scip-3.1.1/bin/scip -c \"read "+f_star+"\" -c \"optimize\" -c \"write solution "+sf_star+"\" -c \"quit\" "], shell = True)
        with open(sf_star, "r") as ins:
            Array_opt = []
            for line in ins:
                Array_opt.append(line)
       
        i,j,zvalue = Array_opt[1].split()
        z_star.append(round(float(zvalue),4))
    return z_star