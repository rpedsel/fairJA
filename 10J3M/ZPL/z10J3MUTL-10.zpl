set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.0244, <2> 46.0613, <3> 41.7844, <4> 22.181, <5> 9.1786, <6> 23.8766, <7> 20.492, <8> 38.3271, <9> 49.7734, <10> 6.2502;
param workload[JOB] := <1> 38.0244, <2> 46.0613, <3> 41.7844, <4> 22.181, <5> 9.1786, <6> 23.8766, <7> 20.492, <8> 38.3271, <9> 49.7734, <10> 6.2502;
param capacity[MACHINE] := <1> 73.9873, <2> 73.9873, <3> 73.9873;

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
