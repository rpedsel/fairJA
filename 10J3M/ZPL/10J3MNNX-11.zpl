set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.2019, <2> 23.677, <3> 23.21, <4> 28.2135, <5> 18.4455, <6> 30.4079, <7> 28.7652, <8> 12.093, <9> 25.9675, <10> 33.4421;
param workload[JOB] := <1> 4.4947, <2> 4.8659, <3> 4.8177, <4> 5.3116, <5> 4.2948, <6> 5.5143, <7> 5.3633, <8> 3.4775, <9> 5.0958, <10> 5.7829;
param capacity[MACHINE] := <1> 49.0185, <2> 49.0185, <3> 49.0185;

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
