set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.3093, <2> 16.9458, <3> 1.6063, <4> 12.4708, <5> 49.5861, <6> 5.9784, <7> 18.3762, <8> 29.0798, <9> 40.2654, <10> 32.3904, <11> 21.3429, <12> 33.996, <13> 32.7114, <14> 46.256, <15> 45.6027, <16> 8.5196, <17> 1.7766, <18> 37.7793, <19> 21.614, <20> 4.775;
param workload[JOB] := <1> 16.496, <2> 37.6925, <3> 48.461, <4> 41.8283, <5> 33.8251, <6> 36.8327, <7> 37.7427, <8> 24.6802, <9> 35.7813, <10> 30.0531, <11> 15.8093, <12> 3.2782, <13> 43.863, <14> 48.8461, <15> 49.9814, <16> 45.1467, <17> 48.9849, <18> 45.983, <19> 11.9641, <20> 24.9409;
param capacity[MACHINE] := <1> 85.2738, <2> 85.2738, <3> 85.2738, <4> 85.2738, <5> 85.2738, <6> 85.2738;

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
