set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.0254, <2> 37.2546, <3> 33.0864, <4> 32.9087, <5> 22.6926, <6> 29.6105, <7> 25.2185, <8> 31.5263, <9> 1.114, <10> 44.0196;
param workload[JOB] := <1> 8.2087, <2> 16.0027, <3> 25.093, <4> 1.116, <5> 37.4515, <6> 17.6519, <7> 47.3963, <8> 33.8293, <9> 20.6664, <10> 38.6505;
param capacity[MACHINE] := <1> 82.0221, <2> 82.0221, <3> 82.0221;

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
