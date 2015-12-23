set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.0931, <2> 4.9325, <3> 24.008, <4> 24.6509, <5> 31.5118, <6> 29.9111, <7> 16.8263, <8> 26.7463, <9> 25.2543, <10> 22.757, <11> 44.1355, <12> 25.0185, <13> 43.0342, <14> 16.5233, <15> 44.002, <16> 14.5673, <17> 48.6323, <18> 29.7861, <19> 29.1183, <20> 8.3248;
param workload[JOB] := <1> 2.4684, <2> 2.2209, <3> 4.8998, <4> 4.965, <5> 5.6135, <6> 5.4691, <7> 4.102, <8> 5.1717, <9> 5.0254, <10> 4.7704, <11> 6.6435, <12> 5.0018, <13> 6.56, <14> 4.0649, <15> 6.6334, <16> 3.8167, <17> 6.9737, <18> 5.4577, <19> 5.3961, <20> 2.8853;
param capacity[MACHINE] := <1> 14.0199, <2> 14.0199, <3> 14.0199, <4> 14.0199, <5> 14.0199, <6> 14.0199, <7> 14.0199;

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
