set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.9884, <2> 12.5343, <3> 5.9431, <4> 44.9935, <5> 6.8851, <6> 31.2027, <7> 14.2183, <8> 1.3113, <9> 41.6082, <10> 32.7427;
param workload[JOB] := <1> 6.1635, <2> 3.5404, <3> 2.4378, <4> 6.7077, <5> 2.6239, <6> 5.5859, <7> 3.7707, <8> 1.1451, <9> 6.4504, <10> 5.7221;
param capacity[MACHINE] := <1> 14.7158, <2> 14.7158, <3> 14.7158;

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
