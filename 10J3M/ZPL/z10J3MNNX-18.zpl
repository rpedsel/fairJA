set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3559, <2> 12.355, <3> 24.0924, <4> 26.5458, <5> 24.8659, <6> 32.3505, <7> 25.7451, <8> 36.0778, <9> 23.8727, <10> 12.9388;
param workload[JOB] := <1> 5.0355, <2> 3.515, <3> 4.9084, <4> 5.1523, <5> 4.9866, <6> 5.6877, <7> 5.074, <8> 6.0065, <9> 4.886, <10> 3.5971;
param capacity[MACHINE] := <1> 48.8491, <2> 48.8491, <3> 48.8491;

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
