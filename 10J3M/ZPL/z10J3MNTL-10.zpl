set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.7217, <2> 17.8499, <3> 30.6349, <4> 26.0831, <5> 26.7018, <6> 22.5993, <7> 20.6238, <8> 28.1948, <9> 25.5643, <10> 29.6425;
param workload[JOB] := <1> 23.7217, <2> 17.8499, <3> 30.6349, <4> 26.0831, <5> 26.7018, <6> 22.5993, <7> 20.6238, <8> 28.1948, <9> 25.5643, <10> 29.6425;
param capacity[MACHINE] := <1> 62.904, <2> 62.904, <3> 62.904;

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
