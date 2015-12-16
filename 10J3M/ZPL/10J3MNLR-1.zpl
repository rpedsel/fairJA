set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3484, <2> 24.2555, <3> 38.0745, <4> 25.3622, <5> 23.2222, <6> 33.9485, <7> 14.9689, <8> 19.3852, <9> 23.373, <10> 23.542;
param workload[JOB] := <1> 28.4137, <2> 10.8033, <3> 23.9296, <4> 36.0772, <5> 47.7506, <6> 34.5417, <7> 41.0459, <8> 34.2614, <9> 20.9742, <10> 7.5204;
param capacity[MACHINE] := <1> 95.106, <2> 95.106, <3> 95.106;

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
