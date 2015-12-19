set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.9595, <2> 5.5203, <3> 13.1775, <4> 24.8537, <5> 14.435, <6> 17.3897, <7> 8.2719, <8> 31.0659, <9> 49.7308, <10> 19.4978;
param workload[JOB] := <1> 6.9253, <2> 2.3495, <3> 3.6301, <4> 4.9853, <5> 3.7993, <6> 4.1701, <7> 2.8761, <8> 5.5737, <9> 7.052, <10> 4.4156;
param capacity[MACHINE] := <1> 45.777, <2> 45.777, <3> 45.777;

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
