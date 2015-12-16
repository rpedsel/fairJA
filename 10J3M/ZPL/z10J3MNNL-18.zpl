set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.9466, <2> 24.5129, <3> 20.8081, <4> 31.2906, <5> 24.2465, <6> 18.6695, <7> 11.6208, <8> 31.3461, <9> 26.0271, <10> 20.2448;
param workload[JOB] := <1> 21.9466, <2> 24.5129, <3> 20.8081, <4> 31.2906, <5> 24.2465, <6> 18.6695, <7> 11.6208, <8> 31.3461, <9> 26.0271, <10> 20.2448;
param capacity[MACHINE] := <1> 230.713, <2> 230.713, <3> 230.713;

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
