set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7021, <2> 22.2363, <3> 21.8379, <4> 25.0097, <5> 16.1183, <6> 30.5273, <7> 27.6622, <8> 20.301, <9> 26.1663, <10> 22.5418;
param workload[JOB] := <1> 25.7021, <2> 22.2363, <3> 21.8379, <4> 25.0097, <5> 16.1183, <6> 30.5273, <7> 27.6622, <8> 20.301, <9> 26.1663, <10> 22.5418;
param capacity[MACHINE] := <1> 238.1029, <2> 238.1029, <3> 238.1029;

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
