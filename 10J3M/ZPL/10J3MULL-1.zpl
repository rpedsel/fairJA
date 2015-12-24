set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.3621, <2> 1.3334, <3> 28.18, <4> 26.2258, <5> 15.1455, <6> 41.7071, <7> 15.3105, <8> 6.4318, <9> 6.6576, <10> 27.799;
param workload[JOB] := <1> 36.3621, <2> 1.3334, <3> 28.18, <4> 26.2258, <5> 15.1455, <6> 41.7071, <7> 15.3105, <8> 6.4318, <9> 6.6576, <10> 27.799;
param capacity[MACHINE] := <1> 68.3843, <2> 68.3843, <3> 68.3843;

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
