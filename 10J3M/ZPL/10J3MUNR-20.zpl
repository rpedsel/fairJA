set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.4861, <2> 34.5835, <3> 31.5223, <4> 32.3504, <5> 40.5222, <6> 7.6134, <7> 30.1297, <8> 47.2024, <9> 0.0405, <10> 18.929;
param workload[JOB] := <1> 30.7099, <2> 49.8829, <3> 46.8945, <4> 42.3353, <5> 14.1618, <6> 24.6241, <7> 24.3963, <8> 1.6399, <9> 32.1343, <10> 36.7217;
param capacity[MACHINE] := <1> 303.5007, <2> 303.5007, <3> 303.5007;

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
