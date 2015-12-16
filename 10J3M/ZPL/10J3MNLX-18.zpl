set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.4776, <2> 28.772, <3> 22.3865, <4> 37.1081, <5> 26.5647, <6> 23.6985, <7> 23.418, <8> 29.9642, <9> 23.8866, <10> 24.8529;
param workload[JOB] := <1> 4.1806, <2> 5.364, <3> 4.7314, <4> 6.0916, <5> 5.1541, <6> 4.8681, <7> 4.8392, <8> 5.474, <9> 4.8874, <10> 4.9853;
param capacity[MACHINE] := <1> 16.8586, <2> 16.8586, <3> 16.8586;

var x[JM];
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
