set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.5486, <2> 1.052, <3> 18.3254, <4> 9.5317, <5> 46.4738, <6> 28.2502, <7> 49.6956, <8> 4.6667, <9> 23.8941, <10> 30.6006;
param workload[JOB] := <1> 3.9432, <2> 1.0257, <3> 4.2808, <4> 3.0873, <5> 6.8172, <6> 5.3151, <7> 7.0495, <8> 2.1603, <9> 4.8882, <10> 5.5318;
param capacity[MACHINE] := <1> 11.0248, <2> 11.0248, <3> 11.0248;

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
