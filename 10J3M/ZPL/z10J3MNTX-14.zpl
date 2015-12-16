set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.806, <2> 15.5549, <3> 31.9184, <4> 22.9764, <5> 35.1007, <6> 27.177, <7> 28.936, <8> 28.6391, <9> 30.7055, <10> 27.5924;
param workload[JOB] := <1> 5.1775, <2> 3.944, <3> 5.6496, <4> 4.7934, <5> 5.9246, <6> 5.2132, <7> 5.3792, <8> 5.3516, <9> 5.5413, <10> 5.2528;
param capacity[MACHINE] := <1> 13.0568, <2> 13.0568, <3> 13.0568;

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
