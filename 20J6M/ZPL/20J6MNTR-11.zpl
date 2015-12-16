set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.0728, <2> 37.228, <3> 25.9617, <4> 23.0328, <5> 29.3427, <6> 23.1181, <7> 26.4817, <8> 24.9434, <9> 19.1859, <10> 25.1273, <11> 31.3013, <12> 22.3226, <13> 31.376, <14> 26.5606, <15> 24.659, <16> 6.4233, <17> 22.6354, <18> 34.2408, <19> 14.9216, <20> 21.7383;
param workload[JOB] := <1> 20.8799, <2> 11.3525, <3> 11.2696, <4> 28.9726, <5> 0.4461, <6> 19.4073, <7> 35.8526, <8> 11.1808, <9> 39.4964, <10> 9.6049, <11> 39.6383, <12> 15.5436, <13> 22.8175, <14> 45.6693, <15> 8.2807, <16> 5.4374, <17> 33.4781, <18> 8.4474, <19> 33.1036, <20> 36.3027;
param capacity[MACHINE] := <1> 54.6477, <2> 54.6477, <3> 54.6477, <4> 54.6477, <5> 54.6477, <6> 54.6477;

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
