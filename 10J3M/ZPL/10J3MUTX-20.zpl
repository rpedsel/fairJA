set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.2938, <2> 28.7563, <3> 4.168, <4> 47.594, <5> 23.0078, <6> 11.2169, <7> 35.2921, <8> 13.9659, <9> 21.4236, <10> 15.6191;
param workload[JOB] := <1> 4.8264, <2> 5.3625, <3> 2.0416, <4> 6.8988, <5> 4.7966, <6> 3.3492, <7> 5.9407, <8> 3.7371, <9> 4.6286, <10> 3.9521;
param capacity[MACHINE] := <1> 11.3834, <2> 11.3834, <3> 11.3834;

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
