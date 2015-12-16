set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.7839, <2> 28.8314, <3> 46.0539, <4> 18.8823, <5> 22.0617, <6> 5.8527, <7> 36.4598, <8> 3.2863, <9> 17.129, <10> 47.3814, <11> 9.8319, <12> 26.1624, <13> 41.0882, <14> 3.2706, <15> 9.2623, <16> 37.3324, <17> 37.4897, <18> 35.0696, <19> 0.1756, <20> 17.9779;
param workload[JOB] := <1> 5.3651, <2> 5.3695, <3> 6.7863, <4> 4.3454, <5> 4.697, <6> 2.4192, <7> 6.0382, <8> 1.8128, <9> 4.1387, <10> 6.8834, <11> 3.1356, <12> 5.1149, <13> 6.41, <14> 1.8085, <15> 3.0434, <16> 6.11, <17> 6.1229, <18> 5.922, <19> 0.419, <20> 4.24;
param capacity[MACHINE] := <1> 11.2727, <2> 11.2727, <3> 11.2727, <4> 11.2727, <5> 11.2727, <6> 11.2727;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
