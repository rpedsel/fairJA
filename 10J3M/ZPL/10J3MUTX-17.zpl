set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.137, <2> 12.0335, <3> 36.404, <4> 8.3425, <5> 42.7927, <6> 28.3121, <7> 23.8661, <8> 30.9762, <9> 43.5756, <10> 30.5156;
param workload[JOB] := <1> 5.0137, <2> 3.4689, <3> 6.0336, <4> 2.8883, <5> 6.5416, <6> 5.3209, <7> 4.8853, <8> 5.5656, <9> 6.6012, <10> 5.5241;
param capacity[MACHINE] := <1> 12.9608, <2> 12.9608, <3> 12.9608;

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
