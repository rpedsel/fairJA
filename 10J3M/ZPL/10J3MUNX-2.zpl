set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.1405, <2> 16.9123, <3> 23.1445, <4> 33.1956, <5> 35.4036, <6> 14.2662, <7> 23.4908, <8> 31.7669, <9> 22.5224, <10> 10.8339;
param workload[JOB] := <1> 4.375, <2> 4.1125, <3> 4.8109, <4> 5.7616, <5> 5.9501, <6> 3.7771, <7> 4.8467, <8> 5.6362, <9> 4.7458, <10> 3.2915;
param capacity[MACHINE] := <1> 47.3074, <2> 47.3074, <3> 47.3074;

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
