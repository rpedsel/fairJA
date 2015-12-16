set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.0833, <2> 34.0653, <3> 48.7278, <4> 35.4636, <5> 24.1968, <6> 27.1241, <7> 47.1051, <8> 10.7251, <9> 33.0643, <10> 5.8963;
param workload[JOB] := <1> 10.0833, <2> 34.0653, <3> 48.7278, <4> 35.4636, <5> 24.1968, <6> 27.1241, <7> 47.1051, <8> 10.7251, <9> 33.0643, <10> 5.8963;
param capacity[MACHINE] := <1> 69.1129, <2> 69.1129, <3> 69.1129;

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
