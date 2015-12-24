set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7567, <2> 29.523, <3> 36.1718, <4> 25.3915, <5> 29.8874, <6> 28.3442, <7> 19.7544, <8> 28.1328, <9> 22.2991, <10> 28.175;
param workload[JOB] := <1> 5.0751, <2> 5.4335, <3> 6.0143, <4> 5.039, <5> 5.4669, <6> 5.3239, <7> 4.4446, <8> 5.304, <9> 4.7222, <10> 5.308;
param capacity[MACHINE] := <1> 52.1315, <2> 52.1315, <3> 52.1315;

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
