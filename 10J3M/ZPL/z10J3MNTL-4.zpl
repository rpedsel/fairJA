set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.7564, <2> 27.1734, <3> 37.3391, <4> 28.4472, <5> 19.148, <6> 19.8144, <7> 22.9462, <8> 33.328, <9> 21.7702, <10> 22.2775;
param workload[JOB] := <1> 26.7564, <2> 27.1734, <3> 37.3391, <4> 28.4472, <5> 19.148, <6> 19.8144, <7> 22.9462, <8> 33.328, <9> 21.7702, <10> 22.2775;
param capacity[MACHINE] := <1> 64.7501, <2> 64.7501, <3> 64.7501;

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
