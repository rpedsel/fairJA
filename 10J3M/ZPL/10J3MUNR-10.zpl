set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.8725, <2> 0.3027, <3> 41.098, <4> 18.1642, <5> 17.4815, <6> 27.5163, <7> 10.3515, <8> 32.6348, <9> 21.7159, <10> 20.2816;
param workload[JOB] := <1> 1.8252, <2> 15.1031, <3> 33.6485, <4> 33.9852, <5> 9.2712, <6> 30.1022, <7> 1.6548, <8> 41.9881, <9> 3.4714, <10> 7.647;
param capacity[MACHINE] := <1> 178.6967, <2> 178.6967, <3> 178.6967;

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
