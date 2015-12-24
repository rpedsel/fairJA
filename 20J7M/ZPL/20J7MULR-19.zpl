set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.382, <2> 41.3576, <3> 20.982, <4> 23.9095, <5> 34.9202, <6> 4.8577, <7> 16.092, <8> 0.7563, <9> 37.9925, <10> 0.5726, <11> 4.5013, <12> 16.7924, <13> 11.1196, <14> 28.9491, <15> 8.4373, <16> 44.2252, <17> 44.3977, <18> 28.7162, <19> 38.7197, <20> 22.8503;
param workload[JOB] := <1> 21.0231, <2> 10.3945, <3> 47.5879, <4> 31.2063, <5> 21.4329, <6> 2.1921, <7> 6.2338, <8> 10.9584, <9> 44.7895, <10> 6.8999, <11> 6.307, <12> 21.2904, <13> 23.3058, <14> 7.6775, <15> 44.1004, <16> 30.2581, <17> 19.3473, <18> 25.0224, <19> 48.9591, <20> 48.3426;
param capacity[MACHINE] := <1> 68.1899, <2> 68.1899, <3> 68.1899, <4> 68.1899, <5> 68.1899, <6> 68.1899, <7> 68.1899;

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
