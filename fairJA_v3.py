import random, math, os, sys
from subprocess import call
from collections import namedtuple 
from operator import attrgetter, truediv, itemgetter

SolStruct = namedtuple("SolStruct", "dist_j value dist_m")

def zStartSeeker(benefit, capacity, loading):

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


def zLinearSeeker(benefit, capacity, loading):

    z_linear = []
    z_linear_list = []

    for x in range (1,int(data_count)+1):
        b_arr = []
        c_arr = []
        f_linear = jobs+"J"+machines+"M"+"/ZPL/"+jobs+"J"+machines+"M"+benefit+capacity+loading+"-"+str(x)+".zpl"
        sf_linear = jobs+"J"+machines+"M"+"/SOL/"+jobs+"J"+machines+"M"+benefit+capacity+loading+"-"+str(x)+".sol"
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

        f = open(f_linear,'w')
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

        f.write("var x[JM];\nvar z;\n")
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

        call(["./../../scipoptsuite-3.1.1/scip-3.1.1/bin/scip -c \"read "+f_linear+"\" -c \"optimize\" -c \"write solution "+sf_linear+"\" -c \"quit\" "], shell = True)
        with open(sf_linear, "r") as ins:
            Array_opt = []
            for line in ins:
                Array_opt.append(line)
        sol = []
        i,j,zvalue = Array_opt[1].split()
        z_linear.append(round(float(zvalue),4))
        
        for y in range(2,len(Array_opt)-1):
            a,b,c = Array_opt[y].split()
            sol.append(SolStruct(a,b,c))
        for y in range(0,len(sol)):
            xxx, distJ, distM = sol[y].dist_j.split("#")
            sol[y] = sol[y]._replace(dist_j = distJ)
            sol[y] = sol[y]._replace(dist_m = distM)
        z_linear_list.append(sol)
    return z_linear, z_linear_list

def zApproximateSeeker(benefit, capacity, loading, llist):
 
    v = "testlog" 
    vf = open(v, 'a')   
 
    z_apxm = []

    for x in range (1,int(data_count)+1):
        sortlist = []
        b_arr = []
        c_arr = []
        f_dat = jobs+"J"+machines+"M"+"/DAT/"+jobs+"J"+machines+"M"+benefit+capacity+loading+"-"+str(x)+".dat"
        
        zvalue = [0]*int(machines)
        zcapacity = [0]*int(machines)
        job_check = [0]*int(jobs)

        vf.write("*****"+f_dat+"*****\n")

        with open(f_dat, "r") as ins:
            Array_dat = []
            for line in ins:
                Array_dat.append(line)
        
        for dat_line in range(1,len(Array_dat)-1):
            b,c = Array_dat[dat_line].split()
            b_arr.append(str(b))
            c_arr.append(str(c))
        K = Array_dat[int(jobs)+1]    
        

        # for j in range(0,int(jobs)):
        #     sortlist.append([])

            
        for y in llist[x-1]:
            #if capacity != "N":
            if y.value == "1":
                job_check[int(y.dist_j)-1] = 1
                zcapacity[int(y.dist_m)-1] += float(c_arr[int(y.dist_j)-1])
                zvalue[int(y.dist_m)-1] += float(b_arr[int(y.dist_j)-1])
                vf.write("@1 job "+y.dist_j+" allocated to machine "+y.dist_m+"\n")
                vf.write("M1: "+str(zcapacity[0])+" ")
                vf.write("M2: "+str(zcapacity[1])+" ")
                vf.write("M3: "+str(zcapacity[2])+" \n\n")
            # else:
            #     sortlist[int(y.dist_j)-1].append(SolStruct(y.dist_j,y.value,y.dist_m))

        #job with high benefit -> low benefit
        tmp_b_arr = []
        for b in b_arr:
            tmp_b_arr.append(float(b))
        jindex = range(int(jobs))        
        #tmp_b_arr = list(b_arr)
        idx_benefit = sorted(zip(jindex, tmp_b_arr), key = lambda x:x[1], reverse = True)
        

        #vf.write("idx_benefit: "+str(idx_benefit)+"\n")
        # tmp_b_arr = list(b_arr)
        # combine = zip(tmp_b_arr, sortlist)
        # sortlist_x = [sortlist for tmp_b_arr, sortlist in sorted(combine, reverse = True)]

        mindex = range(int(machines))
        idx_zvalue = zip(mindex, zvalue)
                
        for j in idx_benefit:
            idx_zvalue = zip(mindex, zvalue)
            idx_zvalue = sorted(idx_zvalue, key = lambda x:x[1])
            #vf.write("idx_zvalue: "+str(idx_zvalue)+"\n")
            for m in idx_zvalue:
                vf.write("m[0]: "+str(m[0])+" j[0] = "+str(j[0])+" j[1] ="+str(j[1])+"\n")
                tmp = zcapacity[int(m[0])] + float(c_arr[j[0]])
                vf.write("tmp = "+str(tmp)+" K = "+K+"\n")
                if job_check[j[0]] == 0:
                    vf.write("job check"+str(job_check[j[0]])+"\n")
                    if tmp <= float(K):
                        zvalue[m[0]] += float(j[1])
                        zcapacity[m[0]] += float(c_arr[j[0]])
                        job_check[j[0]] = 1
                        vf.write("@2 job "+y.dist_j+" allocated to machine "+y.dist_m+"\n")
                        vf.write("M1: "+str(zcapacity[0])+" ")
                        vf.write("M2: "+str(zcapacity[1])+" ")
                        vf.write("M3: "+str(zcapacity[2])+" \n\n")    

        # for j in range(0, int(jobs)):
        #     idx_zvalue = zip(zvalue, mindex)
        #     sorted(idx_zvalue)
        #     for m in range(0, len(idx_zvalue)):
        #         tmp = zcapacity[idx_zvalue[m][1]] + float(c_arr[idx_benefit[j][1]])
        #         #if job_check[idx_benefit[j][1]] == 0:
        #             if tmp <= K:
        #                 zvalue[idx_zvalue[m][1]] += float(idx_benefit[j][0])
        #                 zcapacity[idx_zvalue[m][1]] += float(c_arr[idx_benefit[j][1]])
        #                 job_check[idx_benefit[j][1]] = 1
        # for j in range(0, int(jobs)):
        #     for x in sortlist_x[j]:
        #         x = x._replace(value = zcapacity[int(x.dist_m)-1])    
        #     sorted(sortlist_x[j], key = attrgetter('value'))
        #     for jm in range(0,len(sortlist_x[j])):
        #         mm = int(sortlist_x[j][jm].dist_m)-1
        #         jj = int(sortlist_x[j][jm].dist_j)-1
        #         tmp = zcapacity[mm] + float(c_arr[jj])
        #         if tmp <= K:
        #             if job_check[jj] == 0:
        #                 zvalue[mm] += float(b_arr[jj])
        #                 zcapacity[mm] += float(c_arr[jj])
        #                 job_check[jj] = 1
                    #break          
        #zvalue = list(x[0] for x in idx_zvalue)        
        # if capacity == "N":
        #     for l1 in range(0,len(llist[x-1])):
        #         for l2 in range(l1+1,len(llist[x-1])):
        #             if llist[x-1][l1].dist_j == llist[x-1][l2].dist_j:
        #                 if llist[x-1][l1].value >= llist[x-1][l2].value:
        #                     llist[x-1][l2] = llist[x-1][l2]._replace(value = 0)
        #                 else:
        #                     llist[x-1][l1] = llist[x-1][l1]._replace(value = 0)
        #     for y in range(0,len(llist[x-1])):
        #         if llist[x-1][y].value != 0:
        #             llist[x-1][y] = llist[x-1][y]._replace(value = 1)
        #             zvalue[int(llist[x-1][y].dist_m)-1] += float(b_arr[int(llist[x-1][y].dist_j)-1])*int(llist[x-1][y].value)
                    
        minzvalue = min(zvalue)
        z_apxm.append(round(minzvalue,4))
    return z_apxm

#############################################################################################################

data_count = 20                                     
jobs = raw_input("Number of jobs:")           
machines = raw_input("Number of machines:")

vs = jobs+"J"+machines+"M"+"/"+jobs+"J"+machines+"M.stat" 
vsf = open(vs, 'a')
vsf.write("  B    C    L     *zl*        za     r-avg       r-1     r-min")
vsf.write("\n")
vsf.write("--------------------------------------------------------------")
vsf.write("\n")

for xx in range (1,3):
    if xx == 1:
        benefit = "N"
    else:
        benefit = "U"
    for yy in range (1,4):
        if yy == 1:
            capacity = "L"
        elif yy == 2:
            capacity = "T"
        else:
            capacity = "N"
        for zz in range (1,5):
            if zz == 1:
                loading = "L"
            elif zz == 2:
                loading = "X"
            elif zz == 3:
                loading = "A"
            else:
                loading = "R"
            z_linear, z_linear_list = zLinearSeeker(benefit, capacity, loading)
            z_apxm = zApproximateSeeker(benefit, capacity, loading, z_linear_list)

            z_linear_avg = round(sum(z_linear)/float(len(z_linear)), 4)
            z_apxm_avg = round(sum(z_apxm)/float(len(z_apxm)), 4)

            ratio_al = []

            ratio_al_1 = 0

            for l in range (0,int(data_count)):
                tmp = z_apxm[l]/z_linear[l]
                ratio_al.append(tmp)

                if tmp == 1.0:
                    ratio_al_1 += 1

            ratio_al_min = round(min(ratio_al), 4)
            ratio_al_avg = round(sum(ratio_al)/float(data_count), 4) 
            ratio_al_1 = round(ratio_al_1 /float(data_count), 4)

            line_new = '%3s  %3s  %3s %8s  %8s  %8s  %8s  %8s' % (benefit, capacity, loading,str(z_linear_avg),str(z_apxm_avg),str(ratio_al_avg),str(ratio_al_1),str(ratio_al_min))
            vsf.write(line_new+"\n")
                    
