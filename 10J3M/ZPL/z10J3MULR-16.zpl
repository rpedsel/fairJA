set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.0821, <2> 3.635, <3> 47.6098, <4> 49.255, <5> 15.0771, <6> 14.2231, <7> 8.7782, <8> 21.4167, <9> 23.0557, <10> 27.2095;
param workload[JOB] := <1> 1.6257, <2> 23.7199, <3> 48.1012, <4> 44.8221, <5> 23.3885, <6> 25.3444, <7> 13.8924, <8> 19.6968, <9> 10.1605, <10> 44.6682;
param capacity[MACHINE] := <1> 85.1399, <2> 85.1399, <3> 85.1399;

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
