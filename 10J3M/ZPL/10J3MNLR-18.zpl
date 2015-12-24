set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.7316, <2> 25.8828, <3> 25.8853, <4> 18.1863, <5> 28.8671, <6> 32.9663, <7> 25.189, <8> 26.4028, <9> 29.383, <10> 28.2188;
param workload[JOB] := <1> 48.0172, <2> 34.9489, <3> 40.2087, <4> 3.383, <5> 5.1771, <6> 16.4687, <7> 24.6032, <8> 36.5383, <9> 12.9624, <10> 38.0715;
param capacity[MACHINE] := <1> 86.793, <2> 86.793, <3> 86.793;

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
