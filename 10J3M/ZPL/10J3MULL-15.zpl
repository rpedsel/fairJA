set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.0994, <2> 0.349, <3> 37.4599, <4> 34.033, <5> 23.2749, <6> 14.2186, <7> 12.3161, <8> 16.0458, <9> 29.9105, <10> 24.8255;
param workload[JOB] := <1> 29.0994, <2> 0.349, <3> 37.4599, <4> 34.033, <5> 23.2749, <6> 14.2186, <7> 12.3161, <8> 16.0458, <9> 29.9105, <10> 24.8255;
param capacity[MACHINE] := <1> 73.8442, <2> 73.8442, <3> 73.8442;

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
