set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.5444, <2> 30.6711, <3> 30.9896, <4> 28.7493, <5> 29.0327, <6> 23.4553, <7> 28.6927, <8> 27.6039, <9> 25.1048, <10> 26.2046;
param workload[JOB] := <1> 30.5444, <2> 30.6711, <3> 30.9896, <4> 28.7493, <5> 29.0327, <6> 23.4553, <7> 28.6927, <8> 27.6039, <9> 25.1048, <10> 26.2046;
param capacity[MACHINE] := <1> 281.0484, <2> 281.0484, <3> 281.0484;

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
