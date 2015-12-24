set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.4416, <2> 46.3107, <3> 49.9024, <4> 38.0069, <5> 16.3533, <6> 24.4343, <7> 15.1133, <8> 4.4071, <9> 1.6307, <10> 30.3843;
param workload[JOB] := <1> 3.3825, <2> 6.8052, <3> 7.0642, <4> 6.165, <5> 4.0439, <6> 4.9431, <7> 3.8876, <8> 2.0993, <9> 1.277, <10> 5.5122;
param capacity[MACHINE] := <1> 11.295, <2> 11.295, <3> 11.295;

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
