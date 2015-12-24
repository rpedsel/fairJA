set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.0332, <2> 24.9049, <3> 27.6182, <4> 22.9495, <5> 18.274, <6> 34.8399, <7> 24.6222, <8> 24.9822, <9> 24.1403, <10> 23.7381;
param workload[JOB] := <1> 24.0332, <2> 24.9049, <3> 27.6182, <4> 22.9495, <5> 18.274, <6> 34.8399, <7> 24.6222, <8> 24.9822, <9> 24.1403, <10> 23.7381;
param capacity[MACHINE] := <1> 250.1025, <2> 250.1025, <3> 250.1025;

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
