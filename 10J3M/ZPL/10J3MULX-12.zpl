set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.7836, <2> 49.835, <3> 17.2217, <4> 46.671, <5> 14.8757, <6> 39.2555, <7> 49.8444, <8> 13.0724, <9> 48.2633, <10> 1.3907;
param workload[JOB] := <1> 3.1279, <2> 7.0594, <3> 4.1499, <4> 6.8316, <5> 3.8569, <6> 6.2654, <7> 7.0601, <8> 3.6156, <9> 6.9472, <10> 1.1793;
param capacity[MACHINE] := <1> 16.6978, <2> 16.6978, <3> 16.6978;

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
