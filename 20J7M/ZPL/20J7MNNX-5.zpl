set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.921, <2> 29.2601, <3> 33.2659, <4> 31.1178, <5> 27.3565, <6> 28.4541, <7> 28.0799, <8> 23.941, <9> 19.3521, <10> 23.1314, <11> 29.5383, <12> 27.4569, <13> 25.9392, <14> 33.7767, <15> 25.5319, <16> 25.4264, <17> 31.754, <18> 26.5984, <19> 31.1924, <20> 26.9931;
param workload[JOB] := <1> 5.0913, <2> 5.4093, <3> 5.7677, <4> 5.5783, <5> 5.2303, <6> 5.3342, <7> 5.299, <8> 4.893, <9> 4.3991, <10> 4.8095, <11> 5.4349, <12> 5.2399, <13> 5.0931, <14> 5.8118, <15> 5.0529, <16> 5.0425, <17> 5.6351, <18> 5.1574, <19> 5.585, <20> 5.1955;
param capacity[MACHINE] := <1> 105.0598, <2> 105.0598, <3> 105.0598, <4> 105.0598, <5> 105.0598, <6> 105.0598, <7> 105.0598;

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
