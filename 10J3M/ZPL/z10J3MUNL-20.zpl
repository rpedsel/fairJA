set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.423, <2> 8.6311, <3> 24.4358, <4> 37.0946, <5> 8.343, <6> 8.5362, <7> 42.3337, <8> 30.7361, <9> 30.2264, <10> 26.0407;
param workload[JOB] := <1> 12.423, <2> 8.6311, <3> 24.4358, <4> 37.0946, <5> 8.343, <6> 8.5362, <7> 42.3337, <8> 30.7361, <9> 30.2264, <10> 26.0407;
param capacity[MACHINE] := <1> 228.8006, <2> 228.8006, <3> 228.8006;

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
