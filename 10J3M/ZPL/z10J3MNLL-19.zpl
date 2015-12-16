set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.2038, <2> 33.0166, <3> 24.8683, <4> 21.3901, <5> 24.8478, <6> 37.2064, <7> 14.7148, <8> 17.3628, <9> 32.8484, <10> 27.1323;
param workload[JOB] := <1> 19.2038, <2> 33.0166, <3> 24.8683, <4> 21.3901, <5> 24.8478, <6> 37.2064, <7> 14.7148, <8> 17.3628, <9> 32.8484, <10> 27.1323;
param capacity[MACHINE] := <1> 84.1971, <2> 84.1971, <3> 84.1971;

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
