set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.7575, <2> 19.2849, <3> 27.3125, <4> 20.377, <5> 17.388, <6> 25.8367, <7> 18.0697, <8> 31.0235, <9> 23.3149, <10> 27.7896, <11> 30.5114, <12> 27.052, <13> 22.0434, <14> 21.6741, <15> 27.5848, <16> 30.2047, <17> 18.0825, <18> 22.2592, <19> 16.9226, <20> 28.1686;
param workload[JOB] := <1> 4.8742, <2> 4.3915, <3> 5.2261, <4> 4.5141, <5> 4.1699, <6> 5.083, <7> 4.2508, <8> 5.5699, <9> 4.8286, <10> 5.2716, <11> 5.5237, <12> 5.2012, <13> 4.695, <14> 4.6555, <15> 5.2521, <16> 5.4959, <17> 4.2524, <18> 4.718, <19> 4.1137, <20> 5.3074;
param capacity[MACHINE] := <1> 10.4351, <2> 10.4351, <3> 10.4351, <4> 10.4351, <5> 10.4351, <6> 10.4351, <7> 10.4351;

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
