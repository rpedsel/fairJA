set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.8999, <2> 24.6465, <3> 23.8195, <4> 23.1295, <5> 20.1909, <6> 19.143, <7> 24.2625, <8> 18.1186, <9> 31.6175, <10> 13.2499;
param workload[JOB] := <1> 48.5823, <2> 45.7113, <3> 12.4233, <4> 19.8605, <5> 35.4059, <6> 24.8663, <7> 1.3602, <8> 47.148, <9> 42.6946, <10> 31.5029;
param capacity[MACHINE] := <1> 103.1851, <2> 103.1851, <3> 103.1851;

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
