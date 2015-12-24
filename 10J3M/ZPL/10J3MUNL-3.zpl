set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.5413, <2> 7.5136, <3> 4.4809, <4> 45.2445, <5> 0.4424, <6> 32.3945, <7> 8.56, <8> 49.4084, <9> 14.6844, <10> 11.4631;
param workload[JOB] := <1> 36.5413, <2> 7.5136, <3> 4.4809, <4> 45.2445, <5> 0.4424, <6> 32.3945, <7> 8.56, <8> 49.4084, <9> 14.6844, <10> 11.4631;
param capacity[MACHINE] := <1> 210.7331, <2> 210.7331, <3> 210.7331;

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
