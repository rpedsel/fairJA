set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.0013, <2> 35.1698, <3> 25.2574, <4> 28.9533, <5> 21.2377, <6> 26.0097, <7> 28.379, <8> 24.2962, <9> 27.5683, <10> 30.4027;
param workload[JOB] := <1> 27.0013, <2> 35.1698, <3> 25.2574, <4> 28.9533, <5> 21.2377, <6> 26.0097, <7> 28.379, <8> 24.2962, <9> 27.5683, <10> 30.4027;
param capacity[MACHINE] := <1> 274.2754, <2> 274.2754, <3> 274.2754;

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
