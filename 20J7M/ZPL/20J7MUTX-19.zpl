set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 43.2021, <2> 32.7511, <3> 17.9319, <4> 21.1261, <5> 25.8579, <6> 15.2099, <7> 46.1224, <8> 27.753, <9> 37.4049, <10> 31.3405, <11> 4.6819, <12> 25.7946, <13> 26.5186, <14> 23.3195, <15> 4.9763, <16> 36.8214, <17> 20.6912, <18> 10.9173, <19> 31.2469, <20> 16.6167;
param workload[JOB] := <1> 6.5728, <2> 5.7229, <3> 4.2346, <4> 4.5963, <5> 5.0851, <6> 3.9, <7> 6.7913, <8> 5.2681, <9> 6.116, <10> 5.5983, <11> 2.1638, <12> 5.0788, <13> 5.1496, <14> 4.829, <15> 2.2308, <16> 6.0681, <17> 4.5488, <18> 3.3041, <19> 5.5899, <20> 4.0764;
param capacity[MACHINE] := <1> 10.3848, <2> 10.3848, <3> 10.3848, <4> 10.3848, <5> 10.3848, <6> 10.3848, <7> 10.3848;

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
