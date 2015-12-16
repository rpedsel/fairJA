set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.7006, <2> 47.6322, <3> 37.307, <4> 26.0986, <5> 13.5121, <6> 10.9909, <7> 49.4261, <8> 0.7869, <9> 41.5562, <10> 12.2441;
param workload[JOB] := <1> 23.7006, <2> 47.6322, <3> 37.307, <4> 26.0986, <5> 13.5121, <6> 10.9909, <7> 49.4261, <8> 0.7869, <9> 41.5562, <10> 12.2441;
param capacity[MACHINE] := <1> 87.7516, <2> 87.7516, <3> 87.7516;

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
