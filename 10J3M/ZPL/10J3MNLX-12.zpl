set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.6797, <2> 28.8364, <3> 16.098, <4> 28.9983, <5> 22.3871, <6> 25.5501, <7> 27.6763, <8> 30.1268, <9> 20.5607, <10> 24.6713;
param workload[JOB] := <1> 5.4479, <2> 5.37, <3> 4.0122, <4> 5.385, <5> 4.7315, <6> 5.0547, <7> 5.2608, <8> 5.4888, <9> 4.5344, <10> 4.967;
param capacity[MACHINE] := <1> 16.7508, <2> 16.7508, <3> 16.7508;

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
