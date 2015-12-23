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

            for x in range(1,int(data_count)+1):
                K = 0 # machine capacity
                f_dat = jobs+"J"+machines+"M"+"/DAT/"+jobs+"J"+machines+"M"+benefit+capacity+loading+"-"+str(x)+".dat"
                f = open(f_dat,'w')
                f.write(jobs+" "+machines+"\n")

                for y in range(1,int(jobs)+1):
                    if benefit == "N":
                        b = round(random.gauss(25, 5),4)
                    elif benefit == "U":
                        b = round(random.uniform(0, 50),4)
                    if loading == "L":
                        c = b;
                    elif loading == "X":
                        c = round(math.sqrt(b),4)
                    elif loading == "A":
                        c = round(pow(b,2),4)
                    elif loading == "R":
                        c = round(random.uniform(0,50),4)
                    
                    f.write(str(b)+" "+str(c)+"\n")

                    K += c
                if capacity != "N":
                    K = round(K/int(machines),4)
                    if capacity == "T":
                        K = round(0.75*K,4)

                f.write(str(K))
                f.close()


                
 