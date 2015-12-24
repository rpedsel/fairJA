set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.2762, <2> 34.3152, <3> 9.1145, <4> 5.0886, <5> 1.2358, <6> 4.7493, <7> 32.6733, <8> 30.6234, <9> 0.1117, <10> 24.7728;
param workload[JOB] := <1> 5.2762, <2> 34.3152, <3> 9.1145, <4> 5.0886, <5> 1.2358, <6> 4.7493, <7> 32.6733, <8> 30.6234, <9> 0.1117, <10> 24.7728;
param capacity[MACHINE] := <1> 49.3203, <2> 49.3203, <3> 49.3203;

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
