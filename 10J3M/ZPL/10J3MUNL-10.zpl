set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.1328, <2> 19.7894, <3> 33.7783, <4> 30.6809, <5> 17.9556, <6> 41.0096, <7> 4.8333, <8> 43.2876, <9> 43.1432, <10> 18.9723;
param workload[JOB] := <1> 17.1328, <2> 19.7894, <3> 33.7783, <4> 30.6809, <5> 17.9556, <6> 41.0096, <7> 4.8333, <8> 43.2876, <9> 43.1432, <10> 18.9723;
param capacity[MACHINE] := <1> 270.583, <2> 270.583, <3> 270.583;

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
