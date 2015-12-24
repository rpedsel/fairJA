set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.285, <2> 19.425, <3> 19.9695, <4> 34.24, <5> 26.7627, <6> 23.611, <7> 19.2813, <8> 24.4762, <9> 26.0751, <10> 21.0536;
param workload[JOB] := <1> 31.9566, <2> 5.2891, <3> 21.3978, <4> 34.9437, <5> 32.3735, <6> 18.894, <7> 20.6623, <8> 13.6611, <9> 16.1267, <10> 45.2345;
param capacity[MACHINE] := <1> 60.1349, <2> 60.1349, <3> 60.1349;

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
