set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.0503, <2> 26.0747, <3> 22.947, <4> 42.9065, <5> 21.3325, <6> 24.9995, <7> 7.6949, <8> 38.2357, <9> 11.2524, <10> 0.0407;
param workload[JOB] := <1> 7.0036, <2> 5.1063, <3> 4.7903, <4> 6.5503, <5> 4.6187, <6> 4.9999, <7> 2.774, <8> 6.1835, <9> 3.3545, <10> 0.2017;
param capacity[MACHINE] := <1> 15.1943, <2> 15.1943, <3> 15.1943;

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
