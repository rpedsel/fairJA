set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.951, <2> 32.4696, <3> 1.066, <4> 42.6051, <5> 0.5924, <6> 3.9121, <7> 15.1193, <8> 24.4278, <9> 14.9975, <10> 29.5673;
param workload[JOB] := <1> 781.2584, <2> 1054.2749, <3> 1.1364, <4> 1815.1945, <5> 0.3509, <6> 15.3045, <7> 228.5932, <8> 596.7174, <9> 224.925, <10> 874.2252;
param capacity[MACHINE] := <1> 1863.9935, <2> 1863.9935, <3> 1863.9935;

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
