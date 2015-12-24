set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.233, <2> 6.7506, <3> 0.8659, <4> 28.8204, <5> 15.8865, <6> 22.8972, <7> 26.0917, <8> 13.0017, <9> 40.6577, <10> 49.0872;
param workload[JOB] := <1> 21.233, <2> 6.7506, <3> 0.8659, <4> 28.8204, <5> 15.8865, <6> 22.8972, <7> 26.0917, <8> 13.0017, <9> 40.6577, <10> 49.0872;
param capacity[MACHINE] := <1> 75.0973, <2> 75.0973, <3> 75.0973;

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
