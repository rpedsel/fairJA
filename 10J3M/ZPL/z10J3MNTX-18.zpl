set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.1722, <2> 19.6067, <3> 13.6043, <4> 13.8885, <5> 19.4315, <6> 28.2971, <7> 28.4727, <8> 15.1941, <9> 21.2194, <10> 24.4411;
param workload[JOB] := <1> 5.1159, <2> 4.4279, <3> 3.6884, <4> 3.7267, <5> 4.4081, <6> 5.3195, <7> 5.336, <8> 3.898, <9> 4.6065, <10> 4.9438;
param capacity[MACHINE] := <1> 11.3677, <2> 11.3677, <3> 11.3677;

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
