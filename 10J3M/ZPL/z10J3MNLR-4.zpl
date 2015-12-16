set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.688, <2> 25.0244, <3> 23.6722, <4> 16.9089, <5> 26.9192, <6> 23.3152, <7> 30.0291, <8> 25.2557, <9> 23.9509, <10> 17.5501;
param workload[JOB] := <1> 13.2024, <2> 10.5105, <3> 48.7059, <4> 37.2084, <5> 33.2143, <6> 33.0323, <7> 0.9447, <8> 21.0941, <9> 13.871, <10> 10.7396;
param capacity[MACHINE] := <1> 74.1744, <2> 74.1744, <3> 74.1744;

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
