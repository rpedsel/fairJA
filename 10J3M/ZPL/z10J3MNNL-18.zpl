set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.5843, <2> 23.2103, <3> 18.388, <4> 23.4586, <5> 18.8103, <6> 34.2227, <7> 28.3099, <8> 33.783, <9> 29.2927, <10> 13.3682;
param workload[JOB] := <1> 30.5843, <2> 23.2103, <3> 18.388, <4> 23.4586, <5> 18.8103, <6> 34.2227, <7> 28.3099, <8> 33.783, <9> 29.2927, <10> 13.3682;
param capacity[MACHINE] := <1> 253.428, <2> 253.428, <3> 253.428;

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
