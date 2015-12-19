set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7307, <2> 23.2002, <3> 19.9007, <4> 29.4982, <5> 30.1033, <6> 20.5396, <7> 22.0082, <8> 27.0881, <9> 16.539, <10> 24.8581;
param workload[JOB] := <1> 25.7307, <2> 23.2002, <3> 19.9007, <4> 29.4982, <5> 30.1033, <6> 20.5396, <7> 22.0082, <8> 27.0881, <9> 16.539, <10> 24.8581;
param capacity[MACHINE] := <1> 79.822, <2> 79.822, <3> 79.822;

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
