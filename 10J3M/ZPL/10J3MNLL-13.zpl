set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.7086, <2> 28.0397, <3> 23.0762, <4> 21.8567, <5> 21.3661, <6> 17.5949, <7> 22.3594, <8> 30.904, <9> 17.8841, <10> 27.1215;
param workload[JOB] := <1> 27.7086, <2> 28.0397, <3> 23.0762, <4> 21.8567, <5> 21.3661, <6> 17.5949, <7> 22.3594, <8> 30.904, <9> 17.8841, <10> 27.1215;
param capacity[MACHINE] := <1> 79.3037, <2> 79.3037, <3> 79.3037;

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
