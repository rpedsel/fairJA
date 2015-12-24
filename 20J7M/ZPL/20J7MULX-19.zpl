set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.633, <2> 24.7129, <3> 10.5743, <4> 18.9814, <5> 18.3947, <6> 37.0218, <7> 21.7906, <8> 13.7099, <9> 30.4969, <10> 2.7247, <11> 40.5175, <12> 39.8871, <13> 19.4951, <14> 39.7843, <15> 25.638, <16> 38.2378, <17> 46.1338, <18> 5.0308, <19> 23.7792, <20> 14.1853;
param workload[JOB] := <1> 3.1037, <2> 4.9712, <3> 3.2518, <4> 4.3568, <5> 4.2889, <6> 6.0846, <7> 4.668, <8> 3.7027, <9> 5.5224, <10> 1.6507, <11> 6.3653, <12> 6.3156, <13> 4.4153, <14> 6.3075, <15> 5.0634, <16> 6.1837, <17> 6.7922, <18> 2.2429, <19> 4.8764, <20> 3.7663;
param capacity[MACHINE] := <1> 13.4185, <2> 13.4185, <3> 13.4185, <4> 13.4185, <5> 13.4185, <6> 13.4185, <7> 13.4185;

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
