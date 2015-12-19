set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.5495, <2> 24.6742, <3> 33.2756, <4> 32.1676, <5> 25.4752, <6> 33.4624, <7> 25.318, <8> 21.2276, <9> 18.3487, <10> 24.9337;
param workload[JOB] := <1> 29.5495, <2> 24.6742, <3> 33.2756, <4> 32.1676, <5> 25.4752, <6> 33.4624, <7> 25.318, <8> 21.2276, <9> 18.3487, <10> 24.9337;
param capacity[MACHINE] := <1> 268.4325, <2> 268.4325, <3> 268.4325;

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
