set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2037, <2> 25.8534, <3> 24.0156, <4> 24.5842, <5> 25.0024, <6> 13.3698, <7> 30.3758, <8> 23.5881, <9> 19.0748, <10> 29.9481;
param workload[JOB] := <1> 48.2152, <2> 22.6689, <3> 26.6194, <4> 47.9214, <5> 33.686, <6> 46.0786, <7> 0.0065, <8> 21.4128, <9> 38.5684, <10> 19.5292;
param capacity[MACHINE] := <1> 101.5688, <2> 101.5688, <3> 101.5688;

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
