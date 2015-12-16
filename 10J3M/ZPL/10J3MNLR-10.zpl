set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.7284, <2> 29.7144, <3> 33.1011, <4> 29.5737, <5> 22.953, <6> 25.4061, <7> 29.8027, <8> 16.9044, <9> 20.6057, <10> 25.6444;
param workload[JOB] := <1> 10.8594, <2> 43.3184, <3> 39.4209, <4> 5.2153, <5> 39.2685, <6> 17.5735, <7> 12.5441, <8> 2.7099, <9> 3.0328, <10> 31.245;
param capacity[MACHINE] := <1> 68.3959, <2> 68.3959, <3> 68.3959;

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
