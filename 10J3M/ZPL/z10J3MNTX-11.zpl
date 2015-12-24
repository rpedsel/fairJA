set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.4735, <2> 24.0192, <3> 26.0553, <4> 26.347, <5> 21.273, <6> 22.6843, <7> 25.632, <8> 34.0462, <9> 27.1794, <10> 23.2231;
param workload[JOB] := <1> 4.9471, <2> 4.9009, <3> 5.1044, <4> 5.1329, <5> 4.6123, <6> 4.7628, <7> 5.0628, <8> 5.8349, <9> 5.2134, <10> 4.819;
param capacity[MACHINE] := <1> 12.5976, <2> 12.5976, <3> 12.5976;

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
