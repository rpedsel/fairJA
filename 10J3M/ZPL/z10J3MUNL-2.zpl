set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.567, <2> 7.0946, <3> 39.5962, <4> 3.0505, <5> 35.1104, <6> 2.95, <7> 5.012, <8> 40.7213, <9> 21.3222, <10> 31.5793;
param workload[JOB] := <1> 27.567, <2> 7.0946, <3> 39.5962, <4> 3.0505, <5> 35.1104, <6> 2.95, <7> 5.012, <8> 40.7213, <9> 21.3222, <10> 31.5793;
param capacity[MACHINE] := <1> 214.0035, <2> 214.0035, <3> 214.0035;

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
