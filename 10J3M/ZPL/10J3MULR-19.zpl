set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.3562, <2> 29.0135, <3> 34.1484, <4> 2.2484, <5> 32.0595, <6> 30.2476, <7> 34.9558, <8> 33.8817, <9> 4.0857, <10> 15.7397;
param workload[JOB] := <1> 16.8645, <2> 16.5065, <3> 43.1193, <4> 13.9017, <5> 43.4768, <6> 23.8285, <7> 47.4258, <8> 38.4842, <9> 49.1525, <10> 39.1569;
param capacity[MACHINE] := <1> 110.6389, <2> 110.6389, <3> 110.6389;

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
