set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.2403, <2> 6.1015, <3> 29.0974, <4> 34.247, <5> 39.6909, <6> 10.1545, <7> 44.3632, <8> 40.9377, <9> 35.5433, <10> 17.8172;
param workload[JOB] := <1> 39.2403, <2> 6.1015, <3> 29.0974, <4> 34.247, <5> 39.6909, <6> 10.1545, <7> 44.3632, <8> 40.9377, <9> 35.5433, <10> 17.8172;
param capacity[MACHINE] := <1> 74.2982, <2> 74.2982, <3> 74.2982;

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
