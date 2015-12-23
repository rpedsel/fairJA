from subprocess import call
from collections import namedtuple 
from operator import attrgetter, truediv
SolStruct = namedtuple("SolStruct", "dist_j value dist_m")


def zApproximateSeek(benefit, capacity, loading, llist, data_count,jobs, machines):
    
    z_apxm = []

    for x in range (1,int(data_count)+1):
        sortlist = []
        b_arr = []
        c_arr = []
        f_dat = jobs+"J"+machines+"M"+"/DAT/"+jobs+"J"+machines+"M"+benefit+capacity+loading+"-"+str(x)+".dat"
        
        zvalue = [0]*int(machines)
        zcapacity = [0]*int(machines)
        job_check = [0]*int(jobs)

        with open(f_dat, "r") as ins:
            Array_dat = []
            for line in ins:
                Array_dat.append(line)
        
        for dat_line in range(1,len(Array_dat)-1):
            b,c = Array_dat[dat_line].split()
            b_arr.append(str(b))
            c_arr.append(str(c))
        K = Array_dat[int(jobs)+1]    
        

        for j in range(0,int(jobs)):
            sortlist.append([])

            
        for y in llist[x-1]:
            if y.value == "1":
                job_check[int(y.dist_j)-1] = 1
                zcapacity[int(y.dist_m)-1] += float(c_arr[int(y.dist_j)-1])
                zvalue[int(y.dist_m)-1] += float(b_arr[int(y.dist_j)-1])
            else:
                sortlist[int(y.dist_j)-1].append(SolStruct(y.dist_j,float(y.value),y.dist_m))

        tmp_b_arr = map(float,b_arr)
        combine = sorted(zip(tmp_b_arr, sortlist), key = lambda x:x[0], reverse = True)
        sortlist_x = map(lambda x:x[1], combine)

        
                
        for j in range(0,int(jobs)):
            sortlist_x[j] = sorted(sortlist_x[j], key = attrgetter('value'), reverse = True)

            for jm in range(0,len(sortlist_x[j])):
                mm = int(sortlist_x[j][jm].dist_m)-1
                jj = int(sortlist_x[j][jm].dist_j)-1
                tmp = zcapacity[mm] + float(c_arr[jj])
                if tmp <= float(K):
                    if job_check[jj] == 0:
                        zvalue[mm] += float(b_arr[jj])
                        zcapacity[mm] += float(c_arr[jj])
                        job_check[jj] = 1
                    
        minzvalue = min(zvalue)
        z_apxm.append(round(minzvalue,4))
    return z_apxm

def zApproximateSeek_v2(benefit, capacity, loading, llist, data_count,jobs, machines):
    
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
           
        for y in llist[x-1]:
            if y.value == "1":
                job_check[int(y.dist_j)-1] = 1
                zcapacity[int(y.dist_m)-1] += float(c_arr[int(y.dist_j)-1])
                zvalue[int(y.dist_m)-1] += float(b_arr[int(y.dist_j)-1])
                vf.write("@1 job "+y.dist_j+" allocated to machine "+y.dist_m+"\n")
                vf.write("M1: "+str(zcapacity[0])+" ")
                vf.write("M2: "+str(zcapacity[1])+" ")
                vf.write("M3: "+str(zcapacity[2])+" \n\n")

        #job with high benefit -> low benefit
        tmp_b_arr = []
        for b in b_arr:
            tmp_b_arr.append(float(b))
        jindex = range(int(jobs))        

        idx_benefit = sorted(zip(jindex, tmp_b_arr), key = lambda x:x[1], reverse = True)

        mindex = range(int(machines))
        idx_zvalue = zip(mindex, zvalue)
                
        for j in idx_benefit:
            idx_zvalue = zip(mindex, zvalue)
            idx_zvalue = sorted(idx_zvalue, key = lambda x:x[1])
            #vf.write("idx_zvalue: "+str(idx_zvalue)+"\n")
            for m in idx_zvalue:
                vf.write("M: "+str(m[0]+1)+" J = "+str(j[0]+1)+" j_benefit ="+str(j[1])+"\n")
                tmp = zcapacity[int(m[0])] + float(c_arr[j[0]])
                vf.write("tmp = "+str(tmp)+" K = "+K+"\n")
                if job_check[j[0]] == 0:
                    vf.write("job check"+str(j[0]+1)+"\n")
                    if tmp <= float(K):
                        zvalue[m[0]] += float(j[1])
                        zcapacity[m[0]] += float(c_arr[j[0]])
                        job_check[j[0]] = 1
                        vf.write("@2 job "+str(j[0]+1)+" allocated to machine "+str(m[0]+1)+"\n")
                        vf.write("M1: "+str(zcapacity[0])+" ")
                        vf.write("M2: "+str(zcapacity[1])+" ")
                        vf.write("M3: "+str(zcapacity[2])+" \n\n")    
                 
        minzvalue = min(zvalue)
        z_apxm.append(round(minzvalue,4))
    return z_apxm
