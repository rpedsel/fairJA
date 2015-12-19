set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.3952, <2> 30.4164, <3> 25.4754, <4> 25.5703, <5> 16.8412, <6> 28.3903, <7> 16.1436, <8> 12.4503, <9> 24.2888, <10> 24.16;
param workload[JOB] := <1> 750.497, <2> 925.1574, <3> 648.996, <4> 653.8402, <5> 283.626, <6> 806.0091, <7> 260.6158, <8> 155.01, <9> 589.9458, <10> 583.7056;
param capacity[MACHINE] := <1> 5657.4029, <2> 5657.4029, <3> 5657.4029;

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
