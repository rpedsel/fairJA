set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.4015, <2> 40.9717, <3> 18.5685, <4> 42.2339, <5> 5.9375, <6> 33.0776, <7> 5.55, <8> 40.497, <9> 17.0211, <10> 23.0411;
param workload[JOB] := <1> 33.5267, <2> 37.9025, <3> 31.7239, <4> 7.3244, <5> 41.1735, <6> 14.057, <7> 46.4254, <8> 25.2689, <9> 32.4566, <10> 22.2445;
param capacity[MACHINE] := <1> 73.0259, <2> 73.0259, <3> 73.0259;

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
