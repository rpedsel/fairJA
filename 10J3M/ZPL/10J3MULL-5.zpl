set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.1013, <2> 46.9531, <3> 5.6748, <4> 18.191, <5> 31.9144, <6> 18.4246, <7> 48.2957, <8> 15.6319, <9> 47.8882, <10> 38.3542;
param workload[JOB] := <1> 19.1013, <2> 46.9531, <3> 5.6748, <4> 18.191, <5> 31.9144, <6> 18.4246, <7> 48.2957, <8> 15.6319, <9> 47.8882, <10> 38.3542;
param capacity[MACHINE] := <1> 96.8097, <2> 96.8097, <3> 96.8097;

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
