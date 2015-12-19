set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.9699, <2> 47.9923, <3> 46.9946, <4> 30.0206, <5> 27.6523, <6> 39.5198, <7> 27.849, <8> 25.3765, <9> 7.122, <10> 49.1765;
param workload[JOB] := <1> 40.8841, <2> 29.6587, <3> 20.2347, <4> 14.1707, <5> 23.849, <6> 47.9319, <7> 48.2828, <8> 27.3918, <9> 43.9201, <10> 17.5777;
param capacity[MACHINE] := <1> 104.6338, <2> 104.6338, <3> 104.6338;

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
