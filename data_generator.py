## v2 with linear relaxation /CHBP <- linear solution as "r"
## capacity : add N -> no capacity (as large as the sum of all) 

import random, math, os, sys
##from subprocess import call
##from collections import namedtuple 
##from operator import attrgetter

data_count = 20                                     
jobs = raw_input("Number of jobs:")           
machines = raw_input("Number of machines:")

directory = jobs+"J"+machines+"M" 
if not os.path.exists(directory):
    os.makedirs(directory)

subdirectory = directory+"/SOL"
if not os.path.exists(subdirectory):
    os.makedirs(subdirectory)        

subdirectory = directory+"/ZPL"
if not os.path.exists(subdirectory):
    os.makedirs(subdirectory)   

subdirectory = directory+"/DAT"
if not os.path.exists(subdirectory):
    os.makedirs(subdirectory) 


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

            for x in range(0,int(data_count)):
                b = []
                c = []
                check = 0
                K = 0
                f_dat = jobs+"J"+machines+"M"+"/DAT/"+jobs+"J"+machines+"M"+benefit+capacity+loading+"-"+str(x+1)+".dat"
                f = open(f_dat,'w')
                f.write(jobs+" "+machines+"\n")
                while(check == 0):
                    K = 0
                    for y in range(0,int(jobs)):
                        if benefit == "N":
                            b_tmp = round(random.gauss(25, 5),4)
                            b.append(b_tmp)
                        elif benefit == "U":
                            b_tmp = round(random.uniform(0, 50),4)
                            b.append(b_tmp)
                        if loading == "L":
                            c_tmp = b_tmp
                            c.append(c_tmp);
                        elif loading == "X":
                            c_tmp = round(math.sqrt(b_tmp),4)
                            c.append(c_tmp)
                        elif loading == "A":
                            c_tmp = round(pow(b_tmp,2),4)
                            c.append(c_tmp)
                        elif loading == "R":
                            c_tmp = round(random.uniform(0,50),4)
                            c.append(c_tmp)
                        K += c_tmp
                    if capacity != "N":
                        K = round(K/int(machines),4)
                        if capacity == "T":
                            K = round(0.75*K,4)
                    check = 1
                    for y in range(0,int(jobs)):
                        if c[y] > K:
                            check = 0

                for y in range(0, int(jobs)):
                    f.write(str(b[y])+" "+str(c[y])+"\n")
                            
                f.write(str(K))
                f.close()


                
 