set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.0965, <2> 30.5048, <3> 27.2331, <4> 22.8283, <5> 22.2727, <6> 17.2232, <7> 24.8104, <8> 23.819, <9> 22.6938, <10> 31.6542;
param workload[JOB] := <1> 27.0965, <2> 30.5048, <3> 27.2331, <4> 22.8283, <5> 22.2727, <6> 17.2232, <7> 24.8104, <8> 23.819, <9> 22.6938, <10> 31.6542;
param capacity[MACHINE] := <1> 62.534, <2> 62.534, <3> 62.534;

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
