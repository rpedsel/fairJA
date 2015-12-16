set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7749, <2> 28.7306, <3> 19.1616, <4> 24.5211, <5> 30.1686, <6> 28.838, <7> 21.6223, <8> 29.112, <9> 31.2739, <10> 27.431;
param workload[JOB] := <1> 25.7749, <2> 28.7306, <3> 19.1616, <4> 24.5211, <5> 30.1686, <6> 28.838, <7> 21.6223, <8> 29.112, <9> 31.2739, <10> 27.431;
param capacity[MACHINE] := <1> 266.634, <2> 266.634, <3> 266.634;

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
