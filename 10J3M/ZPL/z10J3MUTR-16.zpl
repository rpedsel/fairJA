set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.3724, <2> 31.2935, <3> 14.7719, <4> 9.0564, <5> 1.3578, <6> 17.693, <7> 46.2638, <8> 28.9172, <9> 37.3003, <10> 21.2119;
param workload[JOB] := <1> 8.8139, <2> 20.8091, <3> 30.2716, <4> 6.2704, <5> 3.5253, <6> 10.4429, <7> 39.0771, <8> 27.1854, <9> 45.3151, <10> 42.7458;
param capacity[MACHINE] := <1> 58.6141, <2> 58.6141, <3> 58.6141;

var x[JM] binary;
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
