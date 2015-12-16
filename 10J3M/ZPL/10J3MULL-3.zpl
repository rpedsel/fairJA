set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.603, <2> 11.0603, <3> 16.0364, <4> 38.4399, <5> 24.5281, <6> 45.6614, <7> 29.6156, <8> 31.1648, <9> 27.9193, <10> 12.8774;
param workload[JOB] := <1> 25.603, <2> 11.0603, <3> 16.0364, <4> 38.4399, <5> 24.5281, <6> 45.6614, <7> 29.6156, <8> 31.1648, <9> 27.9193, <10> 12.8774;
param capacity[MACHINE] := <1> 87.6354, <2> 87.6354, <3> 87.6354;

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
