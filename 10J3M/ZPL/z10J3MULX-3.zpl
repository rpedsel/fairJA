set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.0593, <2> 20.4585, <3> 29.7882, <4> 14.2579, <5> 46.9727, <6> 36.7422, <7> 27.3061, <8> 4.7818, <9> 37.5507, <10> 6.6758;
param workload[JOB] := <1> 0.2435, <2> 4.5231, <3> 5.4579, <4> 3.776, <5> 6.8537, <6> 6.0615, <7> 5.2255, <8> 2.1867, <9> 6.1279, <10> 2.5838;
param capacity[MACHINE] := <1> 14.3465, <2> 14.3465, <3> 14.3465;

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
