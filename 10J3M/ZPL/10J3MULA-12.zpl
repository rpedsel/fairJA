set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.9568, <2> 30.7574, <3> 11.3553, <4> 44.4687, <5> 14.897, <6> 41.9395, <7> 9.206, <8> 45.2328, <9> 11.0243, <10> 19.4106;
param workload[JOB] := <1> 1845.2867, <2> 946.0177, <3> 128.9428, <4> 1977.4653, <5> 221.9206, <6> 1758.9217, <7> 84.7504, <8> 2046.0062, <9> 121.5352, <10> 376.7714;
param capacity[MACHINE] := <1> 3169.206, <2> 3169.206, <3> 3169.206;

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
