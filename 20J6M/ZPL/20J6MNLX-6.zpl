set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.2805, <2> 30.3032, <3> 18.4309, <4> 20.264, <5> 19.672, <6> 31.2677, <7> 26.2772, <8> 29.2388, <9> 31.6344, <10> 28.6513, <11> 29.906, <12> 25.2151, <13> 24.9048, <14> 22.0208, <15> 24.4959, <16> 24.591, <17> 18.4328, <18> 19.2513, <19> 25.5501, <20> 25.1997;
param workload[JOB] := <1> 5.028, <2> 5.5048, <3> 4.2931, <4> 4.5016, <5> 4.4353, <6> 5.5918, <7> 5.1261, <8> 5.4073, <9> 5.6244, <10> 5.3527, <11> 5.4686, <12> 5.0215, <13> 4.9905, <14> 4.6926, <15> 4.9493, <16> 4.9589, <17> 4.2933, <18> 4.3876, <19> 5.0547, <20> 5.0199;
param capacity[MACHINE] := <1> 16.617, <2> 16.617, <3> 16.617, <4> 16.617, <5> 16.617, <6> 16.617;

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
