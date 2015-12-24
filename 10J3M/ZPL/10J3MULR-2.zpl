set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.9223, <2> 8.2609, <3> 29.6686, <4> 47.6024, <5> 44.6129, <6> 8.6457, <7> 37.9667, <8> 44.7907, <9> 35.5176, <10> 24.1613;
param workload[JOB] := <1> 30.1857, <2> 4.3491, <3> 27.6291, <4> 39.5942, <5> 33.1871, <6> 13.428, <7> 46.8633, <8> 48.9252, <9> 34.9359, <10> 12.2825;
param capacity[MACHINE] := <1> 97.1267, <2> 97.1267, <3> 97.1267;

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
