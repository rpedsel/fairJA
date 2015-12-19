set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.0202, <2> 23.9363, <3> 22.227, <4> 26.4623, <5> 28.8133, <6> 24.6892, <7> 32.0376, <8> 27.224, <9> 28.4347, <10> 32.1197;
param workload[JOB] := <1> 29.0202, <2> 23.9363, <3> 22.227, <4> 26.4623, <5> 28.8133, <6> 24.6892, <7> 32.0376, <8> 27.224, <9> 28.4347, <10> 32.1197;
param capacity[MACHINE] := <1> 68.7411, <2> 68.7411, <3> 68.7411;

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
