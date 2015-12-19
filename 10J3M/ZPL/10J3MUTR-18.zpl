set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.856, <2> 38.2168, <3> 22.3568, <4> 32.4152, <5> 21.6622, <6> 15.0636, <7> 20.7331, <8> 31.5308, <9> 26.0128, <10> 1.127;
param workload[JOB] := <1> 23.7604, <2> 32.6364, <3> 15.9087, <4> 12.6581, <5> 25.5743, <6> 36.7253, <7> 14.4333, <8> 21.7932, <9> 27.4519, <10> 2.2816;
param capacity[MACHINE] := <1> 53.3058, <2> 53.3058, <3> 53.3058;

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
