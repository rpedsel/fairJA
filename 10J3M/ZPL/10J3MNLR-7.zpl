set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.0616, <2> 23.642, <3> 22.0175, <4> 24.0336, <5> 21.499, <6> 20.7326, <7> 27.2356, <8> 22.8038, <9> 22.4461, <10> 25.1841;
param workload[JOB] := <1> 4.0774, <2> 28.9781, <3> 12.9237, <4> 26.6044, <5> 29.6819, <6> 32.825, <7> 10.6994, <8> 17.4129, <9> 31.3585, <10> 32.7682;
param capacity[MACHINE] := <1> 75.7765, <2> 75.7765, <3> 75.7765;

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
