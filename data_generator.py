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


def B(x):
    return {
        0: 'N',
        1: 'U',
    }[x%2]

def C(x):
    return {
        0: 'L',
        1: 'T',
        2: 'N',
    }[x%3]

def L(x):
    return {
        0: 'L',
        1: 'X',
        2: 'A',
        3: 'R',
    }[x%4]       

for xx in range (0,24):
    benefit = B(xx)
    capacity = C(xx)
    loading = L(xx)

    for x in range (1,int(data_count)+1):
        K = 0 # machine capacity
        f_dat = jobs+"J"+machines+"M"+"/DAT/"+jobs+"J"+machines+"M"+benefit+capacity+loading+"-"+str(x)+".dat"
        f = open(f_dat,'w')
        f.write(jobs+" "+machines+"\n")

        for y in range (1,int(jobs)+1):
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


                
 