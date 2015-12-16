set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.6597, <2> 22.0016, <3> 24.4361, <4> 30.6003, <5> 29.5861, <6> 14.3296, <7> 25.5558, <8> 20.072, <9> 29.1345, <10> 18.9128;
param workload[JOB] := <1> 559.7814, <2> 484.0704, <3> 597.123, <4> 936.3784, <5> 875.3373, <6> 205.3374, <7> 653.0989, <8> 402.8852, <9> 848.8191, <10> 357.694;
param capacity[MACHINE] := <1> 1973.5084, <2> 1973.5084, <3> 1973.5084;

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
