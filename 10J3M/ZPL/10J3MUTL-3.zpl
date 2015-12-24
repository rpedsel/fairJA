set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.3667, <2> 16.2487, <3> 21.7177, <4> 28.8225, <5> 48.9733, <6> 22.5664, <7> 36.4922, <8> 14.1754, <9> 21.1008, <10> 0.6253;
param workload[JOB] := <1> 1.3667, <2> 16.2487, <3> 21.7177, <4> 28.8225, <5> 48.9733, <6> 22.5664, <7> 36.4922, <8> 14.1754, <9> 21.1008, <10> 0.6253;
param capacity[MACHINE] := <1> 53.0222, <2> 53.0222, <3> 53.0222;

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
