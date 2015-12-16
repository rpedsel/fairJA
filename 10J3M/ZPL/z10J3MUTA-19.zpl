set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.3174, <2> 46.1026, <3> 36.4462, <4> 9.7375, <5> 11.2134, <6> 43.1348, <7> 47.9695, <8> 20.8729, <9> 29.5996, <10> 29.8875;
param workload[JOB] := <1> 11.0051, <2> 2125.4497, <3> 1328.3255, <4> 94.8189, <5> 125.7403, <6> 1860.611, <7> 2301.0729, <8> 435.678, <9> 876.1363, <10> 893.2627;
param capacity[MACHINE] := <1> 2513.0251, <2> 2513.0251, <3> 2513.0251;

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
