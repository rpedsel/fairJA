set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.2951, <2> 37.7159, <3> 47.9614, <4> 39.399, <5> 15.2655, <6> 21.3254, <7> 9.0732, <8> 14.2605, <9> 39.5869, <10> 40.3623;
param workload[JOB] := <1> 48.5463, <2> 34.9263, <3> 45.0668, <4> 37.5612, <5> 43.9503, <6> 49.1584, <7> 21.3039, <8> 44.8217, <9> 3.078, <10> 33.6699;
param capacity[MACHINE] := <1> 362.0828, <2> 362.0828, <3> 362.0828;

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
