set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.8832, <2> 23.6395, <3> 28.1947, <4> 20.991, <5> 16.7589, <6> 23.782, <7> 25.5161, <8> 27.9628, <9> 25.5301, <10> 36.3346;
param workload[JOB] := <1> 4.5698, <2> 4.862, <3> 5.3099, <4> 4.5816, <5> 4.0938, <6> 4.8767, <7> 5.0513, <8> 5.288, <9> 5.0527, <10> 6.0278;
param capacity[MACHINE] := <1> 49.7136, <2> 49.7136, <3> 49.7136;

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
