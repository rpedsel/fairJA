set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.8342, <2> 29.0686, <3> 15.9055, <4> 20.1297, <5> 19.0428, <6> 30.843, <7> 21.5057, <8> 21.8813, <9> 23.0883, <10> 27.8592, <11> 29.4156, <12> 16.0748, <13> 35.7118, <14> 24.8923, <15> 20.3401, <16> 18.0684, <17> 26.4931, <18> 26.1552, <19> 26.3585, <20> 29.6095;
param workload[JOB] := <1> 44.265, <2> 25.9368, <3> 14.9693, <4> 23.2408, <5> 17.3305, <6> 15.8329, <7> 18.4535, <8> 37.8318, <9> 38.1499, <10> 34.4266, <11> 48.4535, <12> 42.7769, <13> 49.9713, <14> 20.2009, <15> 9.7155, <16> 11.5003, <17> 27.5939, <18> 40.7574, <19> 23.8864, <20> 8.2491;
param capacity[MACHINE] := <1> 69.1928, <2> 69.1928, <3> 69.1928, <4> 69.1928, <5> 69.1928, <6> 69.1928;

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
