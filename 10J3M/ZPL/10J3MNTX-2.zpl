set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.1976, <2> 29.0727, <3> 27.8195, <4> 24.6642, <5> 25.7412, <6> 18.5634, <7> 23.8466, <8> 19.08, <9> 25.4976, <10> 36.1458;
param workload[JOB] := <1> 5.8479, <2> 5.3919, <3> 5.2744, <4> 4.9663, <5> 5.0736, <6> 4.3085, <7> 4.8833, <8> 4.3681, <9> 5.0495, <10> 6.0121;
param capacity[MACHINE] := <1> 12.7939, <2> 12.7939, <3> 12.7939;

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
