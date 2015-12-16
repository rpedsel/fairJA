set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.8107, <2> 21.0676, <3> 21.1356, <4> 14.3176, <5> 17.822, <6> 25.1276, <7> 24.7737, <8> 29.5319, <9> 17.1208, <10> 34.2614, <11> 29.527, <12> 20.8, <13> 26.6647, <14> 21.6127, <15> 26.0396, <16> 31.5239, <17> 15.6936, <18> 24.3526, <19> 25.4551, <20> 25.7548;
param workload[JOB] := <1> 25.8107, <2> 21.0676, <3> 21.1356, <4> 14.3176, <5> 17.822, <6> 25.1276, <7> 24.7737, <8> 29.5319, <9> 17.1208, <10> 34.2614, <11> 29.527, <12> 20.8, <13> 26.6647, <14> 21.6127, <15> 26.0396, <16> 31.5239, <17> 15.6936, <18> 24.3526, <19> 25.4551, <20> 25.7548;
param capacity[MACHINE] := <1> 478.3929, <2> 478.3929, <3> 478.3929, <4> 478.3929, <5> 478.3929, <6> 478.3929;

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
