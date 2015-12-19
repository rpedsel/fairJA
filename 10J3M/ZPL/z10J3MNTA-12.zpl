set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.0148, <2> 25.3498, <3> 22.8845, <4> 27.7358, <5> 16.9109, <6> 20.4955, <7> 20.6393, <8> 26.9988, <9> 33.0856, <10> 22.5169;
param workload[JOB] := <1> 484.6514, <2> 642.6124, <3> 523.7003, <4> 769.2746, <5> 285.9785, <6> 420.0655, <7> 425.9807, <8> 728.9352, <9> 1094.6569, <10> 507.0108;
param capacity[MACHINE] := <1> 1470.7166, <2> 1470.7166, <3> 1470.7166;

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
