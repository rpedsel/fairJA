set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.103, <2> 49.5579, <3> 21.4794, <4> 4.0101, <5> 4.0599, <6> 44.4578, <7> 40.0981, <8> 46.142, <9> 16.2712, <10> 4.8604;
param workload[JOB] := <1> 30.677, <2> 36.9613, <3> 32.3878, <4> 49.0983, <5> 25.0604, <6> 4.7108, <7> 14.4551, <8> 48.0501, <9> 27.0882, <10> 46.5869;
param capacity[MACHINE] := <1> 105.0253, <2> 105.0253, <3> 105.0253;

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
