set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.089, <2> 45.4642, <3> 18.0996, <4> 25.4761, <5> 38.7618, <6> 21.2868, <7> 25.8205, <8> 24.4134, <9> 39.303, <10> 3.7821, <11> 28.0256, <12> 3.0279, <13> 17.4762, <14> 28.2698, <15> 45.0868, <16> 17.8807, <17> 20.5005, <18> 30.5496, <19> 47.3183, <20> 5.4485;
param workload[JOB] := <1> 1527.9499, <2> 2066.9935, <3> 327.5955, <4> 649.0317, <5> 1502.4771, <6> 453.1279, <7> 666.6982, <8> 596.0141, <9> 1544.7258, <10> 14.3043, <11> 785.4343, <12> 9.1682, <13> 305.4176, <14> 799.1816, <15> 2032.8195, <16> 319.7194, <17> 420.2705, <18> 933.2781, <19> 2239.0215, <20> 29.6862;
param capacity[MACHINE] := <1> 2315.4853, <2> 2315.4853, <3> 2315.4853, <4> 2315.4853, <5> 2315.4853, <6> 2315.4853, <7> 2315.4853;

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
