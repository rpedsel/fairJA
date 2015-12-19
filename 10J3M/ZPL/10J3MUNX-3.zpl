set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.3036, <2> 49.4489, <3> 6.1968, <4> 7.8582, <5> 39.3314, <6> 38.9165, <7> 17.0507, <8> 4.683, <9> 45.0814, <10> 34.7016;
param workload[JOB] := <1> 6.2693, <2> 7.032, <3> 2.4893, <4> 2.8032, <5> 6.2715, <6> 6.2383, <7> 4.1292, <8> 2.164, <9> 6.7143, <10> 5.8908;
param capacity[MACHINE] := <1> 50.0019, <2> 50.0019, <3> 50.0019;

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
