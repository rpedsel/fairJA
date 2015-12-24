set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.8251, <2> 17.8937, <3> 14.1527, <4> 26.3449, <5> 14.4992, <6> 23.0554, <7> 23.6537, <8> 25.1389, <9> 19.3526, <10> 16.1229;
param workload[JOB] := <1> 33.5229, <2> 8.2287, <3> 44.026, <4> 4.652, <5> 45.8118, <6> 42.0283, <7> 6.9102, <8> 29.0244, <9> 16.363, <10> 20.1938;
param capacity[MACHINE] := <1> 83.587, <2> 83.587, <3> 83.587;

var x[JM] binary;
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
