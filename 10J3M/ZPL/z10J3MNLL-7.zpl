set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.5704, <2> 21.9392, <3> 21.6382, <4> 24.3003, <5> 22.2119, <6> 26.8102, <7> 27.0913, <8> 16.371, <9> 27.744, <10> 30.4955;
param workload[JOB] := <1> 29.5704, <2> 21.9392, <3> 21.6382, <4> 24.3003, <5> 22.2119, <6> 26.8102, <7> 27.0913, <8> 16.371, <9> 27.744, <10> 30.4955;
param capacity[MACHINE] := <1> 82.724, <2> 82.724, <3> 82.724;

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
