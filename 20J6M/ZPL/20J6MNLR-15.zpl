set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.8474, <2> 25.8258, <3> 29.7728, <4> 26.6162, <5> 34.0453, <6> 31.1523, <7> 31.4718, <8> 25.1198, <9> 24.283, <10> 22.3716, <11> 28.9467, <12> 27.8928, <13> 24.1177, <14> 31.0404, <15> 19.5561, <16> 23.2547, <17> 25.0597, <18> 22.5545, <19> 23.2399, <20> 21.918;
param workload[JOB] := <1> 43.7256, <2> 10.7175, <3> 22.1139, <4> 39.6486, <5> 29.6629, <6> 44.4686, <7> 26.8119, <8> 35.2544, <9> 10.6112, <10> 18.8696, <11> 22.3173, <12> 43.7138, <13> 23.0803, <14> 19.9824, <15> 6.5214, <16> 8.5904, <17> 22.4335, <18> 38.8083, <19> 0.7714, <20> 17.959;
param capacity[MACHINE] := <1> 81.0103, <2> 81.0103, <3> 81.0103, <4> 81.0103, <5> 81.0103, <6> 81.0103;

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
