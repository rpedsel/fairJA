set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.0243, <2> 28.8299, <3> 28.8365, <4> 25.2308, <5> 30.7378, <6> 33.7981, <7> 21.3691, <8> 27.9098, <9> 20.9066, <10> 22.0514, <11> 22.4609, <12> 25.0433, <13> 30.6031, <14> 29.467, <15> 21.3264, <16> 26.8452, <17> 14.1751, <18> 22.8854, <19> 29.8627, <20> 22.7332;
param workload[JOB] := <1> 34.7079, <2> 49.7779, <3> 22.236, <4> 5.2294, <5> 26.8289, <6> 33.2043, <7> 2.3216, <8> 48.3982, <9> 23.4279, <10> 27.9098, <11> 5.442, <12> 26.4156, <13> 26.7374, <14> 45.9764, <15> 13.3633, <16> 22.2193, <17> 30.3678, <18> 20.7284, <19> 31.5948, <20> 20.9671;
param capacity[MACHINE] := <1> 86.309, <2> 86.309, <3> 86.309, <4> 86.309, <5> 86.309, <6> 86.309;

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
