set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.6034, <2> 30.3959, <3> 9.851, <4> 12.3962, <5> 28.225, <6> 38.043, <7> 27.7156, <8> 42.6032, <9> 1.4728, <10> 15.5291;
param workload[JOB] := <1> 12.9845, <2> 923.9107, <3> 97.0422, <4> 153.6658, <5> 796.6506, <6> 1447.2698, <7> 768.1545, <8> 1815.0327, <9> 2.1691, <10> 241.1529;
param capacity[MACHINE] := <1> 1564.5082, <2> 1564.5082, <3> 1564.5082;

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
