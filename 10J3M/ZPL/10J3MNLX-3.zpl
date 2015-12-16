set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.4628, <2> 32.352, <3> 31.1003, <4> 23.1306, <5> 29.9901, <6> 25.2812, <7> 20.2546, <8> 28.2174, <9> 17.7521, <10> 20.213;
param workload[JOB] := <1> 4.946, <2> 5.6879, <3> 5.5768, <4> 4.8094, <5> 5.4763, <6> 5.028, <7> 4.5005, <8> 5.312, <9> 4.2133, <10> 4.4959;
param capacity[MACHINE] := <1> 16.682, <2> 16.682, <3> 16.682;

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
