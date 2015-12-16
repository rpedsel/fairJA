set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.2972, <2> 19.6104, <3> 11.9421, <4> 31.1499, <5> 20.374, <6> 26.7467, <7> 27.0696, <8> 22.5128, <9> 25.1387, <10> 28.0246;
param workload[JOB] := <1> 21.8998, <2> 9.7391, <3> 29.8735, <4> 3.2815, <5> 48.8579, <6> 33.7436, <7> 21.5602, <8> 11.8392, <9> 0.5873, <10> 27.7964;
param capacity[MACHINE] := <1> 69.7262, <2> 69.7262, <3> 69.7262;

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
