set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.3094, <2> 31.5396, <3> 25.6841, <4> 24.3603, <5> 13.9257, <6> 18.7433, <7> 17.1907, <8> 22.1712, <9> 23.3925, <10> 24.755;
param workload[JOB] := <1> 801.4221, <2> 994.7464, <3> 659.673, <4> 593.4242, <5> 193.9251, <6> 351.3113, <7> 295.5202, <8> 491.5621, <9> 547.2091, <10> 612.81;
param capacity[MACHINE] := <1> 1385.4009, <2> 1385.4009, <3> 1385.4009;

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
