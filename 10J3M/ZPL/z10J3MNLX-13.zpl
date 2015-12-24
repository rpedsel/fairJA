set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.2474, <2> 22.1076, <3> 34.393, <4> 14.2705, <5> 26.8099, <6> 16.989, <7> 27.8967, <8> 28.8604, <9> 26.0734, <10> 22.8108;
param workload[JOB] := <1> 5.1232, <2> 4.7019, <3> 5.8646, <4> 3.7776, <5> 5.1778, <6> 4.1218, <7> 5.2817, <8> 5.3722, <9> 5.1062, <10> 4.7761;
param capacity[MACHINE] := <1> 16.4344, <2> 16.4344, <3> 16.4344;

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
