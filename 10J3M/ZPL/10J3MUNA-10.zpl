set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.0295, <2> 39.132, <3> 30.1118, <4> 29.876, <5> 19.4164, <6> 7.3085, <7> 1.1037, <8> 14.9206, <9> 6.7578, <10> 4.6324;
param workload[JOB] := <1> 1523.3019, <2> 1531.3134, <3> 906.7205, <4> 892.5754, <5> 376.9966, <6> 53.4142, <7> 1.2182, <8> 222.6243, <9> 45.6679, <10> 21.4591;
param capacity[MACHINE] := <1> 5575.2915, <2> 5575.2915, <3> 5575.2915;

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
