set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.8326, <2> 29.3674, <3> 3.1115, <4> 39.0005, <5> 30.9838, <6> 33.7005, <7> 45.2007, <8> 6.0621, <9> 23.3699, <10> 10.6342;
param workload[JOB] := <1> 220.006, <2> 862.4442, <3> 9.6814, <4> 1521.039, <5> 959.9959, <6> 1135.7237, <7> 2043.1033, <8> 36.7491, <9> 546.1522, <10> 113.0862;
param capacity[MACHINE] := <1> 2482.6603, <2> 2482.6603, <3> 2482.6603;

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
