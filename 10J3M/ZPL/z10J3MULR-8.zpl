set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.0527, <2> 40.5099, <3> 4.9649, <4> 19.9754, <5> 49.3463, <6> 14.0129, <7> 19.7138, <8> 48.2398, <9> 7.4455, <10> 22.2422;
param workload[JOB] := <1> 3.2555, <2> 18.8319, <3> 4.1512, <4> 45.9404, <5> 35.359, <6> 9.2946, <7> 46.5221, <8> 49.7915, <9> 49.0827, <10> 26.9557;
param capacity[MACHINE] := <1> 96.3949, <2> 96.3949, <3> 96.3949;

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
