set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.2858, <2> 27.9987, <3> 48.0207, <4> 21.2936, <5> 27.669, <6> 47.0832, <7> 39.8594, <8> 0.4863, <9> 37.3067, <10> 26.7283;
param workload[JOB] := <1> 18.4572, <2> 13.4179, <3> 18.2685, <4> 7.8411, <5> 47.1556, <6> 18.8581, <7> 34.5054, <8> 44.4597, <9> 20.5339, <10> 32.6164;
param capacity[MACHINE] := <1> 64.0285, <2> 64.0285, <3> 64.0285;

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
