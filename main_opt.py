import random, math, os, sys
from operator import attrgetter, truediv

import zStarSeeker, zLinearSeeker, zApproximateSeeker  #three solver functions 

if __name__ == '__main__':

    data_count = 20                                     
    jobs = raw_input("Number of jobs:")           
    machines = raw_input("Number of machines:")

    vs = jobs+"J"+machines+"M"+"/"+jobs+"J"+machines+"M.stat"  # save ouput in XJXM.stat file
    vsf = open(vs, 'a')
    vsf.write("  B    C    L       z*        za     r-avg       r-1     r-min")
    #vsf.write("  B    C    L      *zl*       za     r-avg       r-1     r-min")
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
                
                z_star = zStarSeeker.zStarSeek(benefit, capacity, loading, data_count, jobs, machines)
                z_linear, z_linear_list = zLinearSeeker.zLinearSeek(benefit, capacity, loading, data_count, jobs, machines)
                z_apxm = zApproximateSeeker.zApproximateSeek_v2(benefit, capacity, loading, z_linear_list, data_count, jobs, machines)

                z_star_avg = round(sum(z_star)/float(len(z_star)), 4)
                z_linear_avg = round(sum(z_linear)/float(len(z_linear)),4)
                z_apxm_avg = round(sum(z_apxm)/float(len(z_apxm)), 4)

                ratio = []

                ratio_1 = 0

                for l in range (0,int(data_count)):
                    #tmp = z_apxm[l]/z_linear[l]
                    tmp = z_apxm[l]/z_star[l]
                    ratio.append(tmp)

                    if tmp == 1.0:
                        ratio_1 += 1

                ratio_min = round(min(ratio), 4)
                ratio_avg = round(sum(ratio)/float(data_count), 4) 
                ratio_1 = round(ratio_1 /float(data_count), 4)
                #line_new = '%3s  %3s  %3s %8s  %8s  %8s  %8s  %8s' % (benefit, capacity, loading,str(z_linear_avg),str(z_apxm_avg),str(ratio_avg),str(ratio_1),str(ratio_min))
                line_new = '%3s  %3s  %3s %8s  %8s  %8s  %8s  %8s' % (benefit, capacity, loading,str(z_star_avg),str(z_apxm_avg),str(ratio_avg),str(ratio_1),str(ratio_min))
                vsf.write(line_new+"\n")
                        
