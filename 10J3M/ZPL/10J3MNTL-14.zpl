set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.6742, <2> 27.2602, <3> 30.1951, <4> 20.399, <5> 14.4276, <6> 26.2478, <7> 20.6958, <8> 30.349, <9> 23.5866, <10> 21.7556;
param workload[JOB] := <1> 29.6742, <2> 27.2602, <3> 30.1951, <4> 20.399, <5> 14.4276, <6> 26.2478, <7> 20.6958, <8> 30.349, <9> 23.5866, <10> 21.7556;
param capacity[MACHINE] := <1> 61.1477, <2> 61.1477, <3> 61.1477;

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
