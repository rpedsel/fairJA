set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.7737, <2> 19.1778, <3> 26.7111, <4> 26.7979, <5> 21.3061, <6> 27.1992, <7> 20.9513, <8> 23.1167, <9> 29.8965, <10> 23.1028;
param workload[JOB] := <1> 19.7737, <2> 19.1778, <3> 26.7111, <4> 26.7979, <5> 21.3061, <6> 27.1992, <7> 20.9513, <8> 23.1167, <9> 29.8965, <10> 23.1028;
param capacity[MACHINE] := <1> 59.5083, <2> 59.5083, <3> 59.5083;

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
