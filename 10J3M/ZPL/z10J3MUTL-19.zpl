set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.1305, <2> 37.9616, <3> 43.7376, <4> 34.1984, <5> 29.4204, <6> 15.381, <7> 11.5812, <8> 7.1248, <9> 8.0527, <10> 27.149;
param workload[JOB] := <1> 47.1305, <2> 37.9616, <3> 43.7376, <4> 34.1984, <5> 29.4204, <6> 15.381, <7> 11.5812, <8> 7.1248, <9> 8.0527, <10> 27.149;
param capacity[MACHINE] := <1> 65.4343, <2> 65.4343, <3> 65.4343;

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
