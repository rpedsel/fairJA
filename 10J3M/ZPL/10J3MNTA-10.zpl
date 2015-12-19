set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.5526, <2> 28.0993, <3> 13.4163, <4> 26.8993, <5> 25.3125, <6> 17.7564, <7> 20.8078, <8> 21.1443, <9> 25.1624, <10> 28.9445;
param workload[JOB] := <1> 508.6198, <2> 789.5707, <3> 179.9971, <4> 723.5723, <5> 640.7227, <6> 315.2897, <7> 432.9645, <8> 447.0814, <9> 633.1464, <10> 837.7841;
param capacity[MACHINE] := <1> 1377.1872, <2> 1377.1872, <3> 1377.1872;

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
